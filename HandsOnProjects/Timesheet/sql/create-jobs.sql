USE msdb;
GO

DECLARE @sql_server NVARCHAR(128) = '$SQL_SERVER';
DECLARE @start_date INT = $START_DATE; -- YYYYMMDD
DECLARE @start_time INT = $START_TIME; -- HHMMSS

DECLARE @job_name NVARCHAR(128);
DECLARE @schedule_name NVARCHAR(128);
DECLARE @command NVARCHAR(MAX);
DECLARE @schedule_id INT;

-- Helper to delete schedules safely
CREATE TABLE #SchedulesToDelete (schedule_id INT);

DECLARE @schedule_names TABLE (name NVARCHAR(128));
INSERT INTO @schedule_names (name)
VALUES
    ('Every2Min_BillableTypePackage'),
    ('Every2Min_ClientPackage'),
    ('Every2Min_LeaveStaging'),
    ('Every2Min_ConsultantPackage'),
    ('Every2Min_Employee'),
    ('Every2Min_DescriptionPackage'),
    ('Every2Min_Package1');

DECLARE @target_name NVARCHAR(128);
DECLARE schedule_cursor CURSOR FOR SELECT name FROM @schedule_names;
OPEN schedule_cursor;
FETCH NEXT FROM schedule_cursor INTO @target_name;
WHILE @@FETCH_STATUS = 0
BEGIN
    INSERT INTO #SchedulesToDelete (schedule_id)
    SELECT schedule_id FROM msdb.dbo.sysschedules WHERE name = @target_name;

    DECLARE @sid INT;
    DECLARE scheduleid_cursor CURSOR FOR SELECT schedule_id FROM #SchedulesToDelete;
    OPEN scheduleid_cursor;
    FETCH NEXT FROM scheduleid_cursor INTO @sid;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Detach from all jobs
        EXEC msdb.dbo.sp_detach_schedule @schedule_id = @sid;
        -- Now safe to delete
        EXEC msdb.dbo.sp_delete_schedule @schedule_id = @sid;
        FETCH NEXT FROM scheduleid_cursor INTO @sid;
    END
    CLOSE scheduleid_cursor;
    DEALLOCATE scheduleid_cursor;

    DELETE FROM #SchedulesToDelete;
    FETCH NEXT FROM schedule_cursor INTO @target_name;
END
CLOSE schedule_cursor;
DEALLOCATE schedule_cursor;
DROP TABLE #SchedulesToDelete;

-- === Job Definitions Start ===

DECLARE @jobs TABLE (
    job_name NVARCHAR(128),
    schedule_name NVARCHAR(128),
    package_path NVARCHAR(256)
);

INSERT INTO @jobs (job_name, schedule_name, package_path)
VALUES
('RunSSIS_BillableTypePackage', 'Every2Min_BillableTypePackage', 'BillableTypePackage.dtsx'),
('RunSSIS_ClientPackage', 'Every2Min_ClientPackage', 'ClientPackage.dtsx'),
('RunSSIS_LeaveStaging', 'Every2Min_LeaveStaging', 'LeaveStaging.dtsx'),
('RunSSIS_ConsultantPackage', 'Every2Min_ConsultantPackage', 'ConsultantPackage.dtsx'),
('RunSSIS_Employee', 'Every2Min_Employee', 'Employee.dtsx'),
('RunSSIS_DescriptionPackage', 'Every2Min_DescriptionPackage', 'DescriptionPackage.dtsx'),
('RunSSIS_Package1', 'Every2Min_Package1', 'Package1.dtsx');

DECLARE @pkg_name NVARCHAR(128), @pkg_schedule NVARCHAR(128), @pkg_file NVARCHAR(256);
DECLARE job_cursor CURSOR FOR
    SELECT job_name, schedule_name, package_path FROM @jobs;

OPEN job_cursor;
FETCH NEXT FROM job_cursor INTO @pkg_name, @pkg_schedule, @pkg_file;
WHILE @@FETCH_STATUS = 0
BEGIN
    BEGIN TRY
        EXEC msdb.dbo.sp_delete_job @job_name = @pkg_name;
    END TRY BEGIN CATCH END CATCH;

    EXEC msdb.dbo.sp_add_job @job_name = @pkg_name, @enabled = 1;

    SET @command = '/ISSERVER "SSISDB\Automation\Integration Services Project2\' + @pkg_file + '" /SERVER "' + @sql_server + '"';

    EXEC msdb.dbo.sp_add_jobstep
        @job_name = @pkg_name,
        @step_name = 'Run SSIS Package',
        @subsystem = 'SSIS',
        @command = @command,
        @on_success_action = 1,
        @database_name = 'SSISDB';

    SET @schedule_id = NULL;
    EXEC msdb.dbo.sp_add_schedule
        @schedule_name = @pkg_schedule,
        @enabled = 1,
        @freq_type = 4,
        @freq_interval = 1,
        @freq_subday_type = 4,
        @freq_subday_interval = 2,
        @active_start_date = @start_date,
        @active_start_time = @start_time,
        @schedule_id = @schedule_id OUTPUT;

    EXEC msdb.dbo.sp_attach_schedule
        @job_name = @pkg_name,
        @schedule_id = @schedule_id;

    EXEC msdb.dbo.sp_add_jobserver @job_name = @pkg_name;

    FETCH NEXT FROM job_cursor INTO @pkg_name, @pkg_schedule, @pkg_file;
END
CLOSE job_cursor;
DEALLOCATE job_cursor;
GO

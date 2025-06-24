USE msdb;
GO

DECLARE @sql_server NVARCHAR(128) = '$SQL_SERVER';
DECLARE @sql_username NVARCHAR(128) = '$SQL_USER';
DECLARE @start_date INT = $START_DATE; -- YYYYMMDD
DECLARE @start_time INT = $START_TIME; -- HHMMSS

-- Job for BillableTypePackage
DECLARE @job_name NVARCHAR(128) = 'RunSSIS_BillableTypePackage';
DECLARE @schedule_name NVARCHAR(128) = 'Every2Min_BillableTypePackage';

IF EXISTS (SELECT * FROM msdb.dbo.sysjobs WHERE name = @job_name)
BEGIN
    EXEC msdb.dbo.sp_delete_job @job_name = @job_name;
END;

EXEC msdb.dbo.sp_add_job
    @job_name = @job_name,
    @enabled = 1,
    @owner_login_name = @sql_username;

EXEC msdb.dbo.sp_add_jobstep
    @job_name = @job_name,
    @step_name = 'Run SSIS Package',
    @subsystem = 'SSIS',
    @command = '/ISSERVER "SSISDB\Automation\Integration Services Project2\BillableTypePackage.dtsx" /SERVER "' + @sql_server + '"',
    @on_success_action = 1,
    @database_name = 'SSISDB';

DECLARE @schedule_id INT;
EXEC msdb.dbo.sp_add_schedule
    @schedule_name = @schedule_name,
    @enabled = 1,
    @freq_type = 4, -- Daily
    @freq_interval = 1, -- Every day
    @freq_subday_type = 4, -- Minutes
    @freq_subday_interval = 2, -- Every 2 minutes
    @active_start_date = @start_date,
    @active_start_time = @start_time,
    @schedule_id = @schedule_id OUTPUT;

EXEC msdb.dbo.sp_attach_schedule
    @job_name = @job_name,
    @schedule_name = @schedule_name;

EXEC msdb.dbo.sp_add_jobserver
    @job_name = @job_name;

-- Job for ClientPackage
SET @job_name = 'RunSSIS_ClientPackage';
SET @schedule_name = 'Every2Min_ClientPackage';

IF EXISTS (SELECT * FROM msdb.dbo.sysjobs WHERE name = @job_name)
BEGIN
    EXEC msdb.dbo.sp_delete_job @job_name = @job_name;
END;

EXEC msdb.dbo.sp_add_job
    @job_name = @job_name,
    @enabled = 1,
    @owner_login_name = @sql_username;

EXEC msdb.dbo.sp_add_jobstep
    @job_name = @job_name,
    @step_name = 'Run SSIS Package',
    @subsystem = 'SSIS',
    @command = '/ISSERVER "SSISDB\Automation\Integration Services Project2\ClientPackage.dtsx" /SERVER "' + @sql_server + '"',
    @on_success_action = 1,
    @database_name = 'SSISDB';

DECLARE @schedule_id INT;
EXEC msdb.dbo.sp_add_schedule
    @schedule_name = @schedule_name,
    @enabled = 1,
    @freq_type = 4,
    @freq_interval = 1,
    @freq_subday_type = 4,
    @freq_subday_interval = 2,
    @active_start_date = @start_date,
    @active_start_time = @start_time,
    @schedule_id = @schedule_id OUTPUT;

EXEC msdb.dbo.sp_attach_schedule
    @job_name = @job_name,
    @schedule_name = @schedule_name;

EXEC msdb.dbo.sp_add_jobserver
    @job_name = @job_name;

-- Job for LeaveStaging
SET @job_name = 'RunSSIS_LeaveStaging';
SET @schedule_name = 'Every2Min_LeaveStaging';

IF EXISTS (SELECT * FROM msdb.dbo.sysjobs WHERE name = @job_name)
BEGIN
    EXEC msdb.dbo.sp_delete_job @job_name = @job_name;
END;

EXEC msdb.dbo.sp_add_job
    @job_name = @job_name,
    @enabled = 1,
    @owner_login_name = @sql_username;

EXEC msdb.dbo.sp_add_jobstep
    @job_name = @job_name,
    @step_name = 'Run SSIS Package',
    @subsystem = 'SSIS',
    @command = '/ISSERVER "SSISDB\Automation\Integration Services Project2\LeaveStaging.dtsx" /SERVER "' + @sql_server + '"',
    @on_success_action = 1,
    @database_name = 'SSISDB';

DECLARE @schedule_id INT;
EXEC msdb.dbo.sp_add_schedule
    @schedule_name = @schedule_name,
    @enabled = 1,
    @freq_type = 4,
    @freq_interval = 1,
    @freq_subday_type = 4,
    @freq_subday_interval = 2,
    @active_start_date = @start_date,
    @active_start_time = @start_time,
    @schedule_id = @schedule_id OUTPUT;

EXEC msdb.dbo.sp_attach_schedule
    @job_name = @job_name,
    @schedule_name = @schedule_name;

EXEC msdb.dbo.sp_add_jobserver
    @job_name = @job_name;

-- Job for ConsultantPackage
SET @job_name = 'RunSSIS_ConsultantPackage';
SET @schedule_name = 'Every2Min_ConsultantPackage';

IF EXISTS (SELECT * FROM msdb.dbo.sysjobs WHERE name = @job_name)
BEGIN
    EXEC msdb.dbo.sp_delete_job @job_name = @job_name;
END;

EXEC msdb.dbo.sp_add_job
    @job_name = @job_name,
    @enabled = 1,
    @owner_login_name = @sql_username;

EXEC msdb.dbo.sp_add_jobstep
    @job_name = @job_name,
    @step_name = 'Run SSIS Package',
    @subsystem = 'SSIS',
    @command = '/ISSERVER "SSISDB\Automation\Integration Services Project2\ConsultantPackage.dtsx" /SERVER "' + @sql_server + '"',
    @on_success_action = 1,
    @database_name = 'SSISDB';

DECLARE @schedule_id INT;
EXEC msdb.dbo.sp_add_schedule
    @schedule_name = @schedule_name,
    @enabled = 1,
    @freq_type = 4,
    @freq_interval = 1,
    @freq_subday_type = 4,
    @freq_subday_interval = 2,
    @active_start_date = @start_date,
    @active_start_time = @start_time,
    @schedule_id = @schedule_id OUTPUT;

EXEC msdb.dbo.sp_attach_schedule
    @job_name = @job_name,
    @schedule_name = @schedule_name;

EXEC msdb.dbo.sp_add_jobserver
    @job_name = @job_name;

-- Job for Employee
SET @job_name = 'RunSSIS_Employee';
SET @schedule_name = 'Every2Min_Employee';

IF EXISTS (SELECT * FROM msdb.dbo.sysjobs WHERE name = @job_name)
BEGIN
    EXEC msdb.dbo.sp_delete_job @job_name = @job_name;
END;

EXEC msdb.dbo.sp_add_job
    @job_name = @job_name,
    @enabled = 1,
    @owner_login_name = @sql_username;

EXEC msdb.dbo.sp_add_jobstep
    @job_name = @job_name,
    @step_name = 'Run SSIS Package',
    @subsystem = 'SSIS',
    @command = '/ISSERVER "SSISDB\Automation\Integration Services Project2\Employee.dtsx" /SERVER "' + @sql_server + '"',
    @on_success_action = 1,
    @database_name = 'SSISDB';

DECLARE @schedule_id INT;
EXEC msdb.dbo.sp_add_schedule
    @schedule_name = @schedule_name,
    @enabled = 1,
    @freq_type = 4,
    @freq_interval = 1,
    @freq_subday_type = 4,
    @freq_subday_interval = 2,
    @active_start_date = @start_date,
    @active_start_time = @start_time,
    @schedule_id = @schedule_id OUTPUT;

EXEC msdb.dbo.sp_attach_schedule
    @job_name = @job_name,
    @schedule_name = @schedule_name;

EXEC msdb.dbo.sp_add_jobserver
    @job_name = @job_name;

-- Job for DescriptionPackage
SET @job_name = 'RunSSIS_DescriptionPackage';
SET @schedule_name = 'Every2Min_DescriptionPackage';

IF EXISTS (SELECT * FROM msdb.dbo.sysjobs WHERE name = @job_name)
BEGIN
    EXEC msdb.dbo.sp_delete_job @job_name = @job_name;
END;

EXEC msdb.dbo.sp_add_job
    @job_name = @job_name,
    @enabled = 1,
    @owner_login_name = @sql_username;

EXEC msdb.dbo.sp_add_jobstep
    @job_name = @job_name,
    @step_name = 'Run SSIS Package',
    @subsystem = 'SSIS',
    @command = '/ISSERVER "SSISDB\Automation\Integration Services Project2\DescriptionPackage.dtsx" /SERVER "' + @sql_server + '"',
    @on_success_action = 1,
    @database_name = 'SSISDB';

DECLARE @schedule_id INT;
EXEC msdb.dbo.sp_add_schedule
    @schedule_name = @schedule_name,
    @enabled = 1,
    @freq_type = 4,
    @freq_interval = 1,
    @freq_subday_type = 4,
    @freq_subday_interval = 2,
    @active_start_date = @start_date,
    @active_start_time = @start_time,
    @schedule_id = @schedule_id OUTPUT;

EXEC msdb.dbo.sp_attach_schedule
    @job_name = @job_name,
    @schedule_name = @schedule_name;

EXEC msdb.dbo.sp_add_jobserver
    @job_name = @job_name;

-- Job for Package1
SET @job_name = 'RunSSIS_Package1';
SET @schedule_name = 'Every2Min_Package1';

IF EXISTS (SELECT * FROM msdb.dbo.sysjobs WHERE name = @job_name)
BEGIN
    EXEC msdb.dbo.sp_delete_job @job_name = @job_name;
END;

EXEC msdb.dbo.sp_add_job
    @job_name = @job_name,
    @enabled = 1,
    @owner_login_name = @sql_username;

EXEC msdb.dbo.sp_add_jobstep
    @job_name = @job_name,
    @step_name = 'Run SSIS Package',
    @subsystem = 'SSIS',
    @command = '/ISSERVER "SSISDB\Automation\Integration Services Project2\Package1.dtsx" /SERVER "' + @sql_server + '"',
    @on_success_action = 1,
    @database_name = 'SSISDB';

DECLARE @schedule_id INT;
EXEC msdb.dbo.sp_add_schedule
    @schedule_name = @schedule_name,
    @enabled = 1,
    @freq_type = 4,
    @freq_interval = 1,
    @freq_subday_type = 4,
    @freq_subday_interval = 2,
    @active_start_date = @start_date,
    @active_start_time = @start_time,
    @schedule_id = @schedule_id OUTPUT;

EXEC msdb.dbo.sp_attach_schedule
    @job_name = @job_name,
    @schedule_name = @schedule_name;

EXEC msdb.dbo.sp_add_jobserver
    @job_name = @job_name;
GO
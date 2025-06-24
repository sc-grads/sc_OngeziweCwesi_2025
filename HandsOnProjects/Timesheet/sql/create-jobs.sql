USE msdb;
GO

DECLARE @sql_server NVARCHAR(128) = '$SQL_SERVER';
DECLARE @start_date INT = $START_DATE; -- YYYYMMDD
DECLARE @start_time INT = $START_TIME; -- HHMMSS

DECLARE @job_name NVARCHAR(128);
DECLARE @schedule_name NVARCHAR(128);
DECLARE @command NVARCHAR(MAX);

-- BillableTypePackage
SET @job_name = 'RunSSIS_BillableTypePackage';
SET @schedule_name = 'Every2Min_BillableTypePackage';
DECLARE @schedule_id_billable INT;
BEGIN TRY
    EXEC msdb.dbo.sp_delete_job @job_name = @job_name;
END TRY BEGIN CATCH
    PRINT 'Job not found or could not be deleted';
END CATCH;
EXEC msdb.dbo.sp_add_job @job_name = @job_name, @enabled = 1;
SET @command = '/ISSERVER "SSISDB\Automation\Integration Services Project2\BillableTypePackage.dtsx" /SERVER "' + @sql_server + '"';
EXEC msdb.dbo.sp_add_jobstep @job_name = @job_name, @step_name = 'Run SSIS Package', @subsystem = 'SSIS', @command = @command, @on_success_action = 1, @database_name = 'SSISDB';
EXEC msdb.dbo.sp_add_schedule @schedule_name = @schedule_name, @enabled = 1, @freq_type = 4, @freq_interval = 1, @freq_subday_type = 4, @freq_subday_interval = 2, @active_start_date = @start_date, @active_start_time = @start_time, @schedule_id = @schedule_id_billable OUTPUT;
EXEC msdb.dbo.sp_attach_schedule @job_name = @job_name, @schedule_name = @schedule_name;
EXEC msdb.dbo.sp_add_jobserver @job_name = @job_name;

-- Repeat pattern for other packages
DECLARE @schedule_id_client INT;
SET @job_name = 'RunSSIS_ClientPackage';
SET @schedule_name = 'Every2Min_ClientPackage';
BEGIN TRY EXEC msdb.dbo.sp_delete_job @job_name = @job_name; END TRY BEGIN CATCH PRINT 'Job not found'; END CATCH;
EXEC msdb.dbo.sp_add_job @job_name = @job_name, @enabled = 1;
SET @command = '/ISSERVER "SSISDB\Automation\Integration Services Project2\ClientPackage.dtsx" /SERVER "' + @sql_server + '"';
EXEC msdb.dbo.sp_add_jobstep @job_name = @job_name, @step_name = 'Run SSIS Package', @subsystem = 'SSIS', @command = @command, @on_success_action = 1, @database_name = 'SSISDB';
EXEC msdb.dbo.sp_add_schedule @schedule_name = @schedule_name, @enabled = 1, @freq_type = 4, @freq_interval = 1, @freq_subday_type = 4, @freq_subday_interval = 2, @active_start_date = @start_date, @active_start_time = @start_time, @schedule_id = @schedule_id_client OUTPUT;
EXEC msdb.dbo.sp_attach_schedule @job_name = @job_name, @schedule_name = @schedule_name;
EXEC msdb.dbo.sp_add_jobserver @job_name = @job_name;

DECLARE @schedule_id_leave INT;
SET @job_name = 'RunSSIS_LeaveStaging';
SET @schedule_name = 'Every2Min_LeaveStaging';
BEGIN TRY EXEC msdb.dbo.sp_delete_job @job_name = @job_name; END TRY BEGIN CATCH PRINT 'Job not found'; END CATCH;
EXEC msdb.dbo.sp_add_job @job_name = @job_name, @enabled = 1;
SET @command = '/ISSERVER "SSISDB\Automation\Integration Services Project2\LeaveStaging.dtsx" /SERVER "' + @sql_server + '"';
EXEC msdb.dbo.sp_add_jobstep @job_name = @job_name, @step_name = 'Run SSIS Package', @subsystem = 'SSIS', @command = @command, @on_success_action = 1, @database_name = 'SSISDB';
EXEC msdb.dbo.sp_add_schedule @schedule_name = @schedule_name, @enabled = 1, @freq_type = 4, @freq_interval = 1, @freq_subday_type = 4, @freq_subday_interval = 2, @active_start_date = @start_date, @active_start_time = @start_time, @schedule_id = @schedule_id_leave OUTPUT;
EXEC msdb.dbo.sp_attach_schedule @job_name = @job_name, @schedule_name = @schedule_name;
EXEC msdb.dbo.sp_add_jobserver @job_name = @job_name;

DECLARE @schedule_id_consultant INT;
SET @job_name = 'RunSSIS_ConsultantPackage';
SET @schedule_name = 'Every2Min_ConsultantPackage';
BEGIN TRY EXEC msdb.dbo.sp_delete_job @job_name = @job_name; END TRY BEGIN CATCH PRINT 'Job not found'; END CATCH;
EXEC msdb.dbo.sp_add_job @job_name = @job_name, @enabled = 1;
SET @command = '/ISSERVER "SSISDB\Automation\Integration Services Project2\ConsultantPackage.dtsx" /SERVER "' + @sql_server + '"';
EXEC msdb.dbo.sp_add_jobstep @job_name = @job_name, @step_name = 'Run SSIS Package', @subsystem = 'SSIS', @command = @command, @on_success_action = 1, @database_name = 'SSISDB';
EXEC msdb.dbo.sp_add_schedule @schedule_name = @schedule_name, @enabled = 1, @freq_type = 4, @freq_interval = 1, @freq_subday_type = 4, @freq_subday_interval = 2, @active_start_date = @start_date, @active_start_time = @start_time, @schedule_id = @schedule_id_consultant OUTPUT;
EXEC msdb.dbo.sp_attach_schedule @job_name = @job_name, @schedule_name = @schedule_name;
EXEC msdb.dbo.sp_add_jobserver @job_name = @job_name;

DECLARE @schedule_id_employee INT;
SET @job_name = 'RunSSIS_Employee';
SET @schedule_name = 'Every2Min_Employee';
BEGIN TRY EXEC msdb.dbo.sp_delete_job @job_name = @job_name; END TRY BEGIN CATCH PRINT 'Job not found'; END CATCH;
EXEC msdb.dbo.sp_add_job @job_name = @job_name, @enabled = 1;
SET @command = '/ISSERVER "SSISDB\Automation\Integration Services Project2\Employee.dtsx" /SERVER "' + @sql_server + '"';
EXEC msdb.dbo.sp_add_jobstep @job_name = @job_name, @step_name = 'Run SSIS Package', @subsystem = 'SSIS', @command = @command, @on_success_action = 1, @database_name = 'SSISDB';
EXEC msdb.dbo.sp_add_schedule @schedule_name = @schedule_name, @enabled = 1, @freq_type = 4, @freq_interval = 1, @freq_subday_type = 4, @freq_subday_interval = 2, @active_start_date = @start_date, @active_start_time = @start_time, @schedule_id = @schedule_id_employee OUTPUT;
EXEC msdb.dbo.sp_attach_schedule @job_name = @job_name, @schedule_name = @schedule_name;
EXEC msdb.dbo.sp_add_jobserver @job_name = @job_name;

DECLARE @schedule_id_description INT;
SET @job_name = 'RunSSIS_DescriptionPackage';
SET @schedule_name = 'Every2Min_DescriptionPackage';
BEGIN TRY EXEC msdb.dbo.sp_delete_job @job_name = @job_name; END TRY BEGIN CATCH PRINT 'Job not found'; END CATCH;
EXEC msdb.dbo.sp_add_job @job_name = @job_name, @enabled = 1;
SET @command = '/ISSERVER "SSISDB\Automation\Integration Services Project2\DescriptionPackage.dtsx" /SERVER "' + @sql_server + '"';
EXEC msdb.dbo.sp_add_jobstep @job_name = @job_name, @step_name = 'Run SSIS Package', @subsystem = 'SSIS', @command = @command, @on_success_action = 1, @database_name = 'SSISDB';
EXEC msdb.dbo.sp_add_schedule @schedule_name = @schedule_name, @enabled = 1, @freq_type = 4, @freq_interval = 1, @freq_subday_type = 4, @freq_subday_interval = 2, @active_start_date = @start_date, @active_start_time = @start_time, @schedule_id = @schedule_id_description OUTPUT;
EXEC msdb.dbo.sp_attach_schedule @job_name = @job_name, @schedule_name = @schedule_name;
EXEC msdb.dbo.sp_add_jobserver @job_name = @job_name;

DECLARE @schedule_id_package1 INT;
SET @job_name = 'RunSSIS_Package1';
SET @schedule_name = 'Every2Min_Package1';
BEGIN TRY EXEC msdb.dbo.sp_delete_job @job_name = @job_name; END TRY BEGIN CATCH PRINT 'Job not found'; END CATCH;
EXEC msdb.dbo.sp_add_job @job_name = @job_name, @enabled = 1;
SET @command = '/ISSERVER "SSISDB\Automation\Integration Services Project2\Package1.dtsx" /SERVER "' + @sql_server + '"';
EXEC msdb.dbo.sp_add_jobstep @job_name = @job_name, @step_name = 'Run SSIS Package', @subsystem = 'SSIS', @command = @command, @on_success_action = 1, @database_name = 'SSISDB';
EXEC msdb.dbo.sp_add_schedule @schedule_name = @schedule_name, @enabled = 1, @freq_type = 4, @freq_interval = 1, @freq_subday_type = 4, @freq_subday_interval = 2, @active_start_date = @start_date, @active_start_time = @start_time, @schedule_id = @schedule_id_package1 OUTPUT;
EXEC msdb.dbo.sp_attach_schedule @job_name = @job_name, @schedule_name = @schedule_name;
EXEC msdb.dbo.sp_add_jobserver @job_name = @job_name;
GO

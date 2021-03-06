--SQL JOB AGENT MANAGEMENT
--Start Job When Not Running:
DECLARE @JOB_NAME SYSNAME = N'SQLJobName'; 
 
IF NOT EXISTS(     
        select 1 
        from msdb.dbo.sysjobs_view job  
        inner join msdb.dbo.sysjobactivity activity on job.job_id = activity.job_id 
        where  
            activity.run_Requested_date is not null  
        and activity.stop_execution_date is null  
        and job.name = @JOB_NAME 
        ) 
BEGIN      
    PRINT 'Starting job ''' + @JOB_NAME + ''''; 
    EXEC msdb.dbo.sp_start_job @JOB_NAME; 
END 
ELSE 
BEGIN 
    PRINT 'Job ''' + @JOB_NAME + ''' is already started '; 
END
GO
IF  DATEPART(day,DATEADD(dd, 0, datediff(day, 0, getdate())))=1
	BEGIN 
	EXEC msdb.dbo.sp_start_job 'JobName'
	END

IF DATEPART(dw,GETDATE()) = 2
        BEGIN
               EXEC msdb.dbo.sp_start_job 'JobName'
        END

IF DATEPART(DAY,GETDATE()) = 1
	BEGIN
		EXEC msdb.dbo.sp_start_job 'JobName'
	END

IF DATEPART(DAY,GETDATE()) = 1
	BEGIN
		EXEC msdb.dbo.sp_start_job 'JobName'
	END

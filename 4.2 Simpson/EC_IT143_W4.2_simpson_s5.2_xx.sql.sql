
DROP TABLE IF EXISTS dbo.t_simpson_job_title;
GO

CREATE TABLE dbo.t_simpson_job_title
(
    title              VARCHAR(50) NOT NULL,

    CONSTRAINT pk_t_simpson_job_title
        PRIMARY KEY CLUSTERED (title ASC)
);
GO

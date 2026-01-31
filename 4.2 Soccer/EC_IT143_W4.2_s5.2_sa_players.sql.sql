
DROP TABLE IF EXISTS dbo.t_first_player;
GO

CREATE TABLE dbo.t_first_player
(
    pl_id     INT NOT NULL,
    pl_name   VARCHAR(100) NOT NULL,

    CONSTRAINT pk_t_first_player
        PRIMARY KEY CLUSTERED (pl_id ASC)
);
GO

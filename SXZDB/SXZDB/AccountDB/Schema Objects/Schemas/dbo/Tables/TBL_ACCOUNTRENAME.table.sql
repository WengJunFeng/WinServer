﻿CREATE TABLE [dbo].[TBL_ACCOUNTRENAME] (
    [ID]         INT          IDENTITY (1, 1) NOT NULL,
    [ACCOUNTID]  INT          NOT NULL,
    [OLDNAME]    VARCHAR (50) NOT NULL,
    [NEWNAME]    VARCHAR (50) NOT NULL,
    [CREATEDATE] DATETIME     NOT NULL
);


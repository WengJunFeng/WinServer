﻿ALTER TABLE [dbo].[TBL_ACCOUNTRENAME]
    ADD CONSTRAINT [DF_TBL_ACCOUNTRENAME_TIME] DEFAULT (getdate()) FOR [CREATEDATE];


﻿ALTER TABLE [dbo].[TBL_CmdConfig]
    ADD CONSTRAINT [PK_TBL_CmdConfig] PRIMARY KEY CLUSTERED ([Code] ASC, [Type] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


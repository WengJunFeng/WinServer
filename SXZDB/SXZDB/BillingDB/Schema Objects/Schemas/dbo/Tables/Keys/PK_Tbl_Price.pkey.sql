﻿ALTER TABLE [dbo].[Tbl_Price]
    ADD CONSTRAINT [PK_Tbl_Price] PRIMARY KEY CLUSTERED ([PriceID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

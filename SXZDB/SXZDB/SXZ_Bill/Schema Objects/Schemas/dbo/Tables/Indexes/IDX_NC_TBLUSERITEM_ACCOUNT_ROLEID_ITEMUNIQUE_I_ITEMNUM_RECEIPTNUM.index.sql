﻿CREATE NONCLUSTERED INDEX [IDX_NC_TBLUSERITEM_ACCOUNT_ROLEID_ITEMUNIQUE_I_ITEMNUM_RECEIPTNUM]
    ON [dbo].[TBL_USERITEM]([ACCOUNTID] ASC, [ROLEID] ASC, [ITEMUNIQUE] ASC)
    INCLUDE([ITEMNUM], [RECEIPTNUM]) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, MAXDOP = 0);


﻿CREATE PROC [dbo].[USP_USERDELETEMATRIX]
	@MESSAGEIDI	INT,			--消息类型
	@SEQUENCEI 	BIGINT,			--PASS9订单序列号
	@USERID 	VARCHAR(100),	--PASS9帐号 
	@CARDTYPE	CHAR(4),		--充值卡类型
	@CARDNO		VARCHAR(15),	--卡号或者订单号
	@TXNDATE	DATETIME,		--对账日
	@METHOD		INT,			--包月/记点标志位 1.包月;2.记点
	@QUANTITY	INT,			--数量
	@BONUS		INT,			--奖励数量
	@MEMO		VARCHAR(100),	--备注信息
	@MESSAGEID	INT OUTPUT,		--消息类型
	@SEQUENCE 	BIGINT OUTPUT,	--PASS9订单序列号
	@RESULT 	CHAR(4) = '0001' OUTPUT

AS
BEGIN

	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	
	DECLARE @HONOR INT
	SELECT @HONOR = 0,@MESSAGEID = @MESSAGEIDI,@SEQUENCE = @SEQUENCEI

	IF @QUANTITY < 0
		SET @RESULT = '0001'

	IF @RESULT = '0000'
		AND EXISTS(SELECT 1 FROM DBO.GAME_CHARGE_HISTORY WHERE SEQUENCE = @SEQUENCE)
		SET @RESULT = '0010'

	IF @RESULT = '0000'
		AND NOT EXISTS(SELECT 1 FROM SXZ_ACCOUNTDB.DBO.TBL_ACCOUNT A,DBO.T_USER_PAY B WHERE A.ACCOUNTID = B.ACCOUNTID AND A.ACCOUNT = @USERID)
		SET @RESULT = '0003'

	IF @RESULT = '0000'
	BEGIN
		BEGIN TRAN

		UPDATE DBO.T_USER_PAY
		SET PAY_POINTS = PAY_POINTS + @QUANTITY,
			FREE_POINTS = FREE_POINTS + @BONUS
		WHERE ACCOUNTID = @USERID
		IF @@ERROR <> 0 
			SET @RESULT = '0004'

		IF @RESULT = '0000'
		BEGIN
			INSERT INTO GAME_CHARGE_HISTORY(SEQUENCE,CREATEDATE,CHECKDATE,ACCOUNTID,PAY_POINTS,FREE_POINTS,HONOR,CARDTYPE,CARDNO)
				SELECT @SEQUENCEI,GETDATE(),@TXNDATE,ACCOUNTID,@QUANTITY,@BONUS,@HONOR,@CARDTYPE,@CARDNO
				FROM DBO.TBL_ACCOUNT 
				WHERE ACCOUNT = @USERID

		IF @@ERROR <> 0 
			BEGIN
				SET @RESULT = '0004'
			END
		END
	END
	IF @RESULT = '0000'
	BEGIN
		COMMIT TRAN
	END

	RETURN
END

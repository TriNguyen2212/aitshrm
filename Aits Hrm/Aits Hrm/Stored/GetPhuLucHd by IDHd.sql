USE [QuanLyNhanSu]
GO
/****** Object:  StoredProcedure [dbo].[GetPhuLucHdByIDHd]    Script Date: 05/31/2012 15:12:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[GetPhuLucHdByIDHd]
	@IDHD int
AS
BEGIN
	SELECT [IDPhuLucHD]
      ,(select SoHD from HopdongLD where hopdongLD.[IDHopDongLD] = [PhuLucHD].[IDHopDongLD]) as SoHD
      ,[TenPhuLuc]
      ,[SoPhuLuc]
      ,[NgayHieuLuc]
      ,[TepDinhKem]
  FROM [QuanLyNhanSu].[dbo].[PhuLucHD]
  WHERE [IDHopDongLD] = @IDHD
END

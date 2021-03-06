USE [QuanLyNhanSu]
GO
/****** Object:  StoredProcedure [dbo].[GetQuaTrinhLamViecByIDNhanVien]    Script Date: 05/28/2012 14:11:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[GetQuaTrinhLamViecByIDNhanVien]
	@IDNhanVien int
AS
BEGIN
	SELECT [IDQuaTrinhLamViec]
      ,(select TenChucDanh from ChucDanh where QuatrinhLamViec.[IDChucDanh] = [IDChucDanh]) as ChucDanh
      ,[TenViec]
      ,[MoTa]
      ,(select TenDonVi from CoCauToChuc where Quatrinhlamviec.[IDCoCauToChuc] = [IDCoCauToChuc])as ToChuc
      ,[ThoiGianBatdau]
      ,[ThoiGianKetThuc]
      ,[NgayCapNhat]
      ,[NguoiCapNhat]
      ,[NgayTao]
      ,[NguoiTao]
  FROM [QuanLyNhanSu].[dbo].[QuaTrinhLamViec]
  WHERE QuaTrinhLamViec.IDNhanvien = @IDNhanVien
END

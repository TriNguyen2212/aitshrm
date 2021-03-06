USE [QuanLyNhanSu]
GO
/****** Object:  StoredProcedure [dbo].[GetNhanThanByIDNhanVien]    Script Date: 05/24/2012 15:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[GetNhanThanByIDNhanVien]
	@IDNhanVien int
AS
BEGIN
	SELECT [IDNhanThan]
      ,(select MaNV from HoSoNhanVien_UngVien where [NhanThan].IDNhanVien = HoSoNhanVien_UngVien.[IDNhanVien])as MaNV
      ,(select QuanHe From QuanHe where [IDQuanHe] = [NhanThan].[IDQuanHe]) as Quanhe
      ,[HoTenNhanThan]
      ,[NamSinh]
      ,[NgheNghiep]
      ,[NgayCapNhat]
      ,[NguoiCapNhat]
      ,[NgayTao]
      ,[NguoiTao]
  FROM [QuanLyNhanSu].[dbo].[NhanThan]
  Where IDNhanvien = @IDNhanVien
END

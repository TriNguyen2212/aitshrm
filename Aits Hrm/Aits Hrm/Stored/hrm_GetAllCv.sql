USE [QuanLyNhanSu]
GO
/****** Object:  StoredProcedure [dbo].[GetAllCV]    Script Date: 06/04/2012 16:50:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[GetAllCV]
	
AS
BEGIN
	SELECT [HoSoNhanVien_UngVien].IDNHANVIEN
      ,[MaNV]
      ,[TenNV]
      ,[NgaySinh]
      ,[NoiSinh]
      ,[NguyenQuan]
      ,[GioiTinh]
      ,(select Dantoc from DanToc where DanToc.iddantoc = [HoSoNhanVien_UngVien].[IDDanToc]) as DanToc
      ,(select tongiao from tongiao where idtongiao = [HoSoNhanVien_UngVien].[IDTonGiao]) as TonGiao
      ,(select quoctich from quoctich where idquoctich = [HoSoNhanVien_UngVien].[IDQuocTich]) as QuocTich
      ,(select tinhtranghonnhan from tinhtranghonnhan where idtinhtranghonnhan = [HoSoNhanVien_UngVien].[IDTinhTrangHonNhan])as TTHonNhan
      ,[SoCNMD]
      ,[NgayCapCMND]
      ,[NoiCapCMND]
      ,[HoKhauThuongTru]
      ,[DiaChiLienHe]
      ,[SoDiDong]
      ,[SoMayBan]
      ,[Email]
      ,[SoTK]
      ,[AnhCaNhan]
      ,[LaNhanVien]
      ,[DuocDangNhap]
      ,[HoSoNhanVien_UngVien].ngaycapnhat
      ,[HoSoNhanVien_UngVien].nguoicapnhat
      ,[HoSoNhanVien_UngVien].ngaytao
      ,[HoSoNhanVien_UngVien].nguoitao
  FROM [QuanLyNhanSu].[dbo].[HoSoNhanVien_UngVien]
		--INNER JOIN QuaTrinhLamViec on QuaTrinhLamViec.IDNhanVien = [HoSoNhanVien_UngVien].IDNhanVien
	WHERE LaNhanVien = 'true'
  ORDER BY IDNhanvien desc
END

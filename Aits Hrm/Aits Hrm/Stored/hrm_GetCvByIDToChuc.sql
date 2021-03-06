USE [QuanLyNhanSu]
GO
/****** Object:  StoredProcedure [dbo].[GetCVByIDToChuc]    Script Date: 05/28/2012 14:57:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[GetCVByIDToChuc]
	@IDTOCHUC int
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
      ,(select top 1 TenChucDanh from ChucDanh 
		where ChucDanh.IDChucDanh = QuaTrinhLamViec.IDChucDanh
		)as ChucDanh
		,(select top 1 LoaiHopDong from LoaiHopDong,HopdongLD,[HoSoNhanVien_UngVien]
			where LoaiHopDong.IDLoaiHopDong = HopDongLD.IDLoaiHD
			and HopdongLd.IDNhanvien = [HoSoNhanVien_UngVien].IDNhanVien
			order by NgayKyHD desc
		) as LoaiHD
  FROM [QuanLyNhanSu].[dbo].[HoSoNhanVien_UngVien]
		INNER JOIN QUATRINHLAMVIEC ON [HoSoNhanVien_UngVien].IDNHANVIEN = QUATRINHLAMVIEC.IDNHANVIEN
	WHERE 
	(QUATRINHLAMVIEC.IDCOCAUTOCHUC = @IDToChuc)
	OR
	(QUATRINHLAMVIEC.IDCOCAUTOCHUC in
		( 
				select IDCoCauToChuc from CoCauToChuc where IDParent = @IDToChuc
		)
	)
	And LaNhanVien= 'true'
ORDER By IDNhanVien desc
END

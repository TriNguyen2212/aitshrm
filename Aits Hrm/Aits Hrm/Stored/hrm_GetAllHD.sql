USE [QuanLyNhanSu]
GO
/****** Object:  StoredProcedure [dbo].[GetAllHopDong]    Script Date: 06/13/2012 14:29:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[GetAllHopDong]
AS
BEGIN
	SELECT [IDHopDongLD]
      ,HopdongLD.[SoHD]
      ,HopdongLD.[NgayKyHD]
      ,(select LoaiHopDong from LoaiHopDong where LoaiHopdong.[IDLoaiHopDong] = HopdongLD.[IDLoaiHD]) as LoaiHD
      ,HopdongLD.[TuNgay]
      ,HopdongLD.[DenNgay]
      ,(select TenNV from HosoNhanvien_UngVien where IDNhanVien = HopdongLD.[IDNhanVien])as NguoiLaoDong
      ,(select TenNV from HosoNhanvien_UngVien where IDNhanVien = HopdongLD.[IDNguoiDaiDien])as NguoiDaiDien
      ,(select TenDonVi from CoCauToChuc where CoCauToChuc.[IDCoCauToChuc] =  HopdongLD.[IDCoCauToChuc])as ToChuc
      ,HopdongLD.[DiaDiemLamViec]
      ,HopdongLD.[TrinhDoChuyenMon]
      ,(select Tenchucdanh from chucdanh where chucdanh.[IDChucDanh] = HopdongLD.[IDChucDanhNghiepVu]) as ChucDanh
      ,(select Tenchucdanh from chucdanhcongviec where chucdanhcongviec.[IDChucDanhCongViec] = HopdongLD.[IDChucDanhCongViec]) as ChucDanhCongViec
      ,HopdongLD.[PhuCapCV]
      ,HopdongLD.[MucHuong]
      ,HopdongLD.[MucLuongToiThieu]
      ,HopdongLD.[GhiChu]
      ,BacNgach.Bac
      ,Ngach.MaNgach
      ,HopdongLD.[TepDinhKem]
  FROM [QuanLyNhanSu].[dbo].[HopDongLD]
        INNER JOIN BacNgach on BacNgach.IDBacNgach = HopDongLd.IDBacNgach
        INNER JOIN Ngach on BacNgach.IDNgach = Ngach.IDNgach
  ORDER By [NgayKyHD] Desc
END

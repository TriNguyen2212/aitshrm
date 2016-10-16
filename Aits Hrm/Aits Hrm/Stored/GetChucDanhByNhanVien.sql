-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
create PROCEDURE GetChucDanhByNhanVien
@IDNhanVien int
AS
BEGIN
Select HoSoNhanVien_UngVien.MaNV,
HoSoNhanVien_UngVien.TenNV,
ChucDanh.MaChucDanh,
ChucDanh.TenChucDanh,
HeSoChucDanh.HSChucDanh,
HeSoChucDanh.HSTrachNhiemPhuCap,
CoCauToChuc.MaDonVi,
CoCauToChuc.TenDonVi
FROM HoSoNhanVien_UngVien Inner join QuaTrinhLamViec
On HoSoNhanVien_UngVien.IDNhanVien = QuaTrinhLamViec.IDNhanVien Inner join
ChucDanh On ChucDanh.IDChucDanh = QuaTrinhLamViec.IDChucDanh Inner join
HeSoChucDanh On HeSoChucDanh.IDHeSoChucDanh = ChucDanh.IDHeSoChucDanh Inner join
CoCauToChuc On CoCauToChuc.IDCoCauToChuc = QuaTrinhLamViec.IDCoCauToChuc
WHERE HoSoNhanVien_UngVien.IDNhanVien = @IDNhanVien
END

USE [QuanLyNhanSu]
GO
/****** Object:  StoredProcedure [dbo].[GetDaoTaoByIDNhanVien]    Script Date: 05/28/2012 10:34:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[GetDaoTaoByIDNhanVien]
	@IDNhanVien int
AS
BEGIN
	SELECT [IDDaoTao]
      ,[TuNgay]
      ,[DenNgay]
      ,(select chuyennganh from chuyennganhdt where  daotao.IDchuyennganh = IDchuyennganh)as ChuyenNganh
      ,(select LoaiHinhDT from LoaiHinhDT where daotao.[IDLoaiHinh] = [IDLoaiHinh]) as LoaiHinhDT
      ,(select TrinhDoDT from TrinhDoDT where daotao.[IDTrinhDo] = [IDTrinhDo]) as TrinhDo
      ,(select NoiCapBang from NoiCapBang where daotao.[IDNoiCapBang] = [IDNoiCapBang]) as NoiCapBang
      ,(select LoaiBangDT from LoaiBangDT where daotao.[IDLoaiBangDT] = [IDLoaiBangDT])as LoaiBang
      ,[Diem]
      ,[Anh]
      ,[NgayCapNhat]
      ,[NguoiCapNhat]
      ,[NgayTao]
      ,[NguoiTao]
  FROM [QuanLyNhanSu].[dbo].[DaoTao]
  WHERE IDNhanVien = @IDNhanVien
END

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Aits_Hrm.Model;
using Telerik.Web.UI;

namespace Aits_Hrm.Home
{
    public partial class HoSoCaNhan : System.Web.UI.UserControl
    {
        private QuanLyNhanSuEntities _entities = new QuanLyNhanSuEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            int userID = (int)Session["userID"];
            FillCurrentEmployeeDetail(userID);
        }

        protected void FillCurrentEmployeeDetail(Int32 IDNhanvien)
        {
            
            HoSoNhanVien_UngVien lq = (from q in _entities.HoSoNhanVien_UngVien
                                       where q.IDNhanVien == IDNhanvien
                                       select q).First();
            //***  thong tin chung ***//
            lbMaNV.Text = lq.MaNV.ToString();
            lbTenNV.Text = lq.TenNV.ToString();
            lbGioitinh.Text = (lq.GioiTinh == true) ? "Nam" : "Nữ";
            lbDateOfBirth.Text = String.Format("{0:dd/MM/yyyy}", lq.NgaySinh);
            lbNoiSinh.Text = lq.NoiSinh;
            lbDanToc.Text = lq.DanToc.DanToc1;
            lbTonGiao.Text = lq.TonGiao.TonGiao1;
            lbQuocTich.Text = lq.QuocTich.QuocTich1;
            if (lq.SoCNMD != null) lbCMND.Text = lq.SoCNMD.ToString(); else lbCMND.Text = "";
            if (lq.NgayCapCMND != null) lbNgayCapCMND.Text = String.Format("{0:dd/MM/yyyy}", lq.NgayCapCMND); else lbNgayCapCMND.Text = "";
            if (lq.NoiCapCMND != null) lbNoiCapCMND.Text = lq.NoiCapCMND.ToString(); else lbNoiCapCMND.Text = "";
            if (lq.AnhCaNhan != null) { ImageEmp.DataValue = lq.AnhCaNhan; ImageEmp.Width = 120; ImageEmp.Height = 160; ImageEmp.ResizeMode = BinaryImageResizeMode.Fill; }
            else { ImageEmp.ImageUrl = "../Images/Staff.png"; ImageEmp.Width = 120; ImageEmp.Height = 160; }
            lbChucDanh.Text = (_entities.GetChucDanhByNhanVien(IDNhanvien).FirstOrDefault() != null) ? _entities.GetChucDanhByNhanVien(IDNhanvien).FirstOrDefault().TenChucDanh : "";
            lbDonVi.Text = (_entities.GetDonViCongTacByIDNhanVien(IDNhanvien).FirstOrDefault() != null) ? _entities.GetDonViCongTacByIDNhanVien(IDNhanvien).FirstOrDefault().TenDonVi : "";
            txtNgayVaoHK.Text = String.Format("{0:dd/MM/yyyy}", lq.NgayVaoHK);
            lbNgayBienChe.Text = String.Format("{0:dd/MM/yyyy}", lq.NgayBienChe);
            //*** thong tin lien lac ***//
            if (lq.SoDiDong != null) lbDTDĐ.Text = lq.SoDiDong.ToString(); else lbDTDĐ.Text = "";
            lbEmail.Text = lq.Email;
            lbDTCQ.Text = lq.SoMayBan;
            lbDiaChi.Text = lq.DiaChiLienHe;
            lbSoTK.Text = lq.SoTK;
            // *** thong tin nhan than ***//
            var nhanthan = from q in _entities.GetNhanThanByIDNhanVien(IDNhanvien)
                           select q;
            RadGridNhanThan.DataSource = nhanthan;
            RadGridNhanThan.DataBind();
            //*** thong tin hop dong ***//
            var hd = from q in _entities.GetHopDongByIDNhanVien(IDNhanvien)
                     select q;
            GridHD.DataSource = hd;
            GridHD.DataBind();
            // *** thong tin bang cap ***//
            var daotao = _entities.GetDaoTaoByIDNhanVien(IDNhanvien).Where(x=>x.Type==0);
            GridDT.DataSource = daotao;
            GridDT.DataBind();
            // *** thong tin chung chi ***//
            var chungchi = _entities.GetDaoTaoByIDNhanVien(IDNhanvien).Where(x=>x.Type==1);
            GridChungChi.DataSource = chungchi;
            GridChungChi.DataBind();
            //*** thong tin qua trinh lam viec ***//
            var qtlv = from q in _entities.GetQuaTrinhLamViecByIDNhanVien(IDNhanvien)
                       select q;
            GridQTCT.DataSource = qtlv;
            GridQTCT.DataBind();
            //*** thong tin qua trinh nghi ***//
            var qtnghi = from q in _entities.GetNghiByIDNhanVien(IDNhanvien)
                         select q;
            grvNghi.DataSource = qtnghi;
            grvNghi.DataBind();
        }

        protected void grvNghi_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if ((e.Item is GridDataItem))
            {
                GridDataItem dataItem = (GridDataItem)e.Item;
                Label duocNghiLabel = (Label)dataItem.FindControl("DuocNghiLabel");
                switch (duocNghiLabel.Text)
                {
                    case "":
                        duocNghiLabel.Text = "Chưa duyệt";
                        break;
                    case "True":
                        duocNghiLabel.Text = "Có";
                        break;
                    case "False":
                        duocNghiLabel.Text = "Không";
                        break;
                }
            }
        }
    }
}
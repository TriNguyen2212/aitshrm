using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Aits_Hrm.Model;
using Aits_Hrm.CommonMethod;
using Telerik.Web.UI;
using System.IO;

namespace Aits_Hrm.CV
{
    public partial class ThemNhanVien : System.Web.UI.Page
    {
        private QuanLyNhanSuEntities _entities = new QuanLyNhanSuEntities();
        Methods cbm = new Methods();
        private static byte[] imgdata = null;
        private int idUser;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
            {
                idUser = (int)Session["userID"];
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
            RadToolBar1.FindItemByValue("Reset").Attributes.Add("onClick", "reset()");
            if (!IsPostBack)
            {
                // Load data into each combobox
                cbm.LoadCombobox(cboTTHonNhan, _entities.TinhTrangHonNhans, "TinhTrangHonNhan1", "IDTinhTrangHonNhan");
                cbm.LoadCombobox(cboDanToc, _entities.DanTocs, "DanToc1", "IDDanToc");
                cbm.LoadCombobox(cboTonGiao, _entities.TonGiaos, "TonGiao1", "IDTonGiao");
                cbm.LoadCombobox(cboQuocTich, _entities.QuocTiches, "QuocTich1", "IDQuocTich");
                txtMaNV.Focus();
                // End load
            }
        }

        protected void RadAjaxManager1_AjaxRequest(object sender, AjaxRequestEventArgs e)
        {
            if (e.Argument == "a")
            {
                AnhNV.ImageUrl = "../Images/Staff.png";
            }
        }

        protected void AsyncUpload1_FileUploaded(object sender, FileUploadedEventArgs e)
        {
            using (Stream stream = e.File.InputStream)
            {
                imgdata = new byte[stream.Length];
                stream.Read(imgdata, 0, (int)stream.Length);
                AnhNV.DataValue = imgdata;
                AnhNV.Height = Unit.Pixel(120);
                AnhNV.Width = Unit.Pixel(90);
            }
        }

        protected void RadToolBar1_ButtonClick1(object sender, RadToolBarEventArgs e)
        {
            switch (e.Item.Value)
            {
                case "Save":
                    var maNv = _entities.HoSoNhanVien_UngVien.Where(x => x.MaNV == txtMaNV.Text).FirstOrDefault();
                    var emailNv = _entities.HoSoNhanVien_UngVien.Where(x => x.Email == txtEmail.Text).FirstOrDefault();
                    if (maNv != null)
                    {
                        RadWindowManager1.RadAlert("Đã tồn tại mã nhân viên này", 250, 100, "Lỗi", "");
                    }
                    else
                    {
                        if (emailNv != null)
                        {
                            RadWindowManager1.RadAlert("Đã tồn tại email này", 250, 100, "Lỗi", "");
                        }
                        else
                        {
                            HoSoNhanVien_UngVien hs = new HoSoNhanVien_UngVien();
                            hs.MaNV = txtMaNV.Text;
                            hs.TenNV = txtTenNV.Text;
                            hs.GioiTinh = Convert.ToBoolean(cboGioiTinh.SelectedValue);
                            hs.NgaySinh = txtNgaySinh.SelectedDate;
                            hs.NoiSinh = txtNoiSinh.Text;
                            hs.NguyenQuan = txtNguyenQuan.Text;
                            hs.SoCNMD = txtSoCMND.Text;
                            hs.NgayCapCMND = txtNgayCap.SelectedDate;
                            hs.NoiCapCMND = txtNoiCap.Text;
                            hs.IDTinhTrangHonNhan = Convert.ToInt32(cboTTHonNhan.SelectedValue);
                            hs.IDDanToc = Convert.ToInt32(cboDanToc.SelectedValue);
                            hs.IDTonGiao = Convert.ToInt32(cboTonGiao.SelectedValue);
                            hs.IDQuocTich = Convert.ToInt32(cboQuocTich.SelectedValue);
                            hs.HoKhauThuongTru = txtHoKhau.Text;
                            hs.DiaChiLienHe = txtDCLienHe.Text;
                            hs.SoDiDong = txtDiDong.Text;
                            hs.SoMayBan = txtMayBan.Text;
                            hs.Email = txtEmail.Text;
                            hs.SoTK = txtTaiKhoan.Text;
                            hs.NgayVaoHK = txtNgayVaoHK.SelectedDate;
                            hs.NgayBienChe = txtNgayBienChe.SelectedDate;
                            hs.AnhCaNhan = imgdata;
                            hs.LaNhanVien = true;
                            hs.DuocDangNhap = true;
                            hs.NgayTao = hs.NgayCapNhat = DateTime.Now;
                            hs.NguoiCapNhat = hs.NguoiTao = idUser;
                            hs.isVisible = true;
                            //hs.LaNhanVien = ;
                            //hs.DuocDangNhap = ;
                            _entities.AddToHoSoNhanVien_UngVien(hs);
                            try
                            {
                                _entities.SaveChanges();
                                Session["idNV"] = hs.IDNhanVien;
                                imgdata = null;
                                Response.Redirect("ThemHopDong.aspx?mode=new");
                            }
                            catch (Exception ex)
                            {
                                throw ex;
                            }
                        }
                    }                    
                    break;
                case "Reset":
                    AnhNV.ImageUrl = "../Images/Staff.png";
                    break;
            }
        }

        protected void butXoaAnh_Click(object sender, EventArgs e)
        {
            imgdata = null;
            AnhNV.ImageUrl = "../Images/Staff.png";
        }
    }
}
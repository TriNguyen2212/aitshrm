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
using System.Collections;

namespace Aits_Hrm.CV
{
    public partial class Suanhanvien : System.Web.UI.Page
    {
        private QuanLyNhanSuEntities _entities = new QuanLyNhanSuEntities();
        Methods cbm = new Methods();
        private static int iDNhanVien;
        private int idUser;
        private static byte[] imgdata = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            iDNhanVien = Convert.ToInt32(Session["idNV"].ToString());
            CheckPermis();
            idUser = (int)Session["userID"];
            if (!IsPostBack)
            {
                // Load data into each combobox
                cbm.LoadCombobox(cboTTHonNhan, _entities.TinhTrangHonNhans, "TinhTrangHonNhan1", "IDTinhTrangHonNhan");
                cbm.LoadCombobox(cboDanToc, _entities.DanTocs, "DanToc1", "IDDanToc");
                cbm.LoadCombobox(cboTonGiao, _entities.TonGiaos, "TonGiao1", "IDTonGiao");
                cbm.LoadCombobox(cboQuocTich, _entities.QuocTiches, "QuocTich1", "IDQuocTich");
                txtMaNV.Focus();
                // End load
                if (Session["idNV"] != null)
                {
                    FillData();
                }               
            }
        }

        protected void CheckPermis()
        {
            // xem dang nhap chua
            Methods m = new Methods();
            m.CheckUserLoged();
            // kiem tra quyen
            Int32 IDUser = (Int32)Session["UserID"];
            ArrayList dsQuyen = new ArrayList();
            dsQuyen.AddRange(_entities.GetQuyenByIDNhanVien(IDUser, 1).ToArray());//chuc nang ho so
            bool modeEdit = dsQuyen.Contains(2);
            RadToolBar1.Items.FindItemByValue("Save").Enabled = modeEdit;
            RadToolBar1.Items.FindItemByValue("Reset").Enabled = modeEdit;
            txtMaNV.ReadOnly = !modeEdit;
            txtMayBan.ReadOnly = !modeEdit;
            txtNgayCap.Enabled = modeEdit;
            txtDCLienHe.ReadOnly = !modeEdit;
            txtDiDong.ReadOnly = !modeEdit;
            txtEmail.ReadOnly = !modeEdit;
            txtHoKhau.ReadOnly = !modeEdit;
            txtNgaySinh.Enabled = modeEdit;
            txtNguyenQuan.ReadOnly = !modeEdit;
            txtNoiCap.ReadOnly = !modeEdit;
            txtNoiSinh.ReadOnly = !modeEdit;
            txtSoCMND.ReadOnly = !modeEdit;
            txtTaiKhoan.ReadOnly = !modeEdit;
            txtTenNV.ReadOnly = !modeEdit;
            //if (lq.AnhCaNhan != null) { imgdata = AnhNV.DataValue = lq.AnhCaNhan; AnhNV.Width = 120; AnhNV.Height = 160; AnhNV.ResizeMode = BinaryImageResizeMode.Fill; }
            //else { AnhNV.ImageUrl = "../Images/Staff.png"; AnhNV.Width = 120; AnhNV.Height = 160; }
            cboGioiTinh.Enabled = modeEdit;
            cboDanToc.Enabled = modeEdit;
            cboQuocTich.Enabled = modeEdit;
            cboTonGiao.Enabled = modeEdit;
            cboTTHonNhan.Enabled = modeEdit;
            txtNgayVaoHK.Enabled = modeEdit;
            txtNgayBienChe.Enabled = modeEdit;
            txtAnhCaNhan.Enabled = modeEdit;
            butXoaAnh.Enabled = modeEdit;

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

        protected void butXoaAnh_Click(object sender, EventArgs e)
        {
            imgdata = null;
            AnhNV.ImageUrl = "../Images/Staff.png";
        }

        protected void RadAjaxManager1_AjaxRequest(object sender, AjaxRequestEventArgs e)
        {
            if (e.Argument == "a")
            {
                AnhNV.ImageUrl = "../Images/Staff.png";
            }
        }
        protected void FillData()
        {
            HoSoNhanVien_UngVien lq = _entities.HoSoNhanVien_UngVien.Where(q=> q.IDNhanVien == iDNhanVien).First();
            txtMaNV.Text = lq.MaNV;
            txtMayBan.Text = lq.SoMayBan;
            txtNgayCap.SelectedDate = lq.NgayCapCMND;
            txtDCLienHe.Text = lq.DiaChiLienHe;
            txtDiDong.Text = lq.SoDiDong;
            txtEmail.Text = lq.Email;
            txtHoKhau.Text = lq.HoKhauThuongTru;
            txtNgaySinh.SelectedDate = lq.NgaySinh;
            txtNguyenQuan.Text = lq.NguyenQuan;
            txtNoiCap.Text = lq.NoiCapCMND;
            txtNoiSinh.Text = lq.NoiSinh;
            txtSoCMND.Text = lq.SoCNMD;
            txtTaiKhoan.Text = lq.SoTK;
            txtTenNV.Text = lq.TenNV;
            if (lq.AnhCaNhan != null) { imgdata = AnhNV.DataValue = lq.AnhCaNhan; AnhNV.Width = 120; AnhNV.Height = 160; AnhNV.ResizeMode = BinaryImageResizeMode.Fill; }
            else { AnhNV.ImageUrl = "../Images/Staff.png"; AnhNV.Width = 120; AnhNV.Height = 160; }
            cboGioiTinh.SelectedValue = lq.GioiTinh.ToString();
            cboDanToc.SelectedValue = lq.IDDanToc.ToString();
            cboQuocTich.SelectedValue = lq.IDQuocTich.ToString();
            cboTonGiao.SelectedValue = lq.IDTonGiao.ToString();
            cboTTHonNhan.SelectedValue = lq.IDTinhTrangHonNhan.ToString();
            txtNgayVaoHK.SelectedDate = lq.NgayVaoHK;
            txtNgayBienChe.SelectedDate = lq.NgayBienChe;
            lbLog.Text = "Người tạo: " + cbm.GetTenNVByID(lq.NguoiTao) + " lúc " + lq.NgayTao.ToString() + " -:- Người sửa: " + cbm.GetTenNVByID(lq.NguoiCapNhat) + " lúc " + lq.NgayCapNhat.ToString();
        }

        protected void RadToolBar1_ButtonClick1(object sender, RadToolBarEventArgs e)
        {
            switch (e.Item.Value)
            {
                case "Save":
                    var maNv = _entities.HoSoNhanVien_UngVien.Where(x => x.MaNV == txtMaNV.Text).FirstOrDefault();
                    var emailNv = _entities.HoSoNhanVien_UngVien.Where(x => x.Email == txtEmail.Text).FirstOrDefault();
                    HoSoNhanVien_UngVien hs = _entities.HoSoNhanVien_UngVien.Where(q => q.IDNhanVien == iDNhanVien).First();
                    if (txtMaNV.Text != hs.MaNV && maNv != null)
                    {
                        RadWindowManager1.RadAlert("Đã tồn tại mã nhân viên này", 250, 100, "Lỗi", "");
                    }
                    else
                    {
                        if(txtEmail.Text!=hs.Email && emailNv != null)
                        {
                            RadWindowManager1.RadAlert("Đã tồn tại email này", 250, 100, "Lỗi", "");
                        }
                        else
                        {
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
                            //hs.LaNhanVien = ;
                            //hs.DuocDangNhap = ;
                            hs.NgayCapNhat = DateTime.Now;
                            hs.NguoiCapNhat = idUser;
                            hs.AnhCaNhan = imgdata;
                            _entities.SaveChanges();
                            FillData();
                            RadWindowManager1.RadAlert("Sửa thông tin thành công!", 285, 100, "Thông báo", null);
                            imgdata = null;
                        }
                    }                    
                    break;
                case "Reset":
                    txtNgaySinh.Clear();
                    txtNoiSinh.Text = "";
                    txtNguyenQuan.Text = "";
                    txtNgayBienChe.Clear();
                    txtNgayVaoHK.Clear();
                    AnhNV.ImageUrl = "../Images/Staff.png";
                    txtSoCMND.Text = "";
                    txtNgayCap.Clear();
                    txtNoiCap.Text = "";
                    cboDanToc.SelectedIndex = -1;
                    cboTTHonNhan.SelectedIndex = -1;
                    cboTonGiao.SelectedIndex = -1;
                    cboQuocTich.SelectedIndex = -1;
                    txtHoKhau.Text = "";
                    txtDCLienHe.Text = "";
                    txtDiDong.Text = "";
                    txtMayBan.Text="";
                    txtEmail.Text="";
                    txtTaiKhoan.Text="";
                    break;
            }
        }
    }
}
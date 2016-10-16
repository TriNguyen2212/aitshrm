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
    public partial class SuaHopDong : System.Web.UI.Page
    {
        private QuanLyNhanSuEntities _entities = new QuanLyNhanSuEntities();
        Methods cbm = new Methods();
        private int idUser;
        private static int? idHopDong = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            idUser = (int)Session["userID"];
            if (Session["idHD"] != null)
            {
                idHopDong = (int)Session["idHD"];
            }
            else
            {
                Response.Redirect("HopDong.aspx");
            }
            txtMucLuongToiThieu.Attributes.Add("onchange", "CalLuong(this);");
            if (!IsPostBack)
            {
                var lstNguoiDaiDien = _entities.HoSoNhanVien_UngVien.Where(x => x.isVisible == true);
                cboNguoiDaiDien.DataSource = lstNguoiDaiDien;
                cboNguoiDaiDien.DataValueField = "IDNhanVien";
                cboNguoiDaiDien.DataTextField = "TenNV";
                cboNguoiDaiDien.DataBind();

                cbm.LoadCombobox(cboLoaiHD, _entities.LoaiHopDongs, "LoaiHopDong1", "IDLoaiHopDong");                
                cbm.LoadCombobox(cboNguoiLD, _entities.HoSoNhanVien_UngVien, "TenNV", "IDNhanVien");
                cbm.LoadCombobox(cboChucDanhNghiepVu, _entities.ChucDanhs, "TenChucDanh", "IDChucDanh");
                //cbm.LoadCombobox(cboNguoiDaiDien, _entities.HoSoNhanVien_UngVien, "TenNV", "IDNhanVien");
                cbm.LoadCombobox(cboNgach, _entities.Ngaches, "MaNgach", "IDNgach");
                cbm.LoadCombobox(cboChucDanhCongViec, _entities.ChucDanhCongViecs, "TenChucDanh", "IDChucDanhCongViec");
                var cc = _entities.CoCauToChucs.Where(c => c.IDParent == null);
                cboDonViLamViec.DataSource = cc;
                cboDonViLamViec.DataTextField = "TenDonVi";
                cboDonViLamViec.DataValueField = "IDCoCauToChuc";
                cboDonViLamViec.DataBind();
                LoadBacNgach(Convert.ToInt32(cboNgach.SelectedValue));
                FillData();
            }
        }

        protected void FillData()
        {
            var hopDong = _entities.GetHopDongByID(idHopDong).FirstOrDefault();
            txtSoHD.Text = hopDong.SoHD;
            txtNgayKyHD.SelectedDate = hopDong.NgayKyHD;
            cboLoaiHD.SelectedValue = hopDong.IDLoaiHD.ToString();
            txtTuNgayKyHD.SelectedDate = hopDong.TuNgay;
            txtDenNgayKyHD.SelectedDate = hopDong.DenNgay;
            cboNguoiLD.SelectedValue = hopDong.IDNhanVien.ToString();
            cboChucDanhNghiepVu.SelectedValue = hopDong.IDChucDanhNghiepVu.ToString();
            cboChucDanhCongViec.SelectedValue = hopDong.IDChucDanhCongViec.ToString();
            LoadChucDanhCongViec();
            cboNgach.SelectedValue = hopDong.IDNgach.ToString();
            LoadBacNgach(Convert.ToInt32(cboNgach.SelectedValue));
            cboBac.SelectedValue = hopDong.IDBacNgach.ToString();
            txtTrinhDoChuyenMon.Text = hopDong.TrinhDoChuyenMon;
            cboDonViLamViec.SelectedValue = hopDong.IDCoCauToChuc.ToString();
            txtMucHuong.Text = hopDong.MucHuong.ToString();
            txtMucLuongToiThieu.Text = hopDong.MucLuongToiThieu.ToString();
            txtPhuCapCV.Text = hopDong.PhuCapCV.ToString();
            cboNguoiDaiDien.SelectedValue = hopDong.IDNguoiDaiDien.ToString();
            txtGhiChu.Text = hopDong.GhiChu;
            
            // xu li file attach
            if (hopDong.TepDinhKem != null && hopDong.TepDinhKem != "")
            {
                String pathFile = hopDong.TepDinhKem;
                ViewState["fileAttach"] = pathFile;
                btnDownload.Text = Path.GetFileName(pathFile);
            }
            else { btnDownload.Text = ""; }

            LoadDonViLamViec();
            LoadInfoNguoiDaiDien();
            LoadInfoNguoiLD();
            LoadChucDanhCongViec();
            LoadHeSoBacNgach();
            Decimal luongBH = Convert.ToDecimal(txtHeSo.Text) * Convert.ToDecimal(txtMucLuongToiThieu.Value);
            txtMucLuongBHXH.Text = String.Format("{0:###,###,###} ₫", luongBH);
            lbLog.Text = "Người tạo: " + hopDong.NguoiTao + " lúc " + hopDong.NgayTao.ToString() + " -:- Người sửa: " + hopDong.NguoiCapNhat + " lúc " + hopDong.NgayCapNhat.ToString();
        }

        public void LoadBacNgach(int idngach)
        {
            var bac = _entities.BacNgaches.Where(n => n.IDNgach == idngach);
            cboBac.DataSource = bac;
            cboBac.DataValueField = "IDBacNgach";
            cboBac.DataTextField = "Bac";
            cboBac.DataBind();
        }

        private void LoadDonViLamViec()
        {
            var idcc = Convert.ToInt32(cboDonViLamViec.SelectedValue);
            var dc = _entities.CoCauToChucs.Where(cc => cc.IDCoCauToChuc == idcc).FirstOrDefault();
            txtDiaChi.Text = txtDiaDiemLamViec.Text = dc.DiaChi;
            txtDienThoai.Text = dc.DienThoai;
        }

        private void LoadInfoNguoiDaiDien()
        {
            int idNguoiDaiDien = Convert.ToInt32(cboNguoiDaiDien.SelectedValue);
            var ngDaiDien1 = _entities.GetCVByID(idNguoiDaiDien).FirstOrDefault();
            txtQuocTich.Text = ngDaiDien1.QuocTich;
            var ngDaiDien2 = _entities.GetChucDanhByNhanVien(idNguoiDaiDien).FirstOrDefault();
            if (ngDaiDien2 != null) txtChucDanhNguoiDaiDien.Text = ngDaiDien2.TenChucDanh;
            else txtChucDanhNguoiDaiDien.Text = "";
        }

        private void LoadInfoNguoiLD()
        {
            int idNguoiLD = Convert.ToInt32(cboNguoiLD.SelectedValue);
            var nguoiLD = _entities.GetCVByID(idNguoiLD).FirstOrDefault();
            txtQuocTichNguoiLD.Text = nguoiLD.QuocTich;
            txtNgaySinh.Text = String.Format("{0:dd/MM/yyyy}", nguoiLD.NgaySinh);
            txtNoiSinh.Text = nguoiLD.NoiSinh;
            txtDiaChiThuongTru.Text = nguoiLD.HoKhauThuongTru;
            txtCMND.Text = nguoiLD.SoCNMD;
            txtNoiCap.Text = nguoiLD.NoiCapCMND;
            txtNgayCap.Text = String.Format("{0:dd/MM/yyyy}", nguoiLD.NgayCapCMND);
        }

        private void LoadChucDanhCongViec()
        {
            int idChucDanhCongViec = Convert.ToInt32(cboChucDanhCongViec.SelectedValue);
            var cdcv = _entities.ChucDanhCongViecs.Where(c => c.IDChucDanhCongViec == idChucDanhCongViec).FirstOrDefault();
            txtMaChucDanhCongViec.Text = " (" + cdcv.MaChucDanh + ")";
        }

        private void LoadHeSoBacNgach()
        {
            int idBacNgach = Convert.ToInt32(cboBac.SelectedValue);
            var bn = _entities.BacNgaches.Where(h => h.IDBacNgach == idBacNgach).FirstOrDefault();
            txtHeSo.Text = bn.HeSo.ToString();
        }

        protected void cboNguoiDaiDien_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            LoadInfoNguoiDaiDien();
        }

        protected void cboDonViLamViec_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            LoadDonViLamViec();
        }

        protected void cboChucDanhCongViec_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            LoadChucDanhCongViec();
        }

        protected void cboNgach_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            LoadBacNgach(Convert.ToInt32(cboNgach.SelectedValue));
            LoadHeSoBacNgach();
            txtMucLuongBHXH.Text = "";
        }

        protected void cboBac_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            LoadHeSoBacNgach();
            txtMucLuongBHXH.Text = "";
        }

        protected void RadToolBar1_ButtonClick(object sender, RadToolBarEventArgs e)
        {
            RadWindowManager radwinmanager = new RadWindowManager();
            switch (e.Item.Value)
            {
                case "Save":
                        cboNguoiLD.ShowDropDownOnTextboxClick = false;
                        cboNguoiLD.ShowToggleImage = false;
                        HopDongLD hopDongLD = _entities.HopDongLDs.Where(h => h.IDHopDongLD == idHopDong).FirstOrDefault();
                        hopDongLD.SoHD = txtSoHD.Text;
                        hopDongLD.NgayKyHD = txtNgayKyHD.SelectedDate;
                        hopDongLD.IDLoaiHD = Convert.ToInt32(cboLoaiHD.SelectedValue);
                        hopDongLD.TuNgay = txtTuNgayKyHD.SelectedDate;
                        hopDongLD.DenNgay = txtDenNgayKyHD.SelectedDate;
                        hopDongLD.IDNguoiDaiDien = Convert.ToInt32(cboNguoiDaiDien.SelectedValue);
                        hopDongLD.IDCoCauToChuc = Convert.ToInt32(cboDonViLamViec.SelectedValue);
                        hopDongLD.DiaDiemLamViec = txtDiaDiemLamViec.Text;
                        hopDongLD.TrinhDoChuyenMon = txtTrinhDoChuyenMon.Text;
                        hopDongLD.IDChucDanhNghiepVu = Convert.ToInt32(cboChucDanhNghiepVu.SelectedValue);
                        hopDongLD.IDChucDanhCongViec = Convert.ToInt32(cboChucDanhCongViec.SelectedValue);
                        hopDongLD.MucHuong = Convert.ToInt32(txtMucHuong.Text);
                        hopDongLD.IDBacNgach = Convert.ToInt32(cboBac.SelectedValue);
                        if (txtPhuCapCV.Text != "")
                        {
                            hopDongLD.PhuCapCV = Convert.ToDecimal(txtPhuCapCV.Text);
                        }
                        else
                        {
                            hopDongLD.PhuCapCV = 0;
                        }
                        if (txtMucLuongToiThieu.Text != "")
                        {
                            hopDongLD.MucLuongToiThieu = Convert.ToDecimal(txtMucLuongToiThieu.Text);
                        }
                        else
                        {
                            hopDongLD.MucLuongToiThieu = 0;
                        }
                        hopDongLD.GhiChu = txtGhiChu.Text;
                        if (txtTepDinhKem.UploadedFiles.Count > 0)
                        {
                            string targetFolder = txtTepDinhKem.TargetFolder;
                            hopDongLD.TepDinhKem = Path.Combine(Server.MapPath(targetFolder), txtSoHD.Text.Replace("/", "_") + "_" + txtTepDinhKem.UploadedFiles[0].FileName.Replace(" ", "_"));
                        }
                        hopDongLD.NgayCapNhat = DateTime.Now;
                        hopDongLD.NguoiCapNhat = idUser;
                        try
                        {
                            _entities.SaveChanges();
                            FillData();
                            Singleton.RadAlert("Sửa thông tin thành công",285,100,"Thành công","");
                        }
                        catch (Exception ex)
                        {
                            Singleton.RadAlert("Sửa thông tin thất bại", 285, 100, "Lỗi", "");
                            throw ex;
                        }
                    break;
                case "Report":
                    Session["PrintType"] = "HopDong";
                    Response.Redirect("InHD.aspx");
                    break;
                case "Reset":
//                     txtSoHD.Text = "/" + DateTime.Now.Year.ToString() + "/HĐLĐ/AITS.";
//                     txtNgayKyHD.Clear();
//                     cboLoaiHD.SelectedIndex = -1;
//                     txtTuNgayKyHD.Clear();
//                     txtDenNgayKyHD.Clear();
//                     cboNguoiLD.SelectedIndex = -1;
//                     cboChucDanhNghiepVu.SelectedIndex = -1;
//                     cboChucDanhCongViec.SelectedIndex = -1;
//                     cboNgach.SelectedIndex = -1;
//                     LoadBacNgach(Convert.ToInt32(cboNgach.SelectedValue));
//                     LoadHeSoBacNgach();
//                     txtTrinhDoChuyenMon.Text = "";
//                     cboDonViLamViec.SelectedIndex = -1;
//                     txtMucLuongBHXH.Text = "";
//                     txtMucHuong.Text = "100";
//                     txtPhuCapCV.Text = "";
//                     txtMucLuongToiThieu.Text = "";
//                     cboNguoiDaiDien.SelectedIndex = -1;
//                     txtGhiChu.Text = "";
//                     txtTepDinhKem.UploadedFiles.Clear();
                    FillData();
                    break;
                case "Remove":
                    var phuluchd = _entities.PhuLucHDs.Where(p => p.IDHopDongLD == idHopDong);
                    foreach (PhuLucHD pl in phuluchd)
                    {
                        if (System.IO.File.Exists(pl.TepDinhKem))
                        {
                            File.Delete(System.IO.Path.GetFullPath(pl.TepDinhKem));
                        }
                        _entities.PhuLucHDs.DeleteObject(pl);
                    }
                    var hopdongld = _entities.HopDongLDs.Where(h => h.IDHopDongLD == idHopDong).FirstOrDefault();
                    if (System.IO.File.Exists(hopdongld.TepDinhKem))
                    {
                        File.Delete(System.IO.Path.GetFullPath(hopdongld.TepDinhKem));
                    }
                    _entities.DeleteHopDongByID(idHopDong);
                    _entities.SaveChanges();
                    break;
                case "PhuLuc":
                    Response.Redirect("ThemPhuLucHD.aspx");
                    break;
            }
        }

        protected void txtTepDinhKem_FileUploaded(object sender, FileUploadedEventArgs e)
        {
            string targetFolder = txtTepDinhKem.TargetFolder;
            var hd = _entities.GetHopDongByID(idHopDong).FirstOrDefault();
            if(hd.TepDinhKem=="")
            {
                e.File.SaveAs(Path.Combine(Server.MapPath(targetFolder), txtSoHD.Text.Replace("/", "_") + "_" + e.File.FileName.Replace(" ", "_")));
            }
            else
            {
                if (System.IO.File.Exists(hd.TepDinhKem)) File.Delete(System.IO.Path.GetFullPath(hd.TepDinhKem));
                e.File.SaveAs(Path.Combine(Server.MapPath(targetFolder), txtSoHD.Text.Replace("/", "_") + "_" + e.File.FileName.Replace(" ", "_")));
            }
        }

        protected void btnDownload_OnClick(object sender, EventArgs e)
        {
             String pathFile = ViewState["fileAttach"].ToString();
             String fileName = Path.GetFileName(pathFile);
            System.IO.FileInfo file = new System.IO.FileInfo(pathFile);
            if (file.Exists)
            {
                Response.Clear();
                Response.ContentType = "application/octet-stream";
                Response.AddHeader("Content-Disposition", "attachment; filename=" + fileName);
                Response.TransmitFile(pathFile);
                Response.End();
            }
        }

        protected void cbxNhanVien_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            var dt = from q in _entities.GetAllCV()
                     where q.TenNV.Contains(e.Text)
                     select q;
            ((RadComboBox)sender).DataSource = dt;
            ((RadComboBox)sender).DataBind();
        }



        protected void cboNguoiLD_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            LoadInfoNguoiLD();
//             idNhanVien = Convert.ToInt32(cboNguoiLD.SelectedValue);
//             grvHopDong.Rebind();
        }
    }
}

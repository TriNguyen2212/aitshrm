using System;
using System.IO;
using System.Linq;
using Aits_Hrm.CommonMethod;
using Aits_Hrm.Model;
using Telerik.Web.UI;
using System.Collections;

namespace Aits_Hrm.CV
{
    public partial class ThemHopDong : System.Web.UI.Page
    {
        private QuanLyNhanSuEntities _entities = new QuanLyNhanSuEntities();
        Methods cbm = new Methods();
        private int idUser;
        private static int? idHopDong = null;
        private static int? idNhanVien = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckPermis();
            idUser = (int)Session["userID"];
            if (Session["idNV"] != null)
            {
                idNhanVien = (int)Session["idNV"];
            }
            else
            {
                idNhanVien = null;
            }
            txtMucLuongToiThieu.Attributes.Add("onchange", "CalLuong(this);");
            if (!IsPostBack)
            {
                // Load data into each combobox
                var lstNguoiLD = _entities.HoSoNhanVien_UngVien.Where(x => x.isVisible == true);
                cboNguoiLD.DataSource = cboNguoiDaiDien.DataSource = lstNguoiLD;
                cboNguoiLD.DataValueField = cboNguoiDaiDien.DataValueField = "IDNhanVien";
                cboNguoiLD.DataTextField = cboNguoiDaiDien.DataTextField = "TenNV";
                cboNguoiDaiDien.DataBind();
                cboNguoiLD.DataBind();

                cbm.LoadCombobox(cboLoaiHD, _entities.LoaiHopDongs, "LoaiHopDong1", "IDLoaiHopDong");
                //cbm.LoadCombobox(cboNguoiLD, _entities.HoSoNhanVien_UngVien, "TenNV", "IDNhanVien");
                cbm.LoadCombobox(cboChucDanhNghiepVu, _entities.ChucDanhs, "TenChucDanh", "IDChucDanh");
                //cbm.LoadCombobox(cboNguoiDaiDien, _entities.HoSoNhanVien_UngVien, "TenNV", "IDNhanVien");
                cboNguoiDaiDien.SelectedValue = "9";
                cbm.LoadCombobox(cboNgach, _entities.Ngaches, "MaNgach", "IDNgach");
                cbm.LoadCombobox(cboChucDanhCongViec, _entities.ChucDanhCongViecs, "TenChucDanh", "IDChucDanhCongViec");
                var cc = _entities.CoCauToChucs.Where(c => c.IDParent == null);
                cboDonViLamViec.DataSource = cc;
                cboDonViLamViec.DataTextField = "TenDonVi";
                cboDonViLamViec.DataValueField = "IDCoCauToChuc";
                cboDonViLamViec.DataBind();
                LoadBacNgach(Convert.ToInt32(cboNgach.SelectedValue));
                LoadDonViLamViec();
                LoadInfoNguoiDaiDien();
                txtMucHuong.Text = "100";
                txtSoHD.Text = "/" + DateTime.Now.Year.ToString() + "/HĐLĐ/AITS.";
                // End load
                if (idNhanVien == null)
                {
                    cboNguoiLD.ShowDropDownOnTextboxClick = true;
                    cboNguoiLD.ShowToggleImage = true;
                }
                else
                {
                    cboNguoiLD.SelectedValue = idNhanVien.ToString();
                }
                LoadInfoNguoiLD();
                LoadChucDanhCongViec();
                LoadHeSoBacNgach();
                LoadGrid();

                String mode = "";
                if (Request.QueryString["mode"] != null)
                {
                    mode = Request.QueryString["mode"].ToString();
                }
                if (mode !="new" && grvHopDong.Items.Count > 0)
                {
                    idHopDong = (Int32)grvHopDong.Items[0].GetDataKeyValue("IDHopDongLD");
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
            dsQuyen.AddRange(_entities.GetQuyenByIDNhanVien(IDUser, 2).ToArray());//chuc nang QLy HD
            RadToolBar1.Items.FindItemByValue("Save").Enabled = dsQuyen.Contains(2);
            RadToolBar1.Items.FindItemByValue("Reset").Enabled = dsQuyen.Contains(2);
            RadToolBar1.Items.FindItemByValue("Report").Enabled = dsQuyen.Contains(4);
            grvHopDong.Columns.FindByUniqueName("columnXoa").Visible = dsQuyen.Contains(3);
        }

        public void LoadBacNgach(int idngach)
        {
            var bac = _entities.BacNgaches.Where(n=>n.IDNgach == idngach);
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
            var bn = _entities.BacNgaches.Where(h => h.IDBacNgach == idBacNgach).First();
            txtHeSo.Text = bn.HeSo.ToString();
        }

        protected void cboNguoiDaiDien_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            LoadInfoNguoiDaiDien();
        }

        protected void cboNguoiLD_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            LoadInfoNguoiLD();
            idNhanVien = Convert.ToInt32(cboNguoiLD.SelectedValue);
            grvHopDong.Rebind();
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

        private void LoadGrid()
        {
            if (idNhanVien != null)
            {
                var listHD = _entities.GetHopDongByIDNhanVien(idNhanVien);
                grvHopDong.DataSource = listHD;
                grvHopDong.DataBind();
            }
            else
            {
                var listHD = _entities.GetHopDongByIDNhanVien(Convert.ToInt32(cboNguoiLD.SelectedValue));
                grvHopDong.DataSource = listHD;
                grvHopDong.DataBind();
            }
        }

        protected void RadToolBar1_ButtonClick(object sender, RadToolBarEventArgs e)
        {
            switch (e.Item.Value)
            {
                case "Save":
                    if (idHopDong == null)
                    {
                        HopDongLD hd = new HopDongLD();
                        if (idNhanVien == null)
                        {
                            hd.IDNhanVien = Convert.ToInt32(cboNguoiLD.SelectedValue);
                        }
                        else
                        {
                            hd.IDNhanVien = idNhanVien;
                        }
                        if (_entities.HopDongLDs.Where(h => h.SoHD == txtSoHD.Text).FirstOrDefault() == null)
                        { 
                            hd.SoHD = txtSoHD.Text;
                            hd.NgayKyHD = txtNgayKyHD.SelectedDate;
                            hd.IDLoaiHD = Convert.ToInt32(cboLoaiHD.SelectedValue);
                            hd.TuNgay = txtTuNgayKyHD.SelectedDate;
                            hd.DenNgay = txtDenNgayKyHD.SelectedDate;
                            hd.IDNguoiDaiDien = Convert.ToInt32(cboNguoiDaiDien.SelectedValue);
                            hd.IDCoCauToChuc = Convert.ToInt32(cboDonViLamViec.SelectedValue);
                            hd.DiaDiemLamViec = txtDiaDiemLamViec.Text;
                            hd.TrinhDoChuyenMon = txtTrinhDoChuyenMon.Text;
                            hd.IDChucDanhNghiepVu = Convert.ToInt32(cboChucDanhNghiepVu.SelectedValue);
                            hd.IDChucDanhCongViec = Convert.ToInt32(cboChucDanhCongViec.SelectedValue);
                            hd.MucHuong = Convert.ToInt32(txtMucHuong.Text);
                            hd.IDBacNgach = Convert.ToInt32(cboBac.SelectedValue);
                            if (txtPhuCapCV.Text != "") hd.PhuCapCV = Convert.ToDecimal(txtPhuCapCV.Text);
                            else hd.PhuCapCV = null;
                            if (txtMucLuongToiThieu.Text != "") hd.MucLuongToiThieu = Convert.ToDecimal(txtMucLuongToiThieu.Text);
                            else hd.MucLuongToiThieu = null;
                            if (txtTepDinhKem.UploadedFiles.Count > 0)
                            {
                                string targetFolder = txtTepDinhKem.TargetFolder;
                                hd.TepDinhKem = Path.Combine(Server.MapPath(targetFolder), txtSoHD.Text.Replace("/", "_") + "_" + txtTepDinhKem.UploadedFiles[0].FileName.Replace(" ", "_"));
                            }
                            hd.GhiChu = txtGhiChu.Text;
                            hd.NguoiTao = hd.NguoiCapNhat = idUser;
                            hd.NgayTao = hd.NgayCapNhat = DateTime.Now;
                            _entities.AddToHopDongLDs(hd);
                            try
                            {
                                _entities.SaveChanges();
                                LoadGrid();
                                RadWindowManager1.RadAlert("Thêm thông tin thành công", 285, 100, "Thông báo", "");
                            }
                            catch (Exception ex)
                            {
                                RadWindowManager1.RadAlert("Thêm thông tin thất bại", 285, 100, "Lỗi", "");
                                throw ex;
                            }
                        }
                        else
                        {
                            RadWindowManager1.RadAlert("Đã tồn tại số hợp đồng này", 285, 100, "Lỗi", "");
                        }
                    }
                    else
                    {
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
                        if (txtPhuCapCV.Text != "") hopDongLD.PhuCapCV = Convert.ToDecimal(txtPhuCapCV.Text);
                        if (txtMucLuongToiThieu.Text != "") hopDongLD.MucLuongToiThieu = Convert.ToDecimal(txtMucLuongToiThieu.Text);
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
                            RadWindowManager1.RadAlert("Sửa thông tin thành công", 285, 100, "Thông báo", "");
                            LoadGrid();
                        }
                        catch (Exception ex)
                        {
                            RadWindowManager1.RadAlert("Sửa thông tin thất bại", 285, 100, "Lỗi", "");
                            throw ex;
                        }
                    }
                    break;
                case "Reset":
                    txtSoHD.Text = "/" + DateTime.Now.Year.ToString() + "/HĐLĐ/AITS.";
                    txtNgayKyHD.Clear();
                    cboLoaiHD.SelectedIndex = -1;
                    txtTuNgayKyHD.Clear();
                    txtDenNgayKyHD.Clear();
                    cboNguoiLD.SelectedIndex = -1;
                    cboChucDanhNghiepVu.SelectedIndex = -1;
                    cboChucDanhCongViec.SelectedIndex = -1;
                    cboNgach.SelectedIndex = -1;
                    LoadBacNgach(Convert.ToInt32(cboNgach.SelectedValue));
                    LoadHeSoBacNgach();
                    txtTrinhDoChuyenMon.Text = "";
                    cboDonViLamViec.SelectedIndex = -1;
                    txtMucLuongBHXH.Text = "";
                    txtMucHuong.Text = "100";
                    txtPhuCapCV.Text = "";
                    txtMucLuongToiThieu.Text = "";
                    cboNguoiDaiDien.SelectedIndex = -1;
                    txtGhiChu.Text = "";
                    txtTepDinhKem.UploadedFiles.Clear();
                    idHopDong = null;
                    break;
                case "Report":
                    Session["PrintType"] = "HopDong";
                    Response.Redirect("InHD.aspx");
                    break;
                case "PhuLuc":
                    if (Session["idHD"] != null)
                    {
                        Response.Redirect("ThemPhuLucHD.aspx");
                    }
                    else
                    {
                        RadWindowManager1.RadAlert("Chưa chọn hợp đồng", 285, 100, "Lưu ý", null);
                    }
                    break;
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
            txtMucLuongBHXH.Text = String.Format("{0:###,###,###} ₫", luongBH/10);
        }

        protected void grvHopDong_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "RowClick" && e.Item is GridDataItem)
            {
                e.Item.Selected = true;
                idHopDong = Convert.ToInt32(e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["IDHopDongLD"]);
                Session["idHD"] = idHopDong;
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
                LoadHeSoBacNgach();
                if (!Page.ClientScript.IsStartupScriptRegistered("cal"))
                {
                    Page.ClientScript.RegisterStartupScript
                        (this.GetType(), "cal", "CalLuong(this.txtMucLuongToiThieu);", true);
                }
                txtTrinhDoChuyenMon.Text = hopDong.TrinhDoChuyenMon;
                cboDonViLamViec.SelectedValue = hopDong.IDCoCauToChuc.ToString();
                txtMucHuong.Text = hopDong.MucHuong.ToString();
                txtMucLuongToiThieu.Text = hopDong.MucLuongToiThieu.ToString();
                Decimal luongBH = Convert.ToDecimal(txtHeSo.Text.Replace('.',',')) * Convert.ToDecimal(txtMucLuongToiThieu.Value);
                txtMucLuongBHXH.Text = String.Format("{0:###,###,###} ₫", luongBH/10);
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
            }
        }

        protected void grvHopDong_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            var listHD = _entities.GetHopDongByIDNhanVien(idNhanVien);
            grvHopDong.DataSource = listHD;
        }

        protected void grvHopDong_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            int id = Convert.ToInt32((e.Item as GridDataItem).GetDataKeyValue("IDHopDongLD"));
            var phuluchd = _entities.PhuLucHDs.Where(p => p.IDHopDongLD == id);
            foreach (PhuLucHD pl in phuluchd)
            {
                if (System.IO.File.Exists(pl.TepDinhKem))
                {
                    File.Delete(System.IO.Path.GetFullPath(pl.TepDinhKem));
                }
                _entities.PhuLucHDs.DeleteObject(pl);
            }
            var hopdongld = _entities.HopDongLDs.Where(h => h.IDHopDongLD == id).FirstOrDefault();
            if (System.IO.File.Exists(hopdongld.TepDinhKem))
            {
                File.Delete(System.IO.Path.GetFullPath(hopdongld.TepDinhKem));
            }
            _entities.DeleteHopDongByID(id);
            _entities.SaveChanges();
            LoadGrid();
        }

        protected void txtTepDinhKem_FileUploaded(object sender, FileUploadedEventArgs e)
        {
            string targetFolder = txtTepDinhKem.TargetFolder;
            if (idHopDong == null)
            {
                e.File.SaveAs(Path.Combine(Server.MapPath(targetFolder), txtSoHD.Text.Replace("/", "_") + "_" + e.File.FileName.Replace(" ", "_")));
            }
            else
            {
                var hd = _entities.GetHopDongByID(idHopDong).FirstOrDefault();
                if(System.IO.File.Exists(hd.TepDinhKem)) File.Delete(System.IO.Path.GetFullPath(hd.TepDinhKem));
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
    }
}
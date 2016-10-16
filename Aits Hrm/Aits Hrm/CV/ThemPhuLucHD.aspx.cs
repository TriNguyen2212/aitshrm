using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Aits_Hrm.Model;
using System.IO;
using Aits_Hrm.CommonMethod;

namespace Aits_Hrm.CV
{
    public partial class ThemPhuLucHD : System.Web.UI.Page
    {
        private QuanLyNhanSuEntities _entities = new QuanLyNhanSuEntities();
        static string prevPage = String.Empty; // static variable to back previous page
        Methods cbm = new Methods();
        private int idUser;
        private static int? idHopDong = null;
        private static int? idPhuLuc = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            idUser = (int)Session["userID"];
            if (Session["idHD"] != null) idHopDong = (int)Session["idHD"];
            else
            {
                RadWindowManager1.RadAlert("Chọn hợp đồng trước khi thêm phụ lục",285,100,"Lỗi","");
                Response.Redirect("HopDong.aspx");
            }
            if (!IsPostBack)
            {
                prevPage = Request.UrlReferrer.ToString();
                var hopDong = _entities.GetHopDongByID(idHopDong).FirstOrDefault();
                txtSoHD.Text = hopDong.SoHD;
                txtDonViLamViec.Text = hopDong.ToChuc;
                txtDiaChi.Text = hopDong.DiaDiemLamViec;
                txtNguoiLD.Text = hopDong.NguoiLaoDong;
                int? idNguoiLD = hopDong.IDNhanVien;
                var nguoiLD = _entities.GetCVByID(idNguoiLD).FirstOrDefault();
                txtQuocTichNguoiLD.Text = nguoiLD.QuocTich;
                txtNgaySinh.Text = String.Format("{0:dd/MM/yyyy}", nguoiLD.NgaySinh);
                txtNoiSinh.Text = nguoiLD.NoiSinh;
                txtDiaChiThuongTru.Text = nguoiLD.HoKhauThuongTru;
                txtCMND.Text = nguoiLD.SoCNMD;
                txtNoiCap.Text = nguoiLD.NoiCapCMND;
                txtNgayCap.Text = String.Format("{0:dd/MM/yyyy}", nguoiLD.NgayCapCMND);
                txtTrinhDoChuyenMon.Text = hopDong.TrinhDoChuyenMon;
                cbm.LoadCombobox(cboNguoiDaiDien, _entities.HoSoNhanVien_UngVien, "TenNV", "IDNhanVien");
                //LoadGrid();
                txtSoPhuLuc.Focus();
                LoadGrid();
            }
        }

        private void LoadGrid()
        {
            var listPL = _entities.GetPhuLucHdByIDHd(idHopDong);
            grvPhuLuc.DataSource = listPL;
            grvPhuLuc.DataBind();
        }

        private void LoadInfoNguoiDaiDien()
        {
            int idNguoiDaiDien = Convert.ToInt32(cboNguoiDaiDien.SelectedValue);
            var ngDaiDien = _entities.GetChucDanhByNhanVien(idNguoiDaiDien).FirstOrDefault();
            if (ngDaiDien != null) txtChucDanhNguoiDaiDien.Text = ngDaiDien.TenChucDanh;
            else txtChucDanhNguoiDaiDien.Text = "";
        }

        protected void cboNguoiDaiDien_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            LoadInfoNguoiDaiDien();
        }

        protected void RadToolBar1_ButtonClick(object sender, RadToolBarEventArgs e)
        {
            switch (e.Item.Value)
            {
                case "Save":
                    if (idPhuLuc == null)
                    {
                        PhuLucHD phuluc = new PhuLucHD();
                        phuluc.IDHopDongLD = idHopDong;
                        phuluc.SoPhuLuc = txtSoPhuLuc.Text;
                        phuluc.TenPhuLuc = txtTenPhuLuc.Text;
                        phuluc.NgayHieuLuc = txtNgayUyQuyen.SelectedDate;
                        phuluc.NgayKy = txtNgayKy.SelectedDate;
                        phuluc.IDNguoiDaiDien = Convert.ToInt32(cboNguoiDaiDien.SelectedValue);
                        if (txtTepDinhKem.UploadedFiles.Count > 0)
                        {
                            string targetFolder = txtTepDinhKem.TargetFolder;
                            phuluc.TepDinhKem = Path.Combine(Server.MapPath(targetFolder), txtSoPhuLuc.Text.Replace("/", "_") + "_" + txtTepDinhKem.UploadedFiles[0].FileName.Replace(" ", "_"));
                        }
                        phuluc.NgayTao = phuluc.NgayCapNhat = DateTime.Now;
                        phuluc.NguoiTao = phuluc.NguoiCapNhat = idUser;
                        _entities.AddToPhuLucHDs(phuluc);
                        try
                        {
                            _entities.SaveChanges();
                            grvPhuLuc.Rebind();
                            RadWindowManager1.RadAlert("Thêm thông tin thành công", 285, 100, "Thông báo", "");
                            //LoadGrid();
                        }
                        catch (Exception ex)
                        {
                            RadWindowManager1.RadAlert("Thêm thông tin thất bại", 285, 100, "Lỗi", "");
                            throw ex;
                        }
                    }
                    else
                    {
                        PhuLucHD phuluc = _entities.PhuLucHDs.Where(p => p.IDPhuLucHD == idPhuLuc).FirstOrDefault();
                        phuluc.IDHopDongLD = idHopDong;
                        phuluc.SoPhuLuc = txtSoPhuLuc.Text;
                        phuluc.TenPhuLuc = txtTenPhuLuc.Text;
                        phuluc.NgayHieuLuc = txtNgayUyQuyen.SelectedDate;
                        phuluc.NgayKy = txtNgayKy.SelectedDate;
                        phuluc.IDNguoiDaiDien = Convert.ToInt32(cboNguoiDaiDien.SelectedValue);
                        if (txtTepDinhKem.UploadedFiles.Count > 0)
                        {
                            string targetFolder = txtTepDinhKem.TargetFolder;
                            phuluc.TepDinhKem = Path.Combine(Server.MapPath(targetFolder), txtSoPhuLuc.Text.Replace("/", "_") + "_" + txtTepDinhKem.UploadedFiles[0].FileName.Replace(" ", "_"));
                        }
                        phuluc.NgayCapNhat = DateTime.Now;
                        phuluc.NguoiCapNhat = idUser;
                        try
                        {
                            _entities.SaveChanges();
                            grvPhuLuc.Rebind();
                            RadWindowManager1.RadAlert("Sửa thông tin thành công",285,100,"Thông báo","");
                            //LoadGrid();
                        }
                        catch (Exception ex)
                        {
                            RadWindowManager1.RadAlert("Sửa thông tin thất bại", 285, 100, "Lỗi", "");
                            throw ex;
                        }
                    }
                    break;
                case "Reset":
                    txtSoPhuLuc.Text = "";
                    txtNgayKy.Clear();
                    txtTenPhuLuc.Text = "";
                    txtNgayUyQuyen.Clear();
                    txtTepDinhKem.UploadedFiles.Clear();
                    idPhuLuc = null;
                    break;
                case "Print":
                    Session["PrintType"] = "PhuLuc";
                    Response.Redirect("InHD.aspx");
                    break;
                case "HopDong":
                    Session["idHD"] = idHopDong;
                    Response.Redirect("SuaHopDong.aspx");
                    break;
            }
        }

        protected void txtTepDinhKem_FileUploaded(object sender, FileUploadedEventArgs e)
        {
            string targetFolder = txtTepDinhKem.TargetFolder;
            if (idPhuLuc == null)
            {
                e.File.SaveAs(Path.Combine(Server.MapPath(targetFolder), txtSoPhuLuc.Text.Replace("/", "_") + "_" + e.File.FileName.Replace(" ", "_")));
            }
            else
            {
                var pl = _entities.PhuLucHDs.Where(p => p.IDPhuLucHD == idPhuLuc).FirstOrDefault();
                if (System.IO.File.Exists(pl.TepDinhKem)) File.Delete(System.IO.Path.GetFullPath(pl.TepDinhKem));
                e.File.SaveAs(Path.Combine(Server.MapPath(targetFolder), txtSoPhuLuc.Text.Replace("/", "_") + "_" + e.File.FileName.Replace(" ", "_")));
            }
        }

        protected void grvPhuLuc_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "RowClick" && e.Item is GridDataItem)
            {
                e.Item.Selected = true;
                idPhuLuc = Convert.ToInt32(e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["IDPhuLucHD"]);
                Session["IDPhuLucHD"] = idPhuLuc;
                var phuLuc = _entities.PhuLucHDs.Where(p => p.IDPhuLucHD == idPhuLuc).FirstOrDefault();
                txtSoPhuLuc.Text = phuLuc.SoPhuLuc;
                txtTenPhuLuc.Text = phuLuc.TenPhuLuc;
                txtNgayKy.SelectedDate = phuLuc.NgayKy;
                txtNgayUyQuyen.SelectedDate = phuLuc.NgayHieuLuc;
                cboNguoiDaiDien.SelectedValue = phuLuc.IDNguoiDaiDien.ToString();
                // xu li file attach
                if (phuLuc.TepDinhKem != null && phuLuc.TepDinhKem != "")
                {
                    String pathFile = phuLuc.TepDinhKem;
                    ViewState["fileAttach"] = pathFile;
                    btnDownload.Text = Path.GetFileName(pathFile);
                }
                else { btnDownload.Text = ""; }
            }
        }

        protected void grvPhuLuc_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            var listPL = _entities.GetPhuLucHdByIDHd(idHopDong);
            grvPhuLuc.DataSource = listPL;
        }

        protected void grvPhuLuc_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            int id = Convert.ToInt32((e.Item as GridDataItem).GetDataKeyValue("IDPhuLucHD"));
            var phuluchd = _entities.PhuLucHDs.Where(p => p.IDPhuLucHD == id).FirstOrDefault();
            if (System.IO.File.Exists(phuluchd.TepDinhKem))
            {
                File.Delete(System.IO.Path.GetFullPath(phuluchd.TepDinhKem));
                btnDownload.Text = "";
            }
            _entities.PhuLucHDs.DeleteObject(phuluchd);
            _entities.SaveChanges();
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

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect(prevPage);
        }
    }
}
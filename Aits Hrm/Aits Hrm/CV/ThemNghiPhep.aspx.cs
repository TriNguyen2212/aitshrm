using System;
using System.Linq;
using System.Web.UI.WebControls;
using Aits_Hrm.CommonMethod;
using Aits_Hrm.Model;
using Telerik.Web.UI;

namespace Aits_Hrm.CV
{
    public partial class ThemNghiPhep : System.Web.UI.Page
    {
        private QuanLyNhanSuEntities _entities = new QuanLyNhanSuEntities();
        Methods cbm = new Methods();
        private int idUser;
        private static int? idNV = null;
        private static int? iDNghi = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            idUser = (int)Session["userID"];
            if (Session["idNV"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
            else
            {
                idNV = Convert.ToInt32(Session["idNV"]);
            }
            if (!IsPostBack)
            {
                cbm.LoadCombobox(cboLoaiNghi, _entities.LoaiNghis, "LoaiNghi1", "IDLoaiNghi");
                cbm.LoadCombobox(cboNhanVien, _entities.HoSoNhanVien_UngVien, "TenNV", "IDNhanVien");
                cbm.LoadCombobox(cboNhanVienBanGiao, _entities.HoSoNhanVien_UngVien, "TenNV", "IDNhanVien");
                RadComboBoxItem nullItem = new RadComboBoxItem("Chọn nhân viên bàn giao", "");
                cboNhanVienBanGiao.Items.Insert(0, nullItem);
                LoadData();
            }
        }

        private void LoadData()
        {
            var lstDonVi = _entities.GetDonViCongTacByIDNhanVien(idNV).FirstOrDefault();
            if (lstDonVi != null)
            {
                lbDonVi.Text = lstDonVi.TenDonVi;
            }
            else
            {
                lbDonVi.Text = "";
            }
            var usr = _entities.GetCVByID(idNV).FirstOrDefault();
            if (usr != null)
            {
                cboNhanVien.SelectedValue = idNV.ToString();
                txtMaNV.Text = usr.MaNV;
                lbNamSinh.Text = String.Format("{0:yyyy}", usr.NgaySinh);
                lbNgayBienChe.Text = String.Format("{0:dd/MM/yyyy}", usr.NgayBienChe);
                lbNgayVaoHK.Text = String.Format("{0:dd/MM/yyyy}", usr.NgayVaoHK);
                var macd = _entities.GetChucDanhByNhanVien(idNV).FirstOrDefault();
                if (macd != null)
                {
                    lbMaChucDanh.Text = macd.MaChucDanh;
                }
                LoadPhepNam();
            }
        }

        private void LoadPhepNam()
        {
            var usr = _entities.GetCVByID(idNV).FirstOrDefault();
            int tongPhepNam;
            int? soNgayDaNghi = 0;
            var lstNghi = _entities.GetNghiByIDNhanVien(idNV);
            if (lstNghi != null)
            {
                foreach (GetNghiByIDNhanVien_Result1 nghiObj in lstNghi)
                {
                    if (Convert.ToDateTime(nghiObj.TuNgay).Year == DateTime.Now.Year && nghiObj.DuocNghi == true 
                        && nghiObj.TuNgay != null && nghiObj.DenNgay != null && nghiObj.LoaiNghi == "Phép năm")
                    {
                        soNgayDaNghi += nghiObj.SoNgayDaNghi;
                        //TimeSpan ts = Convert.ToDateTime(nghiObj.DenNgay) - Convert.ToDateTime(nghiObj.TuNgay);
                        //soNgayDaNghi += Convert.ToInt32(ts.TotalDays) + 1;
                    }
                }
            }
            int soNgayConLai = cbm.RemainHoliday(usr.NgayBienChe, usr.NgayVaoHK, soNgayDaNghi, out tongPhepNam);
            lbTongPhepNam.Text = tongPhepNam.ToString();
            lbTongDaNghi.Text = soNgayDaNghi.ToString();
            lbSoNgayConLai.Text = soNgayConLai.ToString();
        }

        protected void RadToolBar1_ButtonClick(object sender, RadToolBarEventArgs e)
        {
            switch (e.Item.Value)
            {
                case "Save":
                    if (txtDenNgay.SelectedDate == null || txtTuNgay.SelectedDate <= txtDenNgay.SelectedDate)
                    {
                        if (iDNghi == null)
                        {
                            Nghi ng = new Nghi();
                            ng.IDNhanVien = idNV;
                            ng.IDLoaiNghi = Convert.ToInt32(cboLoaiNghi.SelectedValue);
                            ng.TuNgay = txtTuNgay.SelectedDate;
                            ng.DenNgay = txtDenNgay.SelectedDate;
                            if (lbSoNgayXinNghi.Text!="")
                            {
                                ng.SoNgayDaNghi = Convert.ToInt32(lbSoNgayXinNghi.Text);
                            }
                            ng.LyDoNghi = txtLyDo.Text;
                            if (cboNhanVienBanGiao.SelectedValue == "")
                            {
                                ng.IDNhanVienBanGiao = null;
                            }
                            else
                            {
                                ng.IDNhanVienBanGiao = Convert.ToInt32(cboNhanVienBanGiao.SelectedValue);
                            }
                            if (radioDongY.SelectedValue != "")
                            {
                                ng.DuocNghi = Convert.ToBoolean(radioDongY.SelectedValue);
                            }
                            ng.NguoiTao = ng.NguoiCapNhat = idUser;
                            ng.NgayTao = ng.NgayCapNhat = DateTime.Now;
                            _entities.AddToNghis(ng);
                            _entities.SaveChanges();
                            grvNghi.Rebind();
                            RadWindowManager1.RadAlert("Thêm thông tin thành công", 285, 100, "Thông báo", "");
                        }
                        else
                        {
                            Nghi ng = _entities.Nghis.Where(d => d.IDNghiPhep == iDNghi).First();
                            ng.IDLoaiNghi = Convert.ToInt32(cboLoaiNghi.SelectedValue);
                            ng.TuNgay = txtTuNgay.SelectedDate;
                            ng.DenNgay = txtDenNgay.SelectedDate;
                            if (lbSoNgayXinNghi.Text != "")
                            {
                                ng.SoNgayDaNghi = Convert.ToInt32(lbSoNgayXinNghi.Text);
                            }
                            ng.LyDoNghi = txtLyDo.Text;
                            if (cboNhanVienBanGiao.SelectedValue == "")
                            {
                                ng.IDNhanVienBanGiao = null;
                            }
                            else
                            {
                                ng.IDNhanVienBanGiao = Convert.ToInt32(cboNhanVienBanGiao.SelectedValue);
                            }
                            if (radioDongY.SelectedValue != "")
                            {
                                ng.DuocNghi = Convert.ToBoolean(radioDongY.SelectedValue);
                            }
                            ng.NguoiCapNhat = idUser;
                            ng.NgayCapNhat = DateTime.Now;
                            _entities.SaveChanges();
                            grvNghi.Rebind();
                            RadWindowManager1.RadAlert("Sửa thông tin thành công", 285, 100, "Thông báo", "");
                        }
                    }
                    else
                    {
                        lbSoNgayXinNghi.Text = "Lỗi: thời gian xin nghỉ không hợp lý";
                    }
                    LoadPhepNam();
                    break;
                case "Reset":
                    cboLoaiNghi.SelectedIndex = -1;
                    cboNhanVienBanGiao.SelectedIndex = -1;
                    txtTuNgay.Clear();
                    txtDenNgay.Clear();
                    lbSoNgayXinNghi.Text="";
                    txtLyDo.Text = "";
                    lbSoNgayXinNghi.Text = "";
                    radioDongY.ClearSelection();
                    LoadPhepNam();
                    iDNghi = null;
                    break;
                case "Report":
                    RadWindowManager1.RadAlert("Chức năng đang phát triển", 285, 100, "Thông báo", "");
                    break;
            }
        }

        protected void grvNghi_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            var lstObj = _entities.GetNghiByIDNhanVien(idNV);
            grvNghi.DataSource = lstObj;
        }

        protected void grvNghi_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "RowClick" && e.Item is GridDataItem)
            {
                e.Item.Selected = true;
                iDNghi = Convert.ToInt32(e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["IDNghiPhep"]);
                var ng = _entities.Nghis.Where(d => d.IDNghiPhep == iDNghi).First();
                cboLoaiNghi.SelectedValue = ng.IDLoaiNghi.ToString();
                txtTuNgay.SelectedDate = ng.TuNgay;
                txtDenNgay.SelectedDate = ng.DenNgay;
                lbSoNgayXinNghi.Text = ng.SoNgayDaNghi.ToString();
                txtLyDo.Text = ng.LyDoNghi;
                if (ng.TuNgay != null && ng.DenNgay != null)
                {
                    TimeSpan ts = Convert.ToDateTime(ng.DenNgay) - Convert.ToDateTime(ng.TuNgay);
                    lbSoNgayXinNghi.Text = (ts.TotalDays + 1).ToString();
                }
                if (ng.IDNhanVienBanGiao == null)
                {
                    cboNhanVienBanGiao.SelectedValue = "";
                }
                else
                {
                    cboNhanVienBanGiao.SelectedValue = ng.IDNhanVienBanGiao.ToString();
                }
                if (ng.DuocNghi != null)
                {
                    radioDongY.SelectedValue = ng.DuocNghi.ToString();
                }
                else
                {
                    radioDongY.ClearSelection();
                }
            }
        }

        protected void grvNghi_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            var iD = (e.Item as GridDataItem).GetDataKeyValue("IDNghiPhep").ToString();
            int id = Convert.ToInt32(iD);
            Nghi ng = _entities.Nghis.Where(d => d.IDNghiPhep == id).First();
            _entities.Nghis.DeleteObject(ng);
            _entities.SaveChanges();
            iDNghi = null;
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

        protected void txtDenNgay_SelectedDateChanged(object sender, Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs e)
        {
            if (txtTuNgay.SelectedDate != null && txtDenNgay.SelectedDate != null)
            {
                if (txtTuNgay.SelectedDate <= txtDenNgay.SelectedDate)
                {
                    TimeSpan ts = Convert.ToDateTime(txtDenNgay.SelectedDate) - Convert.ToDateTime(txtTuNgay.SelectedDate);
                    lbSoNgayXinNghi.Text = (ts.TotalDays + 1).ToString();
                }
                else
                {
                    lbSoNgayXinNghi.Text = "Lỗi: thời gian xin nghỉ không hợp lý";
                }
            }
            else
            {
                lbSoNgayXinNghi.Text = "";
            }
        }

        protected void txtTuNgay_SelectedDateChanged(object sender, Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs e)
        {
            if (txtTuNgay.SelectedDate != null && txtDenNgay.SelectedDate != null)
            {
                if (txtTuNgay.SelectedDate <= txtDenNgay.SelectedDate)
                {
                    TimeSpan ts = Convert.ToDateTime(txtDenNgay.SelectedDate) - Convert.ToDateTime(txtTuNgay.SelectedDate);
                    lbSoNgayXinNghi.Text = (ts.TotalDays + 1).ToString();
                }
                else
                {
                    lbSoNgayXinNghi.Text = "Lỗi: thời gian xin nghỉ không hợp lý";
                }
            }
            else
            {
                lbSoNgayXinNghi.Text = "";
            }
        }
    }
}
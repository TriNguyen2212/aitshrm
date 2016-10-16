using System;
using System.Linq;
using System.Web.UI.WebControls;
using Aits_Hrm.CommonMethod;
using Aits_Hrm.Model;
using Telerik.Web.UI;

namespace Aits_Hrm.Salary
{
    public partial class QLNghi : System.Web.UI.Page
    {
        private QuanLyNhanSuEntities _entities = new QuanLyNhanSuEntities();
        Methods cbm = new Methods();
        private static int? userid = null;
        private static int? iDNghi = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
            else
            {
                userid = Convert.ToInt32(Session["userID"]);
            }
            if (!IsPostBack)
            {
                cbm.LoadCombobox(cboLoaiNghi, _entities.LoaiNghis, "LoaiNghi1", "IDLoaiNghi");
                cbm.LoadCombobox(cboNhanVien, _entities.HoSoNhanVien_UngVien, "TenNV", "IDNhanVien");
                cbm.LoadCombobox(cboNhanVienBanGiao, _entities.HoSoNhanVien_UngVien, "TenNV", "IDNhanVien");
                RadComboBoxItem nullItem = new RadComboBoxItem("Chọn nhân viên bàn giao", "");
                cboNhanVienBanGiao.Items.Insert(0,nullItem);

                LoadData();
            }
        }

        private void LoadData()
        {
            var lstDonVi = _entities.GetDonViCongTacByIDNhanVien(userid).FirstOrDefault();
            if (lstDonVi != null)
            {
                lbDonVi.Text = lstDonVi.TenDonVi;
            }
            else
            {
                lbDonVi.Text = "";
            }
            var usr = _entities.GetCVByID(userid).FirstOrDefault();
            if (usr != null)
            {
                cboNhanVien.SelectedValue = userid.ToString();
                txtMaNV.Text = usr.MaNV;
                lbNamSinh.Text = String.Format("{0:yyyy}", usr.NgaySinh);
                lbNgayBienChe.Text = String.Format("{0:dd/MM/yyyy}", usr.NgayBienChe);
                lbNgayVaoHK.Text = String.Format("{0:dd/MM/yyyy}", usr.NgayVaoHK);
                var macd = _entities.GetChucDanhByNhanVien(userid).FirstOrDefault();
                if (macd != null)
                {
                    lbMaChucDanh.Text = macd.MaChucDanh;
                }
            }
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
                            ng.IDNhanVien = userid;
                            ng.IDLoaiNghi = Convert.ToInt32(cboLoaiNghi.SelectedValue);
                            ng.TuNgay = txtTuNgay.SelectedDate;
                            ng.DenNgay = txtDenNgay.SelectedDate;
                            if (lbSoNgayXinNghi.Text != "")
                            {
                                ng.SoNgayDaNghi = Convert.ToInt32(lbSoNgayXinNghi.Text);
                            }
                            ng.LyDoNghi = txtLyDo.Text;
                            ng.DuocNghi = null;
                            if (cboNhanVienBanGiao.SelectedValue == "")
                            {
                                ng.IDNhanVienBanGiao = null;
                            }
                            else
                            {
                                ng.IDNhanVienBanGiao = Convert.ToInt32(cboNhanVienBanGiao.SelectedValue);
                            }
                            ng.NguoiTao = ng.NguoiCapNhat = userid;
                            ng.NgayTao = ng.NgayCapNhat = DateTime.Now;
                            _entities.AddToNghis(ng);
                            _entities.SaveChanges();
                            grvNghi.Rebind();
                            RadWindowManager1.RadAlert("Thêm thông tin thành công", 285, 100, "Thông báo", null);
                        }
                        else
                        {
                            Nghi ng = _entities.Nghis.Where(d => d.IDNghiPhep == iDNghi).First();
                            if (ng.DuocNghi == null)
                            {
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
                                ng.NguoiCapNhat = userid;
                                ng.NgayCapNhat = DateTime.Now;
                                _entities.SaveChanges();
                                grvNghi.Rebind();
                                RadWindowManager1.RadAlert("Sửa thông tin thành công",285,100,"Thông báo",null);
                            }
                            }
                        }
                        else
                        {
                            lbSoNgayXinNghi.Text = "Lỗi: thời gian xin nghỉ không hợp lý";
                        }
                    break;
                case "Reset":
                    cboLoaiNghi.SelectedIndex = -1;
                    cboNhanVienBanGiao.SelectedIndex = -1;
                    txtTuNgay.Clear();
                    txtDenNgay.Clear();
                    lbSoNgayXinNghi.Text = "";
                    txtLyDo.Text = "";
                    lbSoNgayXinNghi.Text = "";
                    iDNghi = null;
                    ToogleControl(null);
                    break;
                case "Report":
                    RadWindowManager1.RadAlert("Chức năng chưa hoàn thiện", 285, 100, "Lỗi","");
                    break;
            }
        }

        protected void grvNghi_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            var lstObj = _entities.GetNghiByIDNhanVien(userid);
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
                txtLyDo.Text = ng.LyDoNghi;
                if (ng.TuNgay != null && ng.DenNgay != null)
                {
                    //TimeSpan ts = Convert.ToDateTime(ng.DenNgay) - Convert.ToDateTime(ng.TuNgay);
                    //lbSoNgayXinNghi.Text = (ts.TotalDays +1).ToString();
                    lbSoNgayXinNghi.Text = ng.SoNgayDaNghi.ToString();
                }
                if (ng.IDNhanVienBanGiao == null)
                {
                    cboNhanVienBanGiao.SelectedValue = "";
                }
                else
                {
                    cboNhanVienBanGiao.SelectedValue = ng.IDNhanVienBanGiao.ToString();
                }
                ToogleControl(ng.DuocNghi);
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

        public void ToogleControl(bool? b)
        {
            if (b == null)
            {
                cboLoaiNghi.Enabled = true;
                txtTuNgay.Enabled = true;
                txtDenNgay.Enabled = true;
                lbSoNgayXinNghi.Enabled = true;
                txtLyDo.Enabled = true;
                cboNhanVienBanGiao.Enabled = true;
            }
            else
            {
                cboLoaiNghi.Enabled = false;
                txtTuNgay.Enabled = false;
                txtDenNgay.Enabled = false;
                lbSoNgayXinNghi.Enabled = false;
                txtLyDo.Enabled = false;
                cboNhanVienBanGiao.Enabled = false;
            }
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
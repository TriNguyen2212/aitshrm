using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Aits_Hrm.CommonMethod;
using Aits_Hrm.Model;
using Telerik.Web.UI;
using System.Collections;

namespace Aits_Hrm.CV
{
    public partial class ThemQTLamViec : System.Web.UI.Page
    {        
        private QuanLyNhanSuEntities _entities = new QuanLyNhanSuEntities();
        Methods cbm = new Methods();
        private int idUser;
        private static int? idNV = null;
        private static int? idQTLamViec = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckPermis();
            idUser = (int)Session["userID"];
            if (Session["idNV"] == null)
            {
                Response.Redirect("HoSo.aspx");
            }
            else
            {
                idNV = Convert.ToInt32(Session["idNV"]);
            }
            if (!IsPostBack)
            {
                // Load data into each combobox
                cbm.LoadCombobox(cboChucDanh, _entities.ChucDanhs, "TenChucDanh", "IDChucDanh");
                cbm.LoadCombobox(cboNhomChucDanh, _entities.NhomChucDanhs, "NhomChucDanh1", "IDNhomChucDanh");
                cbm.LoadCombobox(cboDonVi, _entities.CoCauToChucs, "TenDonVi", "IDCoCauToChuc");
                int idCoCauToChuc = Convert.ToInt32(cboDonVi.SelectedValue);
                var dc = _entities.CoCauToChucs.Where(d => d.IDCoCauToChuc == idCoCauToChuc).FirstOrDefault();
                txtDiaDiemLamViec.Text = dc.DiaChi;
                //cbm.LoadCombobox(cboDiaDiemLamViec, _entities.CoCauToChucs, "DiaChi", "IDCoCauToChuc");
                //var dv = _entities.CoCauToChucs.Where(d => d.IDParent == null);
                //cboDonVi.DataSource = dv;
                //cboDonVi.DataValueField = "IDCoCauToChuc";
                //cboDonVi.DataTextField = "TenDonVi";
                //cboDonVi.DataBind();
                //txtDiaDiemLamViec.Text = dv.FirstOrDefault().DiaChi;                
                // End load
                idQTLamViec = null;
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
            dsQuyen.AddRange(_entities.GetQuyenByIDNhanVien(IDUser, 8).ToArray());//chuc nang QTCT
            RadToolBar1.Items.FindItemByValue("Save").Enabled = dsQuyen.Contains(2);
            RadToolBar1.Items.FindItemByValue("Reset").Enabled = dsQuyen.Contains(2);
            grdQTLamViec.Columns.FindByUniqueName("columnXoa").Visible = dsQuyen.Contains(3);
        }

        protected void RadToolBar1_ButtonClick1(object sender, RadToolBarEventArgs e)
        {
            switch (e.Item.Value)
            {
                case "Save":
                    if (idQTLamViec == null)
                    {
                        QuaTrinhLamViec qt = new QuaTrinhLamViec();
                        qt.IDChucDanh = Convert.ToInt32(cboChucDanh.SelectedValue);                        
                        qt.IDCoCauToChuc = Convert.ToInt32(cboDonVi.SelectedValue);
                        qt.DiaDiemLamViec = txtDiaDiemLamViec.Text;
                        qt.IDNhanVien = idNV;
                        qt.MoTa = txtMoTa.Text;
                        qt.TenViec = txtTenCongViec.Text;
                        qt.ThoiGianBatdau = txtTuNgayQTLamViec.SelectedDate;
                        qt.ThoiGianKetThuc = txtDenNgayQTLamViec.SelectedDate;
                        if (txtMucLuong.Text != "")
                        {
                            qt.MucLuong = Convert.ToDecimal(txtMucLuong.Text);
                        }
                        else
                        {
                            qt.MucLuong = null;
                        }
                        qt.NgayTao = qt.NgayCapNhat = DateTime.Now;
                        qt.NguoiTao = qt.NguoiCapNhat = idUser;
                        _entities.AddToQuaTrinhLamViecs(qt);
                        try
                        {
                            _entities.SaveChanges();
                            grdQTLamViec.Rebind();
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
                        QuaTrinhLamViec quaTrinh = _entities.QuaTrinhLamViecs.Where(q => q.IDQuaTrinhLamViec == idQTLamViec).FirstOrDefault();
                        quaTrinh.IDChucDanh = Convert.ToInt32(cboChucDanh.SelectedValue);
                        if (txtMucLuong.Text != "")
                        {
                            quaTrinh.MucLuong = Convert.ToDecimal(txtMucLuong.Text);
                        }
                        else
                        {
                            quaTrinh.MucLuong = null;
                        }
                        quaTrinh.IDCoCauToChuc = Convert.ToInt32(cboDonVi.SelectedValue);
                        quaTrinh.DiaDiemLamViec = txtDiaDiemLamViec.Text;
                        quaTrinh.MoTa = txtMoTa.Text;
                        quaTrinh.TenViec = txtTenCongViec.Text;
                        quaTrinh.ThoiGianBatdau = txtTuNgayQTLamViec.SelectedDate;
                        quaTrinh.ThoiGianKetThuc = txtDenNgayQTLamViec.SelectedDate;
                        quaTrinh.NgayCapNhat = DateTime.Now;
                        quaTrinh.NguoiCapNhat = idUser;
                        try
                        {
                            _entities.SaveChanges();
                            grdQTLamViec.Rebind();
                            RadWindowManager1.RadAlert("Sửa thông tin thành công", 285, 100, "Thông báo", "");
                        }
                        catch (Exception ex)
                        {
                            RadWindowManager1.RadAlert("Sửa thông tin thất bại", 285, 100, "Lỗi", "");
                            throw ex;
                        }
                    }
                    break;
                case "Reset":
                    txtTenCongViec.Text = "";
                    txtMoTa.Text = "";
                    txtDenNgayQTLamViec.Clear();
                    txtTuNgayQTLamViec.Clear();
                    cboDonVi.SelectedIndex = -1;
                    cboChucDanh.SelectedIndex = -1;
                    txtMucLuong.Text = "";
                    int idcc = Convert.ToInt32(cboDonVi.SelectedValue);
                    var dd = _entities.CoCauToChucs.Where(d => d.IDCoCauToChuc == idcc).FirstOrDefault();
                    txtDiaDiemLamViec.Text = dd.DiaChi;
                    idQTLamViec = null;
                    break;
            }
        }

        protected void cboDonVi_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            int idCoCauToChuc = Convert.ToInt32(cboDonVi.SelectedValue);
            var dc = _entities.CoCauToChucs.Where(d => d.IDCoCauToChuc == idCoCauToChuc).FirstOrDefault();
            txtDiaDiemLamViec.Text = dc.DiaChi;
        }

        protected void cboChucDanh_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            int idchucdanh = Convert.ToInt32(cboChucDanh.SelectedValue);
            var chucDanh = (from cd in _entities.ChucDanhs where cd.IDChucDanh == idchucdanh select cd).FirstOrDefault();
            cboNhomChucDanh.SelectedValue = chucDanh.IDNhomChucDanh.ToString();
        }

        protected void grdQTLamViec_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "RowClick" && e.Item is GridDataItem)
            {
                e.Item.Selected = true;
                idQTLamViec = Convert.ToInt32(e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["IDQuaTrinhLamViec"]);
                var quaTrinh = _entities.QuaTrinhLamViecs.Where(q => q.IDQuaTrinhLamViec == idQTLamViec).FirstOrDefault();
                cboChucDanh.SelectedValue = quaTrinh.IDChucDanh.ToString();
                cboDonVi.SelectedValue = quaTrinh.IDCoCauToChuc.ToString();
                txtDiaDiemLamViec.Text = quaTrinh.DiaDiemLamViec;
                txtMucLuong.Text = quaTrinh.MucLuong.ToString();
                txtMoTa.Text = quaTrinh.MoTa;
                txtTenCongViec.Text = quaTrinh.TenViec;
                txtTuNgayQTLamViec.SelectedDate = quaTrinh.ThoiGianBatdau;
                txtDenNgayQTLamViec.SelectedDate = quaTrinh.ThoiGianKetThuc;
            }
        }

        protected void grdQTLamViec_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            var listQT = _entities.GetQuaTrinhLamViecByIDNhanVien(idNV);
            grdQTLamViec.DataSource = listQT;
        }

        protected void grdQTLamViec_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            var ID = (e.Item as GridDataItem).GetDataKeyValue("IDQuaTrinhLamViec").ToString();
            int id = Convert.ToInt32(ID);
            QuaTrinhLamViec qt = _entities.QuaTrinhLamViecs.Where(q => q.IDQuaTrinhLamViec == id).FirstOrDefault();
            _entities.QuaTrinhLamViecs.DeleteObject(qt);
            _entities.SaveChanges();
        }
    }
}
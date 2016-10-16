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
    public partial class ThemNhanThan : System.Web.UI.Page
    {
        private QuanLyNhanSuEntities _entities = new QuanLyNhanSuEntities();
        Methods cbm = new Methods();
        private int idUser;
        private static int? idNhanThan = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckPermis();
            idUser = (int)Session["userID"];
            if (Session["idNV"] == null)
            {
                Response.Redirect("../Error.aspx");
            }
            if (!IsPostBack)
            {
                // Load data into each combobox
                cbm.LoadCombobox(cboQuanHe, _entities.QuanHes, "QuanHe1", "IDQuanHe");
                ArrayList namSinh = new ArrayList();
                for (int i = DateTime.Now.Year; i >= DateTime.Now.Year - 100; i--)
                {
                    namSinh.Add(i);
                }
                cboNamSinh.DataSource = namSinh;
                cboNamSinh.DataBind();
                // End load
                grdNhanThan.DataBind();
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
            dsQuyen.AddRange(_entities.GetQuyenByIDNhanVien(IDUser, 4).ToArray());//chuc nang nhan than
            RadToolBar1.Items.FindItemByValue("Save").Enabled = dsQuyen.Contains(2);
            RadToolBar1.Items.FindItemByValue("Reset").Enabled = dsQuyen.Contains(2);
            grdNhanThan.Columns.FindByUniqueName("columnXoa").Visible = dsQuyen.Contains(3);
        }

        private void LoadGrid()
        {
            var listNT = _entities.GetNhanThanByIDNhanVien((int)Session["idNV"]);
            grdNhanThan.DataSource = listNT;
            grdNhanThan.DataBind();
        }

        protected void RadToolBar1_ButtonClick1(object sender, RadToolBarEventArgs e)
        {
            switch (e.Item.Value)
            {
                case "Save":
                    if (idNhanThan == null)
                    {
                        NhanThan nt = new NhanThan();
                        nt.IDNhanVien = (int)Session["idNV"];
                        nt.HoTenNhanThan = txtHoTenNT.Text;
                        nt.IDQuanHe = Convert.ToInt32(cboQuanHe.SelectedValue);
                        nt.NamSinh = Convert.ToInt32(cboNamSinh.SelectedValue);
                        nt.NgheNghiep = txtNgheNghiep.Text;
                        nt.NgayTao = nt.NgayCapNhat = DateTime.Now;
                        nt.NguoiTao = nt.NguoiCapNhat = idUser;
                        _entities.AddToNhanThans(nt);
                        try
                        {
                            _entities.SaveChanges();
                            idNhanThan = null;
                            LoadGrid();
                            RadWindowManager1.RadAlert("Thêm thông tin thành công",285,100,"Thông báo",null);
                        }
                        catch (Exception ex)
                        {
                            RadWindowManager1.RadAlert("Thêm thông tin thất bại", 285, 100, "Lỗi", null);
                            throw ex;
                        }
                    }
                    else
                    {
                        NhanThan nt = _entities.NhanThans.Where(n => n.IDNhanThan == idNhanThan).FirstOrDefault();
                        nt.HoTenNhanThan = txtHoTenNT.Text;
                        nt.NamSinh = Convert.ToInt32(cboNamSinh.SelectedValue);
                        nt.IDQuanHe = Convert.ToInt32(cboQuanHe.SelectedValue);
                        nt.NgheNghiep = txtNgheNghiep.Text;
                        nt.NgayCapNhat = DateTime.Now;
                        nt.NguoiCapNhat = idUser;
                        _entities.SaveChanges();
                        LoadGrid();
                        RadWindowManager1.RadAlert("Sửa thông tin thành công", 285, 100, "Thông báo", null);
                    }
                    break;
                case "Reset":
                    txtHoTenNT.Text = "";
                    txtNgheNghiep.Text = "";
                    cboNamSinh.SelectedIndex = -1;
                    cboQuanHe.SelectedIndex = -1;
                    idNhanThan = null;
                    break;
            }
        }

        protected void grdNhanThan_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "RowClick" && e.Item is GridDataItem)
            {
                e.Item.Selected = true;
                idNhanThan = Convert.ToInt32(e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["IDNhanThan"]);
                var nhanThan = _entities.NhanThans.Where(nt => nt.IDNhanThan == idNhanThan).FirstOrDefault();
                txtHoTenNT.Text = nhanThan.HoTenNhanThan;
                txtNgheNghiep.Text = nhanThan.NgheNghiep;
                cboNamSinh.SelectedValue = nhanThan.NamSinh.ToString();
                cboQuanHe.SelectedValue = nhanThan.IDQuanHe.ToString();
            }
        }

        protected void grdNhanThan_DeleteCommand1(object sender, GridCommandEventArgs e)
        {
            var ID = (e.Item as GridDataItem).GetDataKeyValue("IDNhanThan").ToString();
            int id = Convert.ToInt32(ID);
            NhanThan nt = _entities.NhanThans.Where(n => n.IDNhanThan == id).FirstOrDefault();
            _entities.NhanThans.DeleteObject(nt);
            _entities.SaveChanges();
        }

        protected void grdNhanThan_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            var listNT = _entities.GetNhanThanByIDNhanVien((int)Session["idNV"]);
            grdNhanThan.DataSource = listNT;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Aits_Hrm.Model;
using Telerik.Web.UI;

namespace Aits_Hrm.QuanTri
{
    public partial class TaiKhoan : System.Web.UI.Page
    {
        private QuanLyNhanSuEntities _entities = new QuanLyNhanSuEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var dt = _entities.GetAllUser();
                RadGrid1.DataSource = dt;
                RadGrid1.DataBind();
                if (dt != null)
                {
                    RadGrid1.Items[0].Selected = true;
                    GridDataItem item = RadGrid1.Items[0];
                    Int32 IDNhanVien = Int32.Parse(item["IDNhanVien"].Text);
                    FillCurrentEmployeeDetail(IDNhanVien);
                }
            }
        }

        protected void Grid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "RowClick")
            {
                GridDataItem item = (GridDataItem)e.Item;
                Int32 IDNhanVien = Int32.Parse(item["IDNhanVien"].Text);
                if (IDNhanVien == (Int32)(Session["userID"]) && RadGrid1.Items.Count >= 1)
                {
                    RadContextMenu1.FindItemByValue("xoa").Enabled = false;
                }
                else
                {
                    RadContextMenu1.FindItemByValue("xoa").Enabled = true;
                }
                FillCurrentEmployeeDetail(IDNhanVien);//tu dinh nghia ham dien du lieu vao tab.
                Session["idAcc"] = Int32.Parse(item["IDDangNhap"].Text);
            }
        }

        protected void FillCurrentEmployeeDetail(Int32 IDNhanvien)
        {
            Session["idNV"] = IDNhanvien;
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
        }  

        protected void Grid_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            var dt = _entities.GetAllUser();
            RadGrid1.DataSource = dt;
            if (dt != null)
            {
                RadGrid1.Items[0].Selected = true;
                GridDataItem item = RadGrid1.Items[0];
                Int32 IDNhanVien = Int32.Parse(item["IDNhanVien"].Text);
                FillCurrentEmployeeDetail(IDNhanVien);
            }
        }

        protected void AjaxManager_Request(object sender, AjaxRequestEventArgs e)
        {
            RadTreeNodeEventArgs tne;// = new RadTreeNodeEventArgs(RadTreeView1.SelectedNode);
            switch (e.Argument)
            {
                case "XoaNV":    
                    if (RadGrid1.Items.Count != 1 )
                    {
                        Int32 i = (Int32)Session["idAcc"];
                        var dt = _entities.DangNhaps.Where(x => x.IDDangNhap == i).FirstOrDefault();
                        _entities.DangNhaps.DeleteObject(dt);
                        _entities.SaveChanges();
                        RadGrid1.Rebind();
                    }
                    else
                    {
                        RadContextMenu1.FindItemByValue("xoa").Enabled = false;
                    }
                    break;
                case "RebindGrid":
                    RadGrid1.Rebind();
                    foreach (GridDataItem item in RadGrid1.SelectedItems)
                    {
                        if (item.Cells[0].Text == ((String)Session["idNV"]))
                        {
                            item.Selected = true;
                        }
                    }
                    break;
            }
        }
    }
}
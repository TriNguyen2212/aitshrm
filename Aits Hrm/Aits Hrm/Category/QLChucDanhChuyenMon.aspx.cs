using System;
using System.Collections;
using System.Linq;
using System.Linq;
using Aits_Hrm.Model;
using Telerik.Web.UI;

namespace Aits_Hrm.Category
{
    public partial class QLChucDanhChuyenMon : System.Web.UI.Page
    {
        private QuanLyNhanSuEntities _entities = new QuanLyNhanSuEntities();
        private int idNhanVien;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
            {
                idNhanVien = (int)Session["userID"];
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        protected void grvNhomChucDanh_NeedDataSource(object source, GridNeedDataSourceEventArgs e)
        {
            if (!e.IsFromDetailTable)
            {
                grvNhomChucDanh.DataSource = _entities.GetAllNhomChucDanh();
            }
        }

        protected void grvNhomChucDanh_DetailTableDataBind(object source, GridDetailTableDataBindEventArgs e)
        {
            GridDataItem dataItem = (GridDataItem)e.DetailTableView.ParentItem;
            switch (e.DetailTableView.Name)
            {
                case "tbl_ChucDanhChuyenMon":
                    {
                        int iDNhomChucDanh = Convert.ToInt32(dataItem.GetDataKeyValue("IDNhomChucDanh").ToString());
                        e.DetailTableView.DataSource = _entities.GetAllChucDanh().Where(o => o.IDNhomChucDanh == iDNhomChucDanh);
                        break;
                    }
            }
        }

        protected void grvNhomChucDanh_PreRender(object sender, EventArgs e)
        {
            //if (!Page.IsPostBack)
            //{
            //    grvNhomChucDanh.MasterTableView.Items[0].Expanded = true;
            //    grvNhomChucDanh.MasterTableView.Items[0].ChildItem.NestedTableViews[0].Items[0].Expanded = true;
            //}
        }

        protected void grvNhomChucDanh_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            switch (e.Item.OwnerTableView.Name)
            {
                case "tbl_NhomChucDanh":
                    var iDNhomChucDanh = (e.Item as GridDataItem).GetDataKeyValue("IDNhomChucDanh").ToString();
                    int id = Convert.ToInt32(iDNhomChucDanh);
                    _entities.DeleteChucDanhChuyenMonByIDNhomChucDanh(id);
                    _entities.SaveChanges();
                    break;
                case "tbl_ChucDanhChuyenMon":
                    var iDChucDanhChuyenMon = (e.Item as GridDataItem).GetDataKeyValue("IDChucDanh").ToString();
                    int idcm = Convert.ToInt32(iDChucDanhChuyenMon);
                    ChucDanh chucdanh = _entities.ChucDanhs.Where(d => d.IDChucDanh == idcm).First();
                    _entities.ChucDanhs.DeleteObject(chucdanh);
                    _entities.SaveChanges();
                    break;
            }

        }

        protected void grvNhomChucDanh_InsertCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            Hashtable values = new Hashtable();
            item.ExtractValues(values);
            switch (e.Item.OwnerTableView.Name)
            {
                case "tbl_NhomChucDanh":
                    NhomChucDanh nhomchucdanh = new NhomChucDanh();
                    nhomchucdanh.NgayTao = nhomchucdanh.NgayCapNhat = DateTime.Now;
                    nhomchucdanh.NguoiTao = nhomchucdanh.NguoiCapNhat = idNhanVien;
                    item.UpdateValues(nhomchucdanh);
                    _entities.AddToNhomChucDanhs(nhomchucdanh);
                    _entities.SaveChanges();
                    break;
                case "tbl_ChucDanhChuyenMon":
                    ChucDanh chucdanh = new ChucDanh();
                    item.UpdateValues(chucdanh);
                    GridDataItem parentItem = e.Item.OwnerTableView.ParentItem;
                    if (parentItem != null)
                    {
                        var idNhomChucDanh = parentItem.OwnerTableView.DataKeyValues[parentItem.ItemIndex]["IDNhomChucDanh"].ToString();
                        chucdanh.IDNhomChucDanh = Convert.ToInt32(idNhomChucDanh);
                        chucdanh.NgayTao = chucdanh.NgayCapNhat = DateTime.Now;
                        chucdanh.NguoiTao = chucdanh.NguoiCapNhat = idNhanVien;
                        _entities.AddToChucDanhs(chucdanh);
                        _entities.SaveChanges();
                    }
                    break;
            }

        }

        protected void grvNhomChucDanh_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            switch (e.Item.OwnerTableView.Name)
            {
                case "tbl_NhomChucDanh":
                    var iDNhomChucDanh = Convert.ToInt32(item.GetDataKeyValue("IDNhomChucDanh").ToString());
                    NhomChucDanh nhomchucdanh = _entities.NhomChucDanhs.Where(d => d.IDNhomChucDanh == iDNhomChucDanh).First();
                    nhomchucdanh.NgayCapNhat = DateTime.Now;
                    nhomchucdanh.NguoiCapNhat = idNhanVien;
                    item.UpdateValues(nhomchucdanh);
                    _entities.SaveChanges();
                    break;
                case "tbl_ChucDanhChuyenMon":
                    var iDChucDanhChuyenMon = Convert.ToInt32(item.GetDataKeyValue("IDChucDanh").ToString());
                    ChucDanh chucdanh = _entities.ChucDanhs.Where(d => d.IDChucDanh == iDChucDanhChuyenMon).First();
                    chucdanh.NgayCapNhat = DateTime.Now;
                    chucdanh.NguoiCapNhat = idNhanVien;
                    item.UpdateValues(chucdanh);
                    _entities.SaveChanges();
                    break;
            }

        }

        protected void grvNhomChucDanh_Unload(object sender, EventArgs e)
        {
            if (_entities != null)
                _entities.Dispose();
        }
    }
}
using System;
using System.Collections;
using System.Linq;
using System.Linq;
using Aits_Hrm.Model;
using Telerik.Web.UI;

namespace Aits_Hrm.Category
{
    public partial class QLBacNgach1 : System.Web.UI.Page
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

        protected void grvNgach_NeedDataSource(object source, GridNeedDataSourceEventArgs e)
        {
            if (!e.IsFromDetailTable)
            {
                grvNgach.DataSource = _entities.GetAllNgach();
            }
        }

        protected void grvNgach_DetailTableDataBind(object source, GridDetailTableDataBindEventArgs e)
        {
            GridDataItem dataItem = (GridDataItem)e.DetailTableView.ParentItem;
            switch (e.DetailTableView.Name)
            {
                case "tbl_BacNgach":
                    {
                        int iDNgach = Convert.ToInt32(dataItem.GetDataKeyValue("IDNgach").ToString());
                        e.DetailTableView.DataSource = _entities.GetAllBacNgach().Where(o => o.IDNgach == iDNgach);
                        break;
                    }
            }
        }

        protected void grvNgach_PreRender(object sender, EventArgs e)
        {
            //if (!Page.IsPostBack)
            //{
            //    grvNgach.MasterTableView.Items[0].Expanded = true;
            //    grvNgach.MasterTableView.Items[0].ChildItem.NestedTableViews[0].Items[0].Expanded = true;
            //}
        }

        protected void grvNgach_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            switch (e.Item.OwnerTableView.Name)
            {
                case "tbl_Ngach":
                    var iDNgach = (e.Item as GridDataItem).GetDataKeyValue("IDNgach").ToString();
                    int idn = Convert.ToInt32(iDNgach);
                    _entities.DeleteBacNgachByIDNgach(idn);
                    _entities.SaveChanges();
                    break;
                case "tbl_BacNgach":
                    var iDBacNgach = (e.Item as GridDataItem).GetDataKeyValue("IDBacNgach").ToString();
                    int idbn = Convert.ToInt32(iDBacNgach);
                    BacNgach bacngach = _entities.BacNgaches.Where(d => d.IDBacNgach == idbn).First();
                    _entities.BacNgaches.DeleteObject(bacngach);
                    _entities.SaveChanges();
                    break;
            }

        }

        protected void grvNgach_InsertCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            Hashtable values = new Hashtable();
            item.ExtractValues(values);
            switch (e.Item.OwnerTableView.Name)
            {
                case "tbl_Ngach":
                    Ngach ngach = new Ngach();
                    ngach.NgayTao = ngach.NgayCapNhat = DateTime.Now;
                    ngach.NguoiTao = ngach.NguoiCapNhat = idNhanVien;
                    item.UpdateValues(ngach);
                    _entities.AddToNgaches(ngach);
                    _entities.SaveChanges();
                    break;
                case "tbl_BacNgach":
                    BacNgach bacngach = new BacNgach();
                    item.UpdateValues(bacngach);
                    GridDataItem parentItem = e.Item.OwnerTableView.ParentItem;
                    if (parentItem != null)
                    {
                        var idNgach = parentItem.OwnerTableView.DataKeyValues[parentItem.ItemIndex]["IDNgach"].ToString();
                        bacngach.IDNgach = Convert.ToInt32(idNgach);
                        bacngach.NgayTao = bacngach.NgayCapNhat = DateTime.Now;
                        bacngach.NguoiTao = bacngach.NguoiCapNhat = idNhanVien;
                        _entities.AddToBacNgaches(bacngach);
                        _entities.SaveChanges();
                    }
                    break;
            }

        }

        protected void grvNgach_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            switch (e.Item.OwnerTableView.Name)
            {
                case "tbl_Ngach":
                    var iDNgach = Convert.ToInt32(item.GetDataKeyValue("IDNgach").ToString());
                    Ngach ngach = _entities.Ngaches.Where(d => d.IDNgach == iDNgach).First();
                    ngach.NgayCapNhat = DateTime.Now;
                    ngach.NguoiCapNhat = idNhanVien;
                    item.UpdateValues(ngach);
                    _entities.SaveChanges();
                    break;
                case "tbl_BacNgach":
                    var iDBacNgach = Convert.ToInt32(item.GetDataKeyValue("IDBacNgach").ToString());
                    BacNgach bacngach = _entities.BacNgaches.Where(d => d.IDBacNgach == iDBacNgach).First();
                    bacngach.NgayCapNhat = DateTime.Now;
                    bacngach.NguoiCapNhat = idNhanVien;
                    item.UpdateValues(bacngach);
                    _entities.SaveChanges();
                    break;
            }

        }

        protected void grvNgach_Unload(object sender, EventArgs e)
        {
            if (_entities != null)
                _entities.Dispose();
        }
    }
}
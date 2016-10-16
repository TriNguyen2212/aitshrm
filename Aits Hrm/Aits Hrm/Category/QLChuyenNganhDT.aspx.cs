using System;
using System.Collections;
using System.Linq;
using System.Linq;
using Aits_Hrm.Model;
using Telerik.Web.UI;

namespace Aits_Hrm.Category
{
    public partial class QLChuyenNganhDT : System.Web.UI.Page
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

        #region Radgrid for Chuyen Nganh Dao Tao
        protected void grvChuyenNganhDT_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            grvChuyenNganhDT.DataSource = _entities.GetAllChuyenNganhDT();
        }

        protected void grvChuyenNganhDT_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            var iD = (e.Item as GridDataItem).GetDataKeyValue("IDChuyenNganh").ToString();
            int id = Convert.ToInt32(iD);
            ChuyenNganhDT obj = _entities.ChuyenNganhDTs.Where(o=>o.IDChuyenNganh == id).First();
            _entities.ChuyenNganhDTs.DeleteObject(obj);
            _entities.SaveChanges();
        }

        protected void grvChuyenNganhDT_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            var id = Convert.ToInt32(item.GetDataKeyValue("IDChuyenNganh").ToString());
            ChuyenNganhDT obj = _entities.ChuyenNganhDTs.Where(o => o.IDChuyenNganh == id).First();
            obj.NgayCapNhat = DateTime.Now;
            obj.NguoiCapNhat = idNhanVien;
            item.UpdateValues(obj);
            _entities.SaveChanges();
        }

        protected void grvChuyenNganhDT_InsertCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            Hashtable values = new Hashtable();
            item.ExtractValues(values);
            ChuyenNganhDT obj = new ChuyenNganhDT();
            obj.NgayTao = obj.NgayCapNhat = DateTime.Now;
            obj.NguoiTao = obj.NguoiCapNhat = idNhanVien;
            item.UpdateValues(obj);
            _entities.AddToChuyenNganhDTs(obj);
            _entities.SaveChanges();
        }

        protected void grvChuyenNganhDT_Unload(object sender, EventArgs e)
        {
            if (_entities != null)
                _entities.Dispose();
        }
        #endregion
    }
}
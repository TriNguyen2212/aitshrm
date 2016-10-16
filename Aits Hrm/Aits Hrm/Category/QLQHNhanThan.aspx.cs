using System;
using System.Collections;
using System.Linq;
using System.Linq;
using Aits_Hrm.Model;
using Telerik.Web.UI;

namespace Aits_Hrm.Category
{
    public partial class QLQHNhanThan : System.Web.UI.Page
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

        #region Radgrid for Quan He Nhan Than
        protected void grvQHNhanThan_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            grvQHNhanThan.DataSource = _entities.GetAllQuanHe();
        }

        protected void grvQHNhanThan_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            var iDQuanHe = (e.Item as GridDataItem).GetDataKeyValue("IDQuanHe").ToString();
            int id = Convert.ToInt32(iDQuanHe);
            QuanHe tt = _entities.QuanHes.Where(d => d.IDQuanHe == id).First();
            _entities.QuanHes.DeleteObject(tt);
            _entities.SaveChanges();
        }

        protected void grvQHNhanThan_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            int id = Convert.ToInt32(item.GetDataKeyValue("IDQuanHe").ToString());
            QuanHe tt = _entities.QuanHes.Where(d => d.IDQuanHe == id).First();
            tt.NgayCapNhat = DateTime.Now;
            tt.NguoiCapNhat = idNhanVien;
            item.UpdateValues(tt);
            _entities.SaveChanges();
        }

        protected void grvQHNhanThan_InsertCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            Hashtable values = new Hashtable();
            item.ExtractValues(values);
            QuanHe tt = new QuanHe();
            tt.NgayTao = tt.NgayCapNhat = DateTime.Now;
            tt.NguoiTao = tt.NguoiCapNhat = idNhanVien;
            item.UpdateValues(tt);
            _entities.AddToQuanHes(tt);
            _entities.SaveChanges();
        }

        protected void grvQHNhanThan_Unload(object sender, EventArgs e)
        {
            if (_entities != null)
                _entities.Dispose();
        }
        #endregion
    }
}
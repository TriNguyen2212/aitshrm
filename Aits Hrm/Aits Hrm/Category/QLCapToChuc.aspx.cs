using System;
using System.Collections;
using System.Linq;
using System.Linq;
using Aits_Hrm.Model;
using Telerik.Web.UI;

namespace Aits_Hrm.Category
{
    public partial class QLCapToChuc : System.Web.UI.Page
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

        #region Radgrid for Cap To Chuc
        protected void grvCapToChuc_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            grvCapToChuc.DataSource = _entities.GetAllCapToChuc();
        }

        protected void grvCapToChuc_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            var iD = (e.Item as GridDataItem).GetDataKeyValue("IDCapToChuc").ToString();
            int id = Convert.ToInt32(iD);
            CapToChuc obj = _entities.CapToChucs.Where(o => o.IDCapToChuc == id).First();
            _entities.CapToChucs.DeleteObject(obj);
            _entities.SaveChanges();
        }

        protected void grvCapToChuc_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            var iD = Convert.ToInt32(item.GetDataKeyValue("IDCapToChuc").ToString());
            CapToChuc obj = _entities.CapToChucs.Where(o => o.IDCapToChuc == iD).First();
            obj.NgayCapNhat = DateTime.Now;
            obj.NguoiCapNhat = idNhanVien;
            item.UpdateValues(obj);
            _entities.SaveChanges();
        }

        protected void grvCapToChuc_InsertCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            Hashtable values = new Hashtable();
            item.ExtractValues(values);
            CapToChuc obj = new CapToChuc();
            obj.NgayTao = obj.NgayCapNhat = DateTime.Now;
            obj.NguoiTao = obj.NguoiCapNhat = idNhanVien;
            item.UpdateValues(obj);
            _entities.AddToCapToChucs(obj);
            _entities.SaveChanges();
        }

        protected void grvCapToChuc_Unload(object sender, EventArgs e)
        {
            if (_entities != null)
                _entities.Dispose();
        }
        #endregion
    }
}
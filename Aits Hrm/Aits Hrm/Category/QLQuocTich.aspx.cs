using System;
using System.Collections;
using System.Linq;
using System.Linq;
using Aits_Hrm.Model;
using Telerik.Web.UI;

namespace Aits_Hrm.Category
{
    public partial class QLQuocTich : System.Web.UI.Page
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

        #region Radgrid for QuocTich
        protected void grvQuocTich_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            grvQuocTich.DataSource = _entities.GetAllQuocTich();
        }

        protected void grvQuocTich_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            var iDQuocTich = (e.Item as GridDataItem).GetDataKeyValue("IDQuocTich").ToString();
            int id = Convert.ToInt32(iDQuocTich);
            QuocTich qt = _entities.QuocTiches.Where(q => q.IDQuocTich == id).First();
            _entities.QuocTiches.DeleteObject(qt);
            _entities.SaveChanges();
        }

        protected void grvQuocTich_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            var iDQuocTich = Convert.ToInt32(item.GetDataKeyValue("IDQuocTich").ToString());
            QuocTich qt = _entities.QuocTiches.Where(q => q.IDQuocTich == iDQuocTich).First();
            qt.NgayCapNhat = DateTime.Now;
            qt.NguoiCapNhat = idNhanVien;
            item.UpdateValues(qt);
            _entities.SaveChanges();
        }

        protected void grvQuocTich_InsertCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            Hashtable values = new Hashtable();
            item.ExtractValues(values);
            QuocTich qt = new QuocTich();
            qt.NgayTao = qt.NgayCapNhat = DateTime.Now;
            qt.NguoiTao = qt.NguoiCapNhat = idNhanVien;
            item.UpdateValues(qt);
            _entities.AddToQuocTiches(qt);
            _entities.SaveChanges();
        }

        protected void grvQuocTich_Unload(object sender, EventArgs e)
        {
            if (_entities != null)
                _entities.Dispose();
        }
        #endregion
    }
}
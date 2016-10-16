using System;
using System.Collections;
using System.Linq;
using Aits_Hrm.Model;
using Telerik.Web.UI;

namespace Aits_Hrm.Category
{
    public partial class QLDanToc : System.Web.UI.Page
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

        #region Radgrid for DanToc
        protected void grvDanTocs_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            grvDanTocs.DataSource = _entities.GetAllDanToc();
        }

        protected void grvDanTocs_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            var iDDanToc = (e.Item as GridDataItem).GetDataKeyValue("IDDanToc").ToString();
            int id = Convert.ToInt32(iDDanToc);
            DanToc dt = _entities.DanTocs.Where(d => d.IDDanToc == id).FirstOrDefault();
            _entities.DanTocs.DeleteObject(dt);
            _entities.SaveChanges();
        }

        protected void grvDanTocs_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            var iDDanToc = Convert.ToInt32(item.GetDataKeyValue("IDDanToc").ToString());
            DanToc dt = _entities.DanTocs.Where(d => d.IDDanToc == iDDanToc).First();
            dt.NguoiCapNhat = idNhanVien;
            dt.NgayCapNhat = DateTime.Now;
            item.UpdateValues(dt);
            _entities.SaveChanges();
        }

        protected void grvDanTocs_InsertCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            Hashtable values = new Hashtable();
            item.ExtractValues(values);
            DanToc dt = new DanToc();
            dt.NguoiTao = dt.NguoiCapNhat = idNhanVien;
            dt.NgayTao = dt.NgayCapNhat = DateTime.Now;
            item.UpdateValues(dt);
            _entities.AddToDanTocs(dt);
            _entities.SaveChanges();
        }

        protected void grvDanTocs_Unload(object sender, EventArgs e)
        {
            if (_entities != null)
                _entities.Dispose();
        }
        #endregion
    }
}
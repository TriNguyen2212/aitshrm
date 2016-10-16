using System;
using System.Collections;
using System.Linq;
using System.Linq;
using Aits_Hrm.Model;
using Telerik.Web.UI;

namespace Aits_Hrm.Category
{
    public partial class QLLoaiNghi : System.Web.UI.Page
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

        #region Radgrid for Loai Nghi
        protected void grvLoaiNghi_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            grvLoaiNghi.DataSource = _entities.GetAllLoaiNghi();
        }

        protected void grvLoaiNghi_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            var iD = (e.Item as GridDataItem).GetDataKeyValue("IDLoaiNghi").ToString();
            int id = Convert.ToInt32(iD);
            LoaiNghi ln = _entities.LoaiNghis.Where(l => l.IDLoaiNghi == id).First();
            _entities.LoaiNghis.DeleteObject(ln);
            _entities.SaveChanges();
        }

        protected void grvLoaiNghi_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            var iD = Convert.ToInt32(item.GetDataKeyValue("IDLoaiNghi").ToString());
            LoaiNghi ln = _entities.LoaiNghis.Where(l => l.IDLoaiNghi == iD).First();
            ln.NgayCapNhat = DateTime.Now;
            ln.NguoiCapNhat = idNhanVien;
            item.UpdateValues(ln);
            _entities.SaveChanges();
        }

        protected void grvLoaiNghi_InsertCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            Hashtable values = new Hashtable();
            item.ExtractValues(values);
            LoaiNghi ln = new LoaiNghi();
            ln.NgayTao = ln.NgayCapNhat = DateTime.Now;
            ln.NguoiTao = ln.NguoiCapNhat = idNhanVien;
            item.UpdateValues(ln);
            _entities.AddToLoaiNghis(ln);
            _entities.SaveChanges();
        }

        protected void grvLoaiNghi_Unload(object sender, EventArgs e)
        {
            if (_entities != null)
                _entities.Dispose();
        }
        #endregion
    }
}
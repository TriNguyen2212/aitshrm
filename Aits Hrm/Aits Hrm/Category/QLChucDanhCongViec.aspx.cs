using System;
using System.Collections;
using System.Linq;
using System.Linq;
using Aits_Hrm.Model;
using Telerik.Web.UI;

namespace Aits_Hrm.Category
{
    public partial class QLChucDanhCongViec : System.Web.UI.Page
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

        #region Radgrid for Chuc Danh Cong Viec
        protected void grvChucDanhCongViec_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            grvChucDanhCongViec.DataSource = _entities.GetAllChucDanhCongViec();
        }

        protected void grvChucDanhCongViec_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            var iD = (e.Item as GridDataItem).GetDataKeyValue("IDChucDanhCongViec").ToString();
            int id = Convert.ToInt32(iD);
            ChucDanhCongViec obj = _entities.ChucDanhCongViecs.Where(o => o.IDChucDanhCongViec == id).First();
            _entities.ChucDanhCongViecs.DeleteObject(obj);
            _entities.SaveChanges();
        }

        protected void grvChucDanhCongViec_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            var iD = Convert.ToInt32(item.GetDataKeyValue("IDChucDanhCongViec").ToString());
            ChucDanhCongViec obj = _entities.ChucDanhCongViecs.Where(o => o.IDChucDanhCongViec == iD).First();
            obj.NgayCapNhat = DateTime.Now;
            obj.NguoiCapNhat = idNhanVien;
            item.UpdateValues(obj);
            _entities.SaveChanges();
        }

        protected void grvChucDanhCongViec_InsertCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            Hashtable values = new Hashtable();
            item.ExtractValues(values);
            ChucDanhCongViec obj = new ChucDanhCongViec();
            obj.NgayTao = obj.NgayCapNhat = DateTime.Now;
            obj.NguoiTao = obj.NguoiCapNhat = idNhanVien;
            item.UpdateValues(obj);
            _entities.AddToChucDanhCongViecs(obj);
            _entities.SaveChanges();
        }

        protected void grvChucDanhCongViec_Unload(object sender, EventArgs e)
        {
            if (_entities != null)
                _entities.Dispose();
        }
        #endregion
    }
}
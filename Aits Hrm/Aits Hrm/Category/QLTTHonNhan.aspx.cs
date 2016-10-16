using System;
using System.Collections;
using System.Linq;
using System.Linq;
using Aits_Hrm.Model;
using Telerik.Web.UI;

namespace Aits_Hrm.Category
{
    public partial class QLTTHonNhan : System.Web.UI.Page
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

        #region Radgrid for Tinh Trang Hon Nhan
        protected void grvTTHonNhan_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            grvTTHonNhan.DataSource = _entities.GetAllTinhTrangHonNhan();
        }

        protected void grvTTHonNhan_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            var iDTTHonNhan = (e.Item as GridDataItem).GetDataKeyValue("IDTinhTrangHonNhan").ToString();
            int id = Convert.ToInt32(iDTTHonNhan);
            TinhTrangHonNhan tt = _entities.TinhTrangHonNhans.Where(d => d.IDTinhTrangHonNhan == id).First();
            _entities.TinhTrangHonNhans.DeleteObject(tt);
            _entities.SaveChanges();
        }

        protected void grvTTHonNhan_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            int id = Convert.ToInt32(item.GetDataKeyValue("IDTinhTrangHonNhan").ToString());
            TinhTrangHonNhan tt = _entities.TinhTrangHonNhans.Where(d => d.IDTinhTrangHonNhan == id).First();
            tt.NgayCapNhat = DateTime.Now;
            tt.NguoiCapNhat = idNhanVien;
            item.UpdateValues(tt);
            _entities.SaveChanges();
        }

        protected void grvTTHonNhan_InsertCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            Hashtable values = new Hashtable();
            item.ExtractValues(values);
            TinhTrangHonNhan tt = new TinhTrangHonNhan();
            tt.NgayTao = tt.NgayCapNhat = DateTime.Now;
            tt.NguoiTao = tt.NguoiCapNhat = idNhanVien;
            item.UpdateValues(tt);
            _entities.AddToTinhTrangHonNhans(tt);
            _entities.SaveChanges();
        }

        protected void grvTTHonNhan_Unload(object sender, EventArgs e)
        {
            if (_entities != null)
                _entities.Dispose();
        }
        #endregion
    }
}
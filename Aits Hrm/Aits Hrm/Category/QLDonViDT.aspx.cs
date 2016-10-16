using System;
using System.Collections;
using System.Linq;
using System.Linq;
using Aits_Hrm.Model;
using Telerik.Web.UI;

namespace Aits_Hrm.Category
{
    public partial class QLDonViDT : System.Web.UI.Page
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
        protected void grvDonViDT_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            grvDonViDT.DataSource = _entities.GetAllNoiCapBang();
        }

        protected void grvDonViDT_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            var iD = (e.Item as GridDataItem).GetDataKeyValue("IDNoiCapBang").ToString();
            int id = Convert.ToInt32(iD);
            NoiCapBang obj = _entities.NoiCapBangs.Where(o => o.IDNoiCapBang == id).First();
            _entities.NoiCapBangs.DeleteObject(obj);
            _entities.SaveChanges();
        }

        protected void grvDonViDT_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            var id = Convert.ToInt32(item.GetDataKeyValue("IDNoiCapBang").ToString());
            NoiCapBang obj = _entities.NoiCapBangs.Where(o => o.IDNoiCapBang == id).First();
            obj.NgayCapNhat = DateTime.Now;
            obj.NguoiCapNhat = idNhanVien;
            item.UpdateValues(obj);
            _entities.SaveChanges();
        }

        protected void grvDonViDT_InsertCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            Hashtable values = new Hashtable();
            item.ExtractValues(values);
            NoiCapBang obj = new NoiCapBang();
            obj.NgayTao = obj.NgayCapNhat = DateTime.Now;
            obj.NguoiTao = obj.NguoiCapNhat = idNhanVien;
            item.UpdateValues(obj);
            _entities.AddToNoiCapBangs(obj);
            _entities.SaveChanges();
        }

        protected void grvDonViDT_Unload(object sender, EventArgs e)
        {
            if (_entities != null)
                _entities.Dispose();
        }
        #endregion
    }
}
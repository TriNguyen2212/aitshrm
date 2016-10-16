using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Aits_Hrm.Model;
using Telerik.Web.UI;
using System.Collections;

namespace Aits_Hrm.Category
{
    public partial class QLChungChi : System.Web.UI.Page
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

        #region Radgrid for Chung Chi
        protected void grvChungChi_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            grvChungChi.DataSource = _entities.GetAllChungChi();
        }

        protected void grvChungChi_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            var iD = (e.Item as GridDataItem).GetDataKeyValue("IDChungChi").ToString();
            int id = Convert.ToInt32(iD);
            ChungChi obj = _entities.ChungChis.Where(o => o.IDChungChi == id).First();
            _entities.ChungChis.DeleteObject(obj);
            _entities.SaveChanges();
        }

        protected void grvChungChi_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            int id = Convert.ToInt32(item.GetDataKeyValue("IDChungChi").ToString());
            ChungChi obj = _entities.ChungChis.Where(o => o.IDChungChi == id).First();
            obj.NgayCapNhat = DateTime.Now;
            obj.NguoiCapNhat = idNhanVien;
            item.UpdateValues(obj);
            _entities.SaveChanges();
        }

        protected void grvChungChi_InsertCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            Hashtable values = new Hashtable();
            item.ExtractValues(values);
            ChungChi obj = new ChungChi();
            obj.NgayTao = obj.NgayCapNhat = DateTime.Now;
            obj.NguoiTao = obj.NguoiCapNhat = idNhanVien;
            item.UpdateValues(obj);
            _entities.AddToChungChis(obj);
            _entities.SaveChanges();
        }

        protected void grvChungChi_Unload(object sender, EventArgs e)
        {
            if (_entities != null)
                _entities.Dispose();
        }
        #endregion
    }
}
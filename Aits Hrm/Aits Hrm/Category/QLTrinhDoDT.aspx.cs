using System;
using System.Collections;
using System.Linq;
using System.Linq;
using Aits_Hrm.Model;
using Telerik.Web.UI;

namespace Aits_Hrm.Category
{
    public partial class QLTrinhDoDT : System.Web.UI.Page
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

        #region Radgrid for Trinh Do Dao Tao
        protected void grvTrinhDoDT_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            grvTrinhDoDT.DataSource = _entities.GetAllTrinhDoDT();
        }

        protected void grvTrinhDoDT_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            var iD = (e.Item as GridDataItem).GetDataKeyValue("IDTrinhDo").ToString();
            int id = Convert.ToInt32(iD);
            TrinhDoDT obj = _entities.TrinhDoDTs.Where(o => o.IDTrinhDo == id).First();
            _entities.TrinhDoDTs.DeleteObject(obj);
            _entities.SaveChanges();
        }

        protected void grvTrinhDoDT_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            int id = Convert.ToInt32(item.GetDataKeyValue("IDTrinhDo").ToString());
            TrinhDoDT obj = _entities.TrinhDoDTs.Where(o => o.IDTrinhDo == id).First();
            obj.NgayCapNhat = DateTime.Now;
            obj.NguoiCapNhat = idNhanVien;
            item.UpdateValues(obj);
            _entities.SaveChanges();
        }

        protected void grvTrinhDoDT_InsertCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            Hashtable values = new Hashtable();
            item.ExtractValues(values);
            TrinhDoDT obj = new TrinhDoDT();
            obj.NgayTao = obj.NgayCapNhat = DateTime.Now;
            obj.NguoiTao = obj.NguoiCapNhat = idNhanVien;
            item.UpdateValues(obj);
            _entities.AddToTrinhDoDTs(obj);
            _entities.SaveChanges();
        }

        protected void grvTrinhDoDT_Unload(object sender, EventArgs e)
        {
            if (_entities != null)
                _entities.Dispose();
        }
        #endregion
    }
}
using System;
using System.Collections;
using System.Linq;
using System.Linq;
using Aits_Hrm.Model;
using Telerik.Web.UI;

namespace Aits_Hrm.Category
{
    public partial class QLLoaiBangDT : System.Web.UI.Page
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

        #region Radgrid for Loai Bang Dao Tao
        protected void grvLoaiBangDT_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            grvLoaiBangDT.DataSource = _entities.GetAllLoaiBangDT();
        }

        protected void grvLoaiBangDT_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            var iD = (e.Item as GridDataItem).GetDataKeyValue("IDLoaiBangDT").ToString();
            int id = Convert.ToInt32(iD);
            LoaiBangDT obj = _entities.LoaiBangDTs.Where(o => o.IDLoaiBangDT == id).First();
            _entities.LoaiBangDTs.DeleteObject(obj);
            _entities.SaveChanges();
        }

        protected void grvLoaiBangDT_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            var id = Convert.ToInt32(item.GetDataKeyValue("IDLoaiBangDT").ToString());
            LoaiBangDT obj = _entities.LoaiBangDTs.Where(o => o.IDLoaiBangDT == id).First();
            obj.NgayCapNhat = DateTime.Now;
            obj.NguoiCapNhat = idNhanVien;
            item.UpdateValues(obj);
            _entities.SaveChanges();
        }

        protected void grvLoaiBangDT_InsertCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            Hashtable values = new Hashtable();
            item.ExtractValues(values);
            LoaiBangDT obj = new LoaiBangDT();
            obj.NgayTao = obj.NgayCapNhat = DateTime.Now;
            obj.NguoiTao = obj.NguoiCapNhat = idNhanVien;
            item.UpdateValues(obj);
            _entities.AddToLoaiBangDTs(obj);
            _entities.SaveChanges();
        }

        protected void grvLoaiBangDT_Unload(object sender, EventArgs e)
        {
            if (_entities != null)
                _entities.Dispose();
        }
        #endregion
    }
}
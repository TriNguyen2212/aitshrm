using System;
using System.Collections;
using System.Linq;
using System.Linq;
using Aits_Hrm.Model;
using Telerik.Web.UI;

namespace Aits_Hrm.Category
{
    public partial class QLLoaiHinhDT : System.Web.UI.Page
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

        #region Radgrid for Loai Hinh Dao Tao
        protected void grvLoaiHinhDT_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            grvLoaiHinhDT.DataSource = _entities.GetAllLoaiHinhDT();
        }

        protected void grvLoaiHinhDT_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            var iDLoaiHinh = (e.Item as GridDataItem).GetDataKeyValue("IDLoaiHinh").ToString();
            int id = Convert.ToInt32(iDLoaiHinh);
            LoaiHinhDT lh = _entities.LoaiHinhDTs.Where(l => l.IDLoaiHinh == id).First();
            _entities.LoaiHinhDTs.DeleteObject(lh);
            _entities.SaveChanges();
        }

        protected void grvLoaiHinhDT_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            var iDLoaiHinh = item.GetDataKeyValue("IDLoaiHinh").ToString();
            int id = Convert.ToInt32(iDLoaiHinh);
            LoaiHinhDT lh = _entities.LoaiHinhDTs.Where(l => l.IDLoaiHinh == id).First();
            lh.NgayCapNhat = DateTime.Now;
            lh.NguoiCapNhat = idNhanVien;
            item.UpdateValues(lh);
            _entities.SaveChanges();
        }

        protected void grvLoaiHinhDT_InsertCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            Hashtable values = new Hashtable();
            item.ExtractValues(values);
            LoaiHinhDT lh = new LoaiHinhDT();
            lh.NgayTao = lh.NgayCapNhat = DateTime.Now;
            lh.NguoiTao = lh.NguoiCapNhat = idNhanVien;
            item.UpdateValues(lh);
            _entities.AddToLoaiHinhDTs(lh);
            _entities.SaveChanges();
        }

        protected void grvLoaiHinhDT_Unload(object sender, EventArgs e)
        {
            if (_entities != null)
                _entities.Dispose();
        }
        #endregion
    }
}
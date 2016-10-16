using System;
using System.Collections;
using System.Linq;
using System.Linq;
using Aits_Hrm.Model;
using Telerik.Web.UI;

namespace Aits_Hrm
{
    public partial class QLLoaiHopDong : System.Web.UI.Page
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

        #region Radgrid for Loai Hop Dong
        protected void grvLoaiHD_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            grvLoaiHD.DataSource = _entities.GetAllLoaiHopDong();
        }

        protected void grvLoaiHD_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            var iD = (e.Item as GridDataItem).GetDataKeyValue("IDLoaiHopDong").ToString();
            int id = Convert.ToInt32(iD);
            LoaiHopDong obj = _entities.LoaiHopDongs.Where(o => o.IDLoaiHopDong == id).First();
            _entities.LoaiHopDongs.DeleteObject(obj);
            _entities.SaveChanges();
        }

        protected void grvLoaiHD_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            var id = Convert.ToInt32(item.GetDataKeyValue("IDLoaiHopDong").ToString());
            LoaiHopDong obj = _entities.LoaiHopDongs.Where(o => o.IDLoaiHopDong == id).First();
            obj.NgayCapNhat = DateTime.Now;
            obj.NguoiCapNhat = idNhanVien;
            item.UpdateValues(obj);
            _entities.SaveChanges();
        }

        protected void grvLoaiHD_InsertCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            Hashtable values = new Hashtable();
            item.ExtractValues(values);
            LoaiHopDong obj = new LoaiHopDong();
            obj.NgayTao = obj.NgayCapNhat = DateTime.Now;
            obj.NguoiTao = obj.NguoiCapNhat = idNhanVien;
            item.UpdateValues(obj);
            _entities.AddToLoaiHopDongs(obj);
            _entities.SaveChanges();
        }

        protected void grvLoaiHD_Unload(object sender, EventArgs e)
        {
            if (_entities != null)
                _entities.Dispose();
        }
        #endregion
    }
}
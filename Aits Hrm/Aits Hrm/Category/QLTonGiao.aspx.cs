using System;
using System.Collections;
using System.Linq;
using Telerik.Web.UI;
using Aits_Hrm.Model;
namespace Aits_Hrm.Category
{
    public partial class QLTonGiao : System.Web.UI.Page
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

        #region Radgrid for TonGiao
        protected void grvTonGiao_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            grvTonGiao.DataSource = _entities.GetAllTonGiao();
        }

        protected void grvTonGiao_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            var iDTonGiao = (e.Item as GridDataItem).GetDataKeyValue("IDTonGiao").ToString();
            int id = Convert.ToInt32(iDTonGiao);
            TonGiao tg = _entities.TonGiaos.Where(t => t.IDTonGiao == id).First();
            _entities.TonGiaos.DeleteObject(tg);
            _entities.SaveChanges();
        }

        protected void grvTonGiao_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            var iDTonGiao = Convert.ToInt32(item.GetDataKeyValue("IDTonGiao").ToString());
            TonGiao tg = _entities.TonGiaos.Where(t => t.IDTonGiao == iDTonGiao).First();
            tg.NgayCapNhat = DateTime.Now;
            tg.NguoiCapNhat = idNhanVien;
            item.UpdateValues(tg);
            _entities.SaveChanges();
        }

        protected void grvTonGiao_InsertCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem item = e.Item as GridEditableItem;
            Hashtable values = new Hashtable();
            item.ExtractValues(values);
            TonGiao tg = new TonGiao();
            tg.NgayTao = tg.NgayCapNhat = DateTime.Now;
            tg.NguoiTao = tg.NguoiCapNhat = idNhanVien;
            item.UpdateValues(tg);
            _entities.AddToTonGiaos(tg);
            _entities.SaveChanges();
        }

        protected void grvTonGiao_Unload(object sender, EventArgs e)
        {
            if (_entities != null)
                _entities.Dispose();
        }
        #endregion
    }
}
using System;
using System.Collections;
using System.Linq;
using Aits_Hrm.Model;
using Telerik.Web.UI;
using Aits_Hrm.CommonMethod;
using System.Web.UI.WebControls;

namespace Aits_Hrm.Category
{
    public partial class QLCoCauToChuc : System.Web.UI.Page
    {
        QuanLyNhanSuEntities _entities = new QuanLyNhanSuEntities();
        private int idUser;
        Methods cm = new Methods();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
            {
                idUser = (int)Session["userID"];
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        protected void RadTreeList1_NeedDataSource(object sender, TreeListNeedDataSourceEventArgs e)
        {
            RadTreeList1.DataSource = _entities.GetCoCauToChuc();
        }

        protected void RadTreeList1_InsertCommand(object sender, TreeListCommandEventArgs e)
        {
            Hashtable table = new Hashtable();
            TreeListEditableItem item = e.Item as TreeListEditableItem;
            item.ExtractValues(table);
            CoCauToChuc obj = new CoCauToChuc();
            RadComboBox cbocaptochuc = (RadComboBox)item.FindControl("cboCapToChuc");
            obj.IDCapToChuc = Convert.ToInt32(cbocaptochuc.SelectedValue);
            obj.NgayTao = obj.NgayCapNhat = DateTime.Now;
            obj.NguoiTao = obj.NguoiCapNhat = idUser;
            item.UpdateValues(obj);
            _entities.AddToCoCauToChucs(obj);
            _entities.SaveChanges();
        }

        protected void RadTreeList1_UpdateCommand(object sender, TreeListCommandEventArgs e)
        {
            Hashtable table = new Hashtable();
            TreeListEditableItem item = e.Item as TreeListEditableItem;
            item.ExtractValues(table);
            TreeListEditFormItem editedItem = (e.Item as TreeListEditFormItem);
            string dataKeyValue = editedItem.ParentItem.GetDataKeyValue("IDCoCauToChuc").ToString();
            int iD = Convert.ToInt32(dataKeyValue);
            CoCauToChuc obj = _entities.CoCauToChucs.Where(o => o.IDCoCauToChuc == iD).FirstOrDefault();
            RadComboBox cbocaptochuc = (RadComboBox)item.FindControl("cboCapToChuc");
            obj.IDCapToChuc = Convert.ToInt32(cbocaptochuc.SelectedValue);
            obj.NgayCapNhat = DateTime.Now;
            obj.NguoiCapNhat = idUser;
            item.UpdateValues(obj);
            _entities.SaveChanges();
        }

        protected void RadTreeList1_DeleteCommand(object sender, TreeListCommandEventArgs e)
        {
            TreeListDataItem item = e.Item as TreeListDataItem;
            if (item.CanExpand)
            {
                RadAjaxPanel1.Alert("Cần xóa hết các đơn vị con trong đơn vị này trước");
                e.Canceled = true;
                return;
            }
            var iD = Convert.ToInt32(item.GetDataKeyValue("IDCoCauToChuc"));
            CoCauToChuc obj = _entities.CoCauToChucs.Where(o => o.IDCoCauToChuc == iD).First();
            _entities.CoCauToChucs.DeleteObject(obj);
            _entities.SaveChanges();
        }
    }
}
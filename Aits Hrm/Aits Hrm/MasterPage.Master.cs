using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Aits_Hrm.CommonMethod;
using Aits_Hrm.Model;
using System.Collections;
using Aits_Hrm.QuanTri;

namespace Aits_Hrm
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        private QuanLyNhanSuEntities _entities = new QuanLyNhanSuEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckPermis();
            if (!IsPostBack)
            {
                RadMenuItem currentItem = RadMenu1.FindItemByUrl(Request.Url.PathAndQuery);
                if (currentItem != null)
                {
                    //Select the current item and his parents
                    // currentItem.HighlightPath();
                    //Update the title of the 
                    //PageTitleLiteral.Text = currentItem.Text;
                    //Populate the breadcrumb
                    DataBindBreadCrumbSiteMap(currentItem);
                }
                // else
                // RadMenu1.Items[0].HighlightPath();

                Methods m = new Methods();
                m.CheckUserLoged();
                int ID = Int32.Parse(Session["userID"].ToString());
                HoSoNhanVien_UngVien lq = _entities.HoSoNhanVien_UngVien.Where(x=>x.IDNhanVien == ID).FirstOrDefault();
                btnUsesrInfo.Text = lq.TenNV;
                // phan quyen
                //RadMenu1.Items.FindItemByValue("quantri").Enabled = false;
            }
        }

        protected void CheckPermis()
        {
            Methods m = new Methods();
            m.CheckUserLoged();
            Int32 userID = (Int32)Session["userID"];
            ArrayList pq = new ArrayList();
            pq.AddRange(_entities.GetChucNangByIDNhanVien(userID).ToArray());
            RadMenu1.Items.FindItemByValue("quantri").Visible = pq.Contains(3);
            RadMenu1.Items.FindItemByValue("quanly").Items.FindItemByValue("hoso").Visible = pq.Contains(1);
            RadMenu1.Items.FindItemByValue("quanly").Items.FindItemByValue("hopdong").Visible = pq.Contains(2);
            RadMenu1.Items.FindItemByValue("quanly").Items.FindItemByValue("thunhap").Visible = pq.Contains(6);
            //RadMenu1.Items.FindItemByValue("quanly").Items.FindItemByValue("tuyendung").Visible = pq.Contains(14);
            //RadMenu1.Items.FindItemByValue("danhmuc").Visible = pq.Contains(13);
        }

        private void DataBindBreadCrumbSiteMap(RadMenuItem currentItem)
        {
            List<RadMenuItem> breadCrumbPath = new List<RadMenuItem>();
            while (currentItem != null)
            {
                breadCrumbPath.Insert(0, currentItem);
                currentItem = currentItem.Owner as RadMenuItem;
            }
            BreadCrumbSiteMap.DataSource = breadCrumbPath;
            BreadCrumbSiteMap.DataBind();
        }

        protected void LoginStatus_Logout(object sender, EventArgs e)
        {
            Session["userId"] = null;// user dang nhap
            Response.Redirect(Request.RawUrl);
        }

        protected void RadMenu1_ItemClick(object sender, RadMenuEventArgs e)
        {
            switch (e.Item.Value)
            {
                case "dangxuat":
                    Session["userId"] = null;
                    Response.Redirect(Request.RawUrl);
                    break;
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Aits_Hrm.Model;
using System.Collections;
using System.Xml;
using System.Data;
using Telerik.Web.UI;

namespace Aits_Hrm.Home
{
    public partial class Home : System.Web.UI.Page
    {
        private QuanLyNhanSuEntities _entities = new QuanLyNhanSuEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
             //RadChart1.Attributes.Add("style","width:100%;");
             //RadChart3.Attributes.Add("style", "width:100%;");
             //CheckPermis();
             //if (!IsPostBack)
             //{
             //    ArrayList list = new ArrayList();
             //    list.AddRange(_entities.GetTyLeNamNu().ToArray());
             //    RadChart3.Series[0].DataYColumn = "Nam";
             //    RadChart3.Series[1].DataYColumn = "Nu";
             //    RadChart3.PlotArea.XAxis.DataLabelsColumn = "TonGiao";
             //    RadChart3.PlotArea.XAxis.Appearance.TextAppearance.TextProperties.Font = new System.Drawing.Font("Arial", 8); 
             //    RadChart3.DataSource = list;
             //    RadChart3.DataBind();
             //    var dt = from k in _entities.GetBienDongNhanSu() orderby k.namsinh select k;
             //    list = new ArrayList();
             //    list.AddRange(dt.ToArray());
             //    RadChart1.Series[0].DataYColumn = "soNV";
             //    RadChart1.PlotArea.XAxis.DataLabelsColumn = "namsinh";
             //    RadChart1.DataSource = list;
             //    RadChart1.DataBind();
            //}
            if (! IsPostBack)
            {
                Bieudo uc = (Bieudo)Page.LoadControl("BieuDo.ascx");
                plTopRight.Controls.Add(uc);
                CheckPermis();
                //XmlTextReader reader = null;
                //try
                //{
                //    /* Danh sach cac trang rss
                //     * http://vnexpress.net/rss/gl/kinh-doanh.rss
                //     * http://tintuc.vnn.vn/rss/thoi_su.rss
                //     * http://www.24h.com.vn/upload/rss/tintuctrongngay.rss
                //     * http://www.24h.com.vn/upload/rss/thitruongtieudung.rss
                //    */
                //    reader = new XmlTextReader("http://www.baomoi.com/Home/XaHoi.rss");
                //    DataSet ds = new DataSet();
                //    ds.ReadXml(reader);
                //    dlRSS.DataSource = ds.Tables["item"];
                //    dlRSS.DataBind();
                //}
                //catch (Exception ex)
                //{
                //    //Response.Write(ex.Message);
                //}
                //finally
                //{
                //    reader.Close();
                //}
            }
        }

        protected void CheckPermis()
        {
            if (Session["userID"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
        }

        protected void RadMenuVe_ItemClick(object sender, Telerik.Web.UI.RadMenuEventArgs e)
        {
            switch (e.Item.Value)
            {
                case "tongquan":
                    plTopRight.Controls.Add((Bieudo)Page.LoadControl("BieuDo.ascx"));                    
                    break;
                case "hoso":
                    plTopRight.Controls.Add((HoSoCaNhan)Page.LoadControl("HoSoCaNhan.ascx"));
                    break;
            }
        }

        protected void AjaxManager_Request(object sender, AjaxRequestEventArgs e)
        {
             //RadTreeNodeEventArgs tne;// = new RadTreeNodeEventArgs(RadTreeView1.SelectedNode);
             //switch (e.Argument)
             //{
             //    case "XoaNV":
             //        var dt = _entities.DeleteEmployeeByIDNhanVien((Int32)Session["idNV"]);
             //        RadGrid1.Rebind();
             //        tne = new RadTreeNodeEventArgs(RadTreeView1.SelectedNode);
             //        RadTreeView1_Nodeclick(sender, tne);
             //        break;
             //    case "RebindGrid":
             //        var dtRebind = new object();
             //        RadTreeNode tn = RadTreeView1.SelectedNode;
             //        if (tn.Level.Equals(0))
             //        {
             //            dtRebind = from q in _entities.GetAllCV()
             //                       select q;
             //        }
             //        else
             //        {
             //            dtRebind = from q in _entities.GetCVByIDToChuc(Int32.Parse(tn.Value))
             //                       select q;
 
             //        }
 
             //        RadGrid1.DataSource = dtRebind;
             //        RadGrid1.DataBind();
             //        //if (RadGrid1.Items.Count > 0)
             //        {
             //            FillCurrentEmployeeDetail((int)Session["idNV"]);
             //        }
            //foreach (GridDataItem item in RadGrid1.Items)
            //{
            //    if (item.RowIndex == 2)
            //    {
            //        item.Selected = true;
            //    }
            //}
            //break;
        // }
        }

        protected void RadGridNhacViec_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            var lstNhanVien = _entities.HoSoNhanVien_UngVien.ToList();
            List<HoSoNhanVien_UngVien> newlstNhanVien = new List<HoSoNhanVien_UngVien>();
            foreach (HoSoNhanVien_UngVien nv in lstNhanVien)
            {
                if (nv.NgaySinh.Value.ToString("dd/MM") == DateTime.Today.ToString("dd/MM"))
                {
                    newlstNhanVien.Add(nv);
                }
            }
            RadGridNhacViec.DataSource = newlstNhanVien;
        }

        protected void RadGridHanHD_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            var lstHopDong = _entities.GetAllHopDong().Where(x=>x.DenNgay == DateTime.Today);
            RadGridHanHD.DataSource = lstHopDong;
        }
    }
}
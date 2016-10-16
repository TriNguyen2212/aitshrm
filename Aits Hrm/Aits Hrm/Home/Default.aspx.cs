using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Aits_Hrm.Model;
using System.Collections;
using Aits_Hrm.CommonMethod;
using Aits_Hrm;

namespace Aits_Hrm.Home
{
    public partial class Default : System.Web.UI.Page
    {
        private QuanLyNhanSuEntities _entities = new QuanLyNhanSuEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
//             CheckPermis();
//             if (!IsPostBack)
//             {
//                 ArrayList list = new ArrayList();
//             list.AddRange(_entities.GetTyLeNamNu().ToArray());
// //             RadChart3.Series[0].DataYColumn = "Nam";
// //             RadChart3.Series[1].DataYColumn = "Nu";
// //             RadChart3.PlotArea.XAxis.DataLabelsColumn = "TonGiao";
// //             RadChart3.PlotArea.XAxis.Appearance.TextAppearance.TextProperties.Font = new System.Drawing.Font("Arial", 8);
//             
//             RadChart3.DataSource = list;
//             RadChart3.DataBind();
// 
//             var dt = from k in _entities.GetBienDongNhanSu() orderby k.namsinh select k;
//             list = new ArrayList();
//             list.AddRange(dt.ToArray());
// 
//             RadChart1.Series[0].DataYColumn = "soNV";
//             RadChart1.PlotArea.XAxis.DataLabelsColumn = "namsinh";
//             RadChart1.DataSource = list;
//             RadChart1.DataBind();
//             }
        }

        protected void CheckPermis()
        {
            if (Session["userID"] == null)
            {
                Response.Redirect("../Login.aspx");

            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using Aits_Hrm.Model;
using Telerik.Charting;

namespace Aits_Hrm.Home
{
    public partial class Bieudo : System.Web.UI.UserControl
    {
        private QuanLyNhanSuEntities _entities = new QuanLyNhanSuEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            var dt = from k in _entities.GetBienDongNhanSu() orderby k.namsinh select k;
            List<GetBienDongNhanSu_Result> newLstBienDong = new List<GetBienDongNhanSu_Result>();
            List<GetBienDongNhanSu_Result> lstBienDong = dt.ToList();
            int? SumNV = lstBienDong[0].soNV;
            for(int i=1;i<lstBienDong.Count;i++)
            {
                SumNV += lstBienDong[i].soNV;
                lstBienDong[i].soNV = SumNV;
                newLstBienDong.Add(lstBienDong[i]);
            }
            RadChart1.Series[0].DataYColumn = "soNV";
            RadChart1.PlotArea.XAxis.DataLabelsColumn = "namsinh";
            RadChart1.DataSource = newLstBienDong;
            RadChart1.DataBind();

            RadChart2.IntelligentLabelsEnabled = false;    
            List<GetTyLeNamNu_Result> lstTyLe = _entities.GetTyLeNamNu().ToList();
            ChartSeries serie = new ChartSeries();
            serie.Name = "Giới tính";
            serie.Type = ChartSeriesType.Pie;
            serie.Clear();
            serie.Appearance.LegendDisplayMode = ChartSeriesLegendDisplayMode.ItemLabels;
            ChartSeriesItem item1 = new ChartSeriesItem();
            item1.YValue = (double)lstTyLe[0].Nam;
            //item1.Name = "Nam";
            item1.Appearance.Exploded = true;
            item1.Label.TextBlock.Text = "Nam" + " - #%";
            serie.Items.Add(item1);

            ChartSeriesItem item2 = new ChartSeriesItem();
            item2.YValue = (double)lstTyLe[0].Nu;
            //item2.Name = "Nữ";
            item2.Appearance.Exploded = true;
            item2.Label.TextBlock.Text = "Nữ" + " - #%";

            serie.Items.Add(item2);
            RadChart2.Series.Add(serie);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using Aits_Hrm.Model;
using Aits_Hrm.Report;

namespace Aits_Hrm.CV
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        static string prevPage = String.Empty; // static variable to back previous page
        private QuanLyNhanSuEntities _entities = new QuanLyNhanSuEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            
// //             ReportDataSource rpdt = new ReportDataSource();
//             var dt = from k in _entities.GetHopDongByID(1) 
//                                 select k;
//            // rpdt.DataMember = dt;
// 
//             ReportViewer1.LocalReport.DataSources.Add(dt);
           if (!IsPostBack)
           {
               prevPage = Request.UrlReferrer.ToString();
               String PrintType = Session["PrintType"].ToString();
               switch (PrintType)
               {
                   case "PhuLuc":
                       PhuLucHDbmtt rp1 = new PhuLucHDbmtt();
                       rp1.ReportParameters["idPLHD"].Value = Session["IDPhuLucHD"];
                       ReportViewer1.Report = rp1;
                       break;
                   case "HopDong":
                       Int32 IDHD = (Int32)Session["idHD"];
                        var dt = _entities.HopDongLDs.Where(x => x.IDHopDongLD == IDHD).FirstOrDefault();
                        if (dt.IDLoaiHD == 1)// ngan han
                        {
                            ReportHopDong rp = new ReportHopDong();
                            rp.ReportParameters["iDHopDongLD"].Value = Session["idHD"];
                            ReportViewer1.Report = rp;
                        }else
                        {
                            ReportHopDongChinhThuc rp2 = new ReportHopDongChinhThuc();
                            rp2.ReportParameters["iDHopDongLD"].Value = Session["idHD"];
                            ReportViewer1.Report = rp2;
                        }
                       break;

               }
               
               
           }
        }

        // test xuat file 
        protected void Button1_Click(object sender, EventArgs e)
        {
            Telerik.Reporting.Processing.ReportProcessor reportProcessor = new Telerik.Reporting.Processing.ReportProcessor();

            //set any deviceInfo settings if necessary
            System.Collections.Hashtable deviceInfo = new System.Collections.Hashtable();

            Telerik.Reporting.Processing.RenderingResult result = reportProcessor.RenderReport("DOCX", ReportViewer1.Report, deviceInfo);
            string fileName = result.DocumentName + "." + result.Extension;
            const string path = @"C:\";
            string filePath = System.IO.Path.Combine(path, fileName);

            using (System.IO.FileStream fs = new System.IO.FileStream(filePath, System.IO.FileMode.Create))
            {
                fs.Write(result.DocumentBytes, 0, result.DocumentBytes.Length);
            }
        }

        protected void btnGoBack_Click(object sender, EventArgs e)
        {
            Response.Redirect(prevPage);
        }
    }
}
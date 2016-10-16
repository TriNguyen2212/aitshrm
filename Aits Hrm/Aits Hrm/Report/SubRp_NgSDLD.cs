namespace Aits_Hrm.Report
{
    using System;
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;
    using Telerik.Reporting;
    using Telerik.Reporting.Drawing;

    /// <summary>
    /// Summary description for ReportCV.
    /// </summary>
    public partial class SubRp_NgSDLD : Telerik.Reporting.Report
    {
        public SubRp_NgSDLD()
        {
            //
            // Required for telerik Reporting designer support
            //
            InitializeComponent();
            //textBox11.Value = "";
            //this.ReportParameters["iDNhanVien"].Value = 9;
            //
            // TODO: Add any constructor code after InitializeComponent call
            //
        }

        public static string ShowTenNSDLD(String TenNV, bool gioitinh)
        {
            if (gioitinh)
            {
                return String.Format("Chúng tôi, một bên là Ông: {0}", TenNV);
            } 
            else
            {
                return String.Format("Chúng tôi, một bên là Bà: {0}", TenNV);
            }
        }

       
    }
}
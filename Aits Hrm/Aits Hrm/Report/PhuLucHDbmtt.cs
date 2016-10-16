namespace Aits_Hrm.Report
{
    using System;
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;
    using Telerik.Reporting;
    using Telerik.Reporting.Drawing;

    /// <summary>
    /// Summary description for PhuLucHDbmtt.
    /// </summary>
    public partial class PhuLucHDbmtt : Telerik.Reporting.Report
    {
        public PhuLucHDbmtt()
        {
            //
            // Required for telerik Reporting designer support
            //
            InitializeComponent();
            this.DataSource = entityDataSource1;
            this.ReportParameters["idPLHD"].Value = 11;
            
            //
            // TODO: Add any constructor code after InitializeComponent call
            //
        }

        public static string ShowNgayThang(DateTime ngaythang)
        {
            return String.Format("ngày {0:dd} tháng {0:MM} năm {0:yyyy}", ngaythang, ngaythang, ngaythang);
        }

        public static string ShowTen(String TenNV, bool gioitinh)
        {
            if (gioitinh)
            {
                return String.Format("Một bên là Ông: {0}", TenNV);
            }
            else
            {
                return String.Format("Một bên là Bà: {0}", TenNV);
            }
        }

        public static string ShowTenNV(String TenNV, bool gioitinh)
        {
            if (gioitinh)
            {
                return String.Format("Và một bên là Ông: {0}", TenNV);
            }
            else
            {
                return String.Format("Và một bên là Bà: {0}", TenNV);
            }
        }
    }
}
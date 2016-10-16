namespace Aits_Hrm.Report
{
    using System;
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;
    using Telerik.Reporting;
    using Telerik.Reporting.Drawing;

    /// <summary>
    /// Summary description for SubRp_NgLD.
    /// </summary>
    public partial class SubRp_NgLD : Telerik.Reporting.Report
    {
        public SubRp_NgLD()
        {
            //
            // Required for telerik Reporting designer support
            //
            InitializeComponent();
            this.ReportParameters["FontSize"].Value = 11;
            String str = this.ReportParameters["FontSize"].Value.ToString();
            //this.ReportParameters["idNhanvien"].Value = 9;
//             Int32 d = Int32.Parse(this.ReportParameters["Font"].Value.ToString());

            this.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(Int32.Parse(str));
//             int font = (int)(ReportParameters["Font"].Value);
            /*this.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(11);*/

            //
            // TODO: Add any constructor code after InitializeComponent call
            //
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

        public static string ShowNgayThang(DateTime ngaythang)
        {
            return String.Format("ngày {0:dd} tháng {0:MM} năm {0:yyyy}", ngaythang, ngaythang, ngaythang);
        }
    }
}
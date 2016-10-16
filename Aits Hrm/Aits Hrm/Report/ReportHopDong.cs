namespace Aits_Hrm.Report
{
    using System;
    using System.ComponentModel;
    using System.Drawing;
    //using System.Windows.Forms;
    using Telerik.Reporting;
    using Telerik.Reporting.Drawing;
    using Aits_Hrm.Model;

    /// <summary>
    /// Summary description for Report2.
    /// </summary>
    public partial class ReportHopDong : Telerik.Reporting.Report
    {
        public ReportHopDong()
        {
            //
            // Required for telerik Reporting designer support
            //
            InitializeComponent();
            this.DataSource = entityDataSource1;            
            this.ReportParameters["idHopDongLD"].Value = 57;
            textBox15.Value = "=GetLoaiHopDong(Fields.LoaiHD)";
            //textBox15.Value = "=ShowNgayThang(Fields.TuNgay)";
            
            //
            // TODO: Add any constructor code after InitializeComponent call
            //
        }

        public static string GetLoaiHopDong(String loaiHD)
        {
            loaiHD = loaiHD.Substring(2);
            return String.Format("{0}", loaiHD);
        }

        public static string ShowNgayThang(DateTime ngaythang)
        {
            return String.Format("ngày {0:dd} tháng {0:MM} năm {0:yyyy}", ngaythang, ngaythang, ngaythang);
        }

        public static string ShowNgayHetHD(object ngaythang, int idLoaiHD)
        {
            if (idLoaiHD != 4 && ngaythang != null)
            {
                DateTime ngaythang2 = (DateTime)ngaythang;
                return String.Format("Đến ngày {0:dd} tháng {0:MM} năm {0:yyyy}", ngaythang2, ngaythang2, ngaythang2);
            } 
            else
            {
                return String.Empty;
            }
            
        }
    }
}
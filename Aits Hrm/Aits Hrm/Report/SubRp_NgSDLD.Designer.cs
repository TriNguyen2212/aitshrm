namespace Aits_Hrm.Report
{
    partial class SubRp_NgSDLD
    {
        #region Component Designer generated code
        /// <summary>
        /// Required method for telerik Reporting designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            Telerik.Reporting.ReportParameter reportParameter1 = new Telerik.Reporting.ReportParameter();
            this.detail = new Telerik.Reporting.DetailSection();
            this.textBox5 = new Telerik.Reporting.TextBox();
            this.textBox7 = new Telerik.Reporting.TextBox();
            this.textBox8 = new Telerik.Reporting.TextBox();
            this.textBox9 = new Telerik.Reporting.TextBox();
            this.textBox11 = new Telerik.Reporting.TextBox();
            this.textBox4 = new Telerik.Reporting.TextBox();
            this.entityDataSource1 = new Telerik.Reporting.EntityDataSource();
            ((System.ComponentModel.ISupportInitialize)(this)).BeginInit();
            // 
            // detail
            // 
            this.detail.Height = Telerik.Reporting.Drawing.Unit.Inch(1D);
            this.detail.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.textBox5,
            this.textBox7,
            this.textBox8,
            this.textBox9,
            this.textBox11,
            this.textBox4});
            this.detail.Name = "detail";
            this.detail.Style.Font.Name = "Times New Roman";
            this.detail.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(12D);
            this.detail.Style.VerticalAlign = Telerik.Reporting.Drawing.VerticalAlign.Middle;
            // 
            // textBox5
            // 
            this.textBox5.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(0D), Telerik.Reporting.Drawing.Unit.Inch(0.29999995231628418D));
            this.textBox5.Multiline = false;
            this.textBox5.Name = "textBox5";
            this.textBox5.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(6.1999607086181641D), Telerik.Reporting.Drawing.Unit.Inch(0.20000004768371582D));
            this.textBox5.Style.VerticalAlign = Telerik.Reporting.Drawing.VerticalAlign.Middle;
            this.textBox5.Value = "Chức vụ: {=ChucDanh}";
            // 
            // textBox7
            // 
            this.textBox7.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(0D), Telerik.Reporting.Drawing.Unit.Inch(0.50007867813110352D));
            this.textBox7.Multiline = false;
            this.textBox7.Name = "textBox7";
            this.textBox7.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(6.4000000953674316D), Telerik.Reporting.Drawing.Unit.Inch(0.29992136359214783D));
            this.textBox7.Style.VerticalAlign = Telerik.Reporting.Drawing.VerticalAlign.Middle;
            this.textBox7.Value = "Đại diện cho: CÔNG TY CỔ PHẦN TIN HỌC- VIỄN THÔNG HÀNG KHÔNG (AITS)";
            // 
            // textBox8
            // 
            this.textBox8.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(0D), Telerik.Reporting.Drawing.Unit.Inch(0.800000011920929D));
            this.textBox8.Multiline = false;
            this.textBox8.Name = "textBox8";
            this.textBox8.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(3.4000003337860107D), Telerik.Reporting.Drawing.Unit.Inch(0.19999997317790985D));
            this.textBox8.Style.VerticalAlign = Telerik.Reporting.Drawing.VerticalAlign.Middle;
            this.textBox8.Value = "Địa chỉ: 414 Nguyễn Văn Cừ- Long biên- Hà nội. ";
            // 
            // textBox9
            // 
            this.textBox9.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(3.9000003337860107D), Telerik.Reporting.Drawing.Unit.Inch(0.800000011920929D));
            this.textBox9.Multiline = false;
            this.textBox9.Name = "textBox9";
            this.textBox9.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(2.4999606609344482D), Telerik.Reporting.Drawing.Unit.Inch(0.19999997317790985D));
            this.textBox9.Style.VerticalAlign = Telerik.Reporting.Drawing.VerticalAlign.Middle;
            this.textBox9.Value = "Số điện thoại: 04.38272616";
            // 
            // textBox11
            // 
            this.textBox11.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(0D), Telerik.Reporting.Drawing.Unit.Inch(3.9378803194267675E-05D));
            this.textBox11.Multiline = false;
            this.textBox11.Name = "textBox11";
            this.textBox11.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(3.8000001907348633D), Telerik.Reporting.Drawing.Unit.Inch(0.29996064305305481D));
            this.textBox11.Style.Font.Bold = true;
            this.textBox11.Style.VerticalAlign = Telerik.Reporting.Drawing.VerticalAlign.Middle;
            this.textBox11.Value = "=ShowTenNSDLD(Fields.TenNV, Fields.GioiTinh)";
            // 
            // textBox4
            // 
            this.textBox4.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(3.9000003337860107D), Telerik.Reporting.Drawing.Unit.Inch(3.9378803194267675E-05D));
            this.textBox4.Multiline = false;
            this.textBox4.Name = "textBox4";
            this.textBox4.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(2.49996018409729D), Telerik.Reporting.Drawing.Unit.Inch(0.29996064305305481D));
            this.textBox4.Style.VerticalAlign = Telerik.Reporting.Drawing.VerticalAlign.Middle;
            this.textBox4.Value = "Quốc tịch: {=QuocTich}";
            // 
            // entityDataSource1
            // 
            this.entityDataSource1.ConnectionString = "QuanLyNhanSuEntities";
            this.entityDataSource1.Name = "entityDataSource1";
            this.entityDataSource1.ObjectContext = typeof(Aits_Hrm.Model.QuanLyNhanSuEntities);
            this.entityDataSource1.ObjectContextMember = "GetCVByID";
            this.entityDataSource1.Parameters.AddRange(new Telerik.Reporting.ObjectDataSourceParameter[] {
            new Telerik.Reporting.ObjectDataSourceParameter("iDNhanVien", typeof(System.Nullable<int>), "=Parameters.iDNhanVien.Value")});
            // 
            // SubRp_NgSDLD
            // 
            this.DataSource = this.entityDataSource1;
            this.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.detail});
            this.Name = "ReportCV";
            this.PageSettings.Landscape = false;
            this.PageSettings.Margins.Bottom = Telerik.Reporting.Drawing.Unit.Mm(20D);
            this.PageSettings.Margins.Left = Telerik.Reporting.Drawing.Unit.Mm(30D);
            this.PageSettings.Margins.Right = Telerik.Reporting.Drawing.Unit.Mm(15D);
            this.PageSettings.Margins.Top = Telerik.Reporting.Drawing.Unit.Mm(20D);
            this.PageSettings.PaperKind = System.Drawing.Printing.PaperKind.A4;
            reportParameter1.Name = "iDNhanVien";
            reportParameter1.Text = "iDNhanVien";
            reportParameter1.Visible = true;
            this.ReportParameters.Add(reportParameter1);
            this.Style.BackgroundColor = System.Drawing.Color.White;
            this.Width = Telerik.Reporting.Drawing.Unit.Inch(6.4000000953674316D);
            ((System.ComponentModel.ISupportInitialize)(this)).EndInit();

        }
        #endregion

        private Telerik.Reporting.DetailSection detail;
        private Telerik.Reporting.TextBox textBox5;
        private Telerik.Reporting.EntityDataSource entityDataSource1;
        private Telerik.Reporting.TextBox textBox7;
        private Telerik.Reporting.TextBox textBox8;
        private Telerik.Reporting.TextBox textBox9;
        private Telerik.Reporting.TextBox textBox11;
        private Telerik.Reporting.TextBox textBox4;
    }
}
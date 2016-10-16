namespace Aits_Hrm.Report
{
    partial class Report1
    {
        #region Component Designer generated code
        /// <summary>
        /// Required method for telerik Reporting designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.detail = new Telerik.Reporting.DetailSection();
            this.entityDataSource1 = new Telerik.Reporting.EntityDataSource();
            this.htmlTextBox1 = new Telerik.Reporting.HtmlTextBox();
            ((System.ComponentModel.ISupportInitialize)(this)).BeginInit();
            // 
            // detail
            // 
            this.detail.Height = Telerik.Reporting.Drawing.Unit.Inch(2.1000001430511475D);
            this.detail.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.htmlTextBox1});
            this.detail.Name = "detail";
            // 
            // entityDataSource1
            // 
            this.entityDataSource1.ConnectionString = "QuanLyNhanSuEntities";
            this.entityDataSource1.Name = "entityDataSource1";
            this.entityDataSource1.ObjectContext = typeof(Aits_Hrm.Model.QuanLyNhanSuEntities);
            this.entityDataSource1.ObjectContextMember = "GetAllCV";
            // 
            // htmlTextBox1
            // 
            this.htmlTextBox1.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(0.60000008344650269D), Telerik.Reporting.Drawing.Unit.Inch(0.60000008344650269D));
            this.htmlTextBox1.Name = "htmlTextBox1";
            this.htmlTextBox1.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(3D), Telerik.Reporting.Drawing.Unit.Inch(0.60000008344650269D));
            this.htmlTextBox1.Value = "=TenNV";
            // 
            // Report1
            // 
            this.DataSource = this.entityDataSource1;
            this.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.detail});
            this.Name = "Report1";
            this.PageSettings.Margins.Bottom = Telerik.Reporting.Drawing.Unit.Inch(1D);
            this.PageSettings.Margins.Left = Telerik.Reporting.Drawing.Unit.Inch(1D);
            this.PageSettings.Margins.Right = Telerik.Reporting.Drawing.Unit.Inch(1D);
            this.PageSettings.Margins.Top = Telerik.Reporting.Drawing.Unit.Inch(1D);
            this.PageSettings.PaperKind = System.Drawing.Printing.PaperKind.Letter;
            this.Style.BackgroundColor = System.Drawing.Color.White;
            this.Width = Telerik.Reporting.Drawing.Unit.Inch(6D);
            ((System.ComponentModel.ISupportInitialize)(this)).EndInit();

        }
        #endregion

        private Telerik.Reporting.DetailSection detail;
        private Telerik.Reporting.HtmlTextBox htmlTextBox1;
        private Telerik.Reporting.EntityDataSource entityDataSource1;
    }
}
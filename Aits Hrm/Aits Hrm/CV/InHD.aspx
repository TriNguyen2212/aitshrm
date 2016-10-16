<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InHD.aspx.cs" Inherits="Aits_Hrm.CV.WebForm1" %>

<%@ Register Assembly="Telerik.ReportViewer.WebForms, Version=6.0.12.330, Culture=neutral, PublicKeyToken=a9d7983dfcc261be"
    Namespace="Telerik.ReportViewer.WebForms" TagPrefix="telerik" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hợp đồng lao động</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:LinkButton ID="btnGoBack" runat="server" onclick="btnGoBack_Click">Quay lại</asp:LinkButton>
        <telerik:ReportViewer ID="ReportViewer1" runat="server" Width="100%" ShowZoomSelect="true" ViewMode="PrintPreview" 
            Height="560px" ProgressText="Đang tải dữ liệu..." Resources-ExportButtonText="Xuất file" 
            Resources-ExportToolTip="Xuất file" Resources-ExportSelectFormatText="Chọn định dạng file xuất">
        </telerik:ReportViewer>
    </div>
    </form>
</body>
</html>

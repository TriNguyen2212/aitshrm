<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SaoLuuHeThong.aspx.cs" Inherits="Aits_Hrm.QuanTri.SaoLuuHeThong" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sao lưu hệ thống</title>
    <style type="text/css">
        .style1{color: #FF0000;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <span class="style1"><strong>Lưu ý:</strong><br />
        <asp:Label ID="lbNote" CssClass="rfdAspLabel" runat="server" Text="" /></span>
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server" />
            <telerik:RadButton ID="butBackup" runat="server" onclick="butBackup_Click" Text="Sao lưu dữ liệu" />
            <telerik:RadButton ID="butRestore" runat="server" onclick="butRestore_Click" Text="Khôi phục dữ liệu" /><br />
            <asp:Label ID="lbProcess" CssClass="rfdAspLabel" runat="server" Text="" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" />
    </div>
    </form>
</body>
</html>

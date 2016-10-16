<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThemTaiKhoan.aspx.cs" Inherits="Aits_Hrm.QuanTri.ThemTaiKhoan" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Thêm mới tài khoản người dùng</title>
    <link rel="stylesheet" href="../Styles/StyleSheet.css" type="text/css" />
     <style type="text/css">
            .multipleRowsColumns .rcbItem, .multipleRowsColumns .rcbHovered
            {
                float: left;
                margin: 0 1px;
                min-height: 13px;
                overflow: hidden;
                padding: 2px 19px 2px 6px;
                width: 125px;
            }
            html.rfdButton a.rfdSkinnedButton 
            {
                vertical-align: middle;
                margin: 0 0 0 5px;
            }
            label
            {
                display: inline-block;
                width: 200px;
                text-align: right;
                padding-right: 5px;
                margin-top: 10px;
            }
            * html.rfdButton a.rfdSkinnedButton,
            * html.rfdButton input.rfdDecorated
            {
                vertical-align: top;
            }
        </style>
</head>

<body>
    <form id="form1" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server" />
   <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" Height="100%" Width="100%">
        <telerik:RadFormDecorator ID="FormDecorator1" runat="server" DecoratedControls="all" />
        <telerik:RadToolBar ID="RadToolBar1" Runat="server" EnableRoundedCorners="true" 
            EnableShadows="true" Width="100%" onbuttonclick="RadToolBar1_ButtonClick1">
            <Items>
                <telerik:RadToolBarButton runat="server" Value="Save" Text="Lưu lại"></telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" Value="Reset" CausesValidation="false" Text="Nhập lại"></telerik:RadToolBarButton>
            </Items>
        </telerik:RadToolBar>
        <fieldset>
            <legend style="font-weight:bold;">Thông tin tài khoản</legend>
            <table width="100%">
                <tr>
                    <td><label for="txtTenDangNhap">Tên Đăng nhập:</label></td>
                    <td>
                        <telerik:RadTextBox ID="txtTenDangNhap" runat="server" Width="300px" ></telerik:RadTextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="None"
                             ControlToValidate="txtTenDangNhap" Text="*" ErrorMessage="Chưa nhập tên đăng nhập" SetFocusOnError="true">
                        </asp:RequiredFieldValidator>
                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" TargetControlID="RequiredFieldValidator1"
                                HighlightCssClass="highlight" PopupPosition="Right" runat="server">
                        </asp:ValidatorCalloutExtender>
                    </td>
                </tr>
                <tr>
                    <td><label for="cbxNhanVien">Nhân viên:</label></td>
                    <td>
                        <telerik:RadComboBox ID="cbxNhanVien" runat="server" Width="300px" HighlightTemplatedItems="true"
                            MarkFirstMatch="true" AutoPostBack="true" Height="300px" DataValueField="IDNhanvien"
                            EnableLoadOnDemand="true" onitemsrequested="cbxNhanVien_ItemsRequested">
                            <HeaderTemplate>
                                <ul>
                                    <li class="col1">Tên NV</li>
                                    <li class="col2">Mã NV</li>
                                </ul>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <ul>
                                    <li class="col1">
                                        <%# DataBinder.Eval(Container.DataItem, "TenNV") %></li>
                                    <li class="col2">
                                        <%# DataBinder.Eval(Container.DataItem, "MaNV") %></li>
                                </ul>
                            </ItemTemplate>
                        </telerik:RadComboBox>
                    </td>
                </tr>
                <tr>
                    <td><label for="chbCanLogin">Được đăng nhập:</label></td>
                    <td><asp:CheckBox ID="chbCanLogin" runat="server" /></td>
                </tr>
            </table>
        </fieldset>
        </telerik:RadAjaxPanel>
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" />
    </form>
</body>
</html>
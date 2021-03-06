﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_NhomQuyen.aspx.cs" Inherits="Aits_Hrm.QuanTri.User_NhomQuyen" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Thêm mới tài khoản người dùng</title>
</head>
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
<body>
    <form id="form1" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server" />
   <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" Height="100%" Width="100%">
        <telerik:RadFormDecorator ID="FormDecorator1" runat="server" DecoratedControls="all" />
        <telerik:RadToolBar ID="RadToolBar1" Runat="server" EnableRoundedCorners="true" 
            EnableShadows="true" Width="100%" onbuttonclick="RadToolBar1_ButtonClick1">
            <Items>
                <telerik:RadToolBarButton runat="server" Value="Save" Text="Lưu lại"></telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" Value="Reset" Text="Nhập lại"></telerik:RadToolBarButton>
            </Items>
        </telerik:RadToolBar>
        <fieldset>
            <legend style="font-weight:bold;">Phân quyền người dùng</legend>
            <table width="100%">
                <tr>
                    <td><label for="cbxNhanVien">Nhóm quyền:</label></td>
                    <td>
                        <telerik:RadComboBox ID="cbxNhomQuyen" runat="server" Width="300px" HighlightTemplatedItems="true"
                            MarkFirstMatch="true" AutoPostBack="true" Height="300px" 
                            DataValueField="IDNhomQuyen" DataTextField="TenNhomQuyen"
                           EnableLoadOnDemand="true" >
                        </telerik:RadComboBox>
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
            </table>
        </fieldset>
        <asp:Label ID="lbLog" CssClass="rfdAspLabel" runat="server" Text="" />
        </telerik:RadAjaxPanel>
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" />
    </form>
</body>
</html>

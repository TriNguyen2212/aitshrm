<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QLCoCauToChuc.aspx.cs" Inherits="Aits_Hrm.Category.QLCoCauToChuc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quản lý cơ cấu tổ chức</title>
    <style type="text/css">
        .MyImageButton{cursor: hand;}
    </style>
</head>

<body>
    <form id="form1" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server" />
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function showConfirm(button) {
                function callbackFn(arg) {
                    if (arg) {
                        var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
                        ajaxManager.ajaxRequestWithTarget(button.name, '');
                        //window.location = button.href; 
                    }
                }
                radconfirm("Có chắc xóa không?", callbackFn);
            }
        </script>
    </telerik:RadCodeBlock>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadTreeList1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadTreeList1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadWindowManager ID="RadWindowManager1" runat="server" />
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server"/>
    <telerik:RadAjaxPanel ID="RadAjaxPanel1" LoadingPanelID="RadAjaxLoadingPanel1" runat="server">
        <telerik:RadTreeList ID="RadTreeList1" Culture="vi-VN" runat="server" OnNeedDataSource="RadTreeList1_NeedDataSource"
            OnUpdateCommand="RadTreeList1_UpdateCommand" OnInsertCommand="RadTreeList1_InsertCommand"
            OnDeleteCommand="RadTreeList1_DeleteCommand" ParentDataKeyNames="IDParent" DataKeyNames="IDCoCauToChuc"
            AutoGenerateColumns="false" Width="100%">
            <Columns>
                <telerik:TreeListEditCommandColumn UniqueName="InsertCommandColumn" ButtonType="ImageButton"
                    ShowEditButton="false" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center" />
                <telerik:TreeListButtonColumn CommandName="Edit" Text="Sửa" UniqueName="EditCommandColumn"
                    ButtonType="ImageButton" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center" />
                <%--<telerik:TreeListButtonColumn UniqueName="DeleteCommandColumn" Text="Xóa" CommandName="Delete"
                    ButtonType="ImageButton" HeaderStyle-Width="30px" />--%>
                <telerik:TreeListTemplateColumn ReadOnly="true" HeaderStyle-Width="30px">
                    <ItemTemplate>
                        <asp:ImageButton ID="butXoa" AlternateText="Xóa" CommandName="Delete" ImageUrl="~/Images/delete.gif"
                            OnClientClick="showConfirm(this); return false;" runat="server" />
                    </ItemTemplate>
                </telerik:TreeListTemplateColumn>
                <telerik:TreeListBoundColumn DataField="MaDonVi" HeaderText="Mã đơn vị" UniqueName="MaDonVi"
                    HeaderStyle-Width="50px" />
                <telerik:TreeListBoundColumn DataField="TenDonVi" HeaderText="Tên đơn vị" UniqueName="TenDonVi"
                    HeaderStyle-Width="120px" />
                <telerik:TreeListTemplateColumn UniqueName="CapToChuc" HeaderText="Cấp tổ chức" HeaderStyle-Width="80px">
                    <ItemTemplate>
                        <asp:Label ID="lbCapToChuc" runat="server" Text='<%# Eval("CapToChuc") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadComboBox ID="cboCapToChuc" DataSourceID="EntityDataSource1" DataTextField="CapToChuc1" DataValueField="IDCapToChuc" runat="server" />
                    </EditItemTemplate>
                </telerik:TreeListTemplateColumn>
                <telerik:TreeListBoundColumn DataField="DiaChi" HeaderText="Địa chỉ" UniqueName="DiaChi"/>
                <telerik:TreeListBoundColumn DataField="DienThoai" HeaderText="Điện thoại" UniqueName="DienThoai" HeaderStyle-Width="70px" />
                <telerik:TreeListBoundColumn DataField="NguoiTao" HeaderText="Người tạo" UniqueName="NguoiTao" ReadOnly="true" HeaderStyle-Width="70px" />
                <telerik:TreeListBoundColumn DataField="NgayTao" HeaderText="Ngày tạo" UniqueName="NgayTao" ReadOnly="true" HeaderStyle-Width="70px"/>
                <telerik:TreeListBoundColumn DataField="NguoiCapNhat" HeaderText="Người sửa" ReadOnly="true" UniqueName="NguoiCapNhat" HeaderStyle-Width="70px"/>
                <telerik:TreeListBoundColumn DataField="NgayCapNhat" HeaderText="Ngày sửa" ReadOnly="true" UniqueName="NgayCapNhat" HeaderStyle-Width="70px"/>
            </Columns>
        </telerik:RadTreeList>
    </telerik:RadAjaxPanel>
    <asp:EntityDataSource ID="EntityDataSource1" runat="server" 
        ConnectionString="name=QuanLyNhanSuEntities" 
        DefaultContainerName="QuanLyNhanSuEntities" EnableFlattening="False" 
        EntitySetName="CapToChucs" Select="it.[IDCapToChuc], it.[CapToChuc1]">
    </asp:EntityDataSource>
    </form>
</body>
</html>

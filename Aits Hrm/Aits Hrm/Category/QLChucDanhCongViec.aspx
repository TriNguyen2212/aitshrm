<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QLChucDanhCongViec.aspx.cs" Inherits="Aits_Hrm.Category.QLChucDanhCongViec" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quản lý chức danh công việc</title>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server" />
        <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
            <telerik:RadGrid ID="grvChucDanhCongViec" Culture="vi-VN" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0"
                GridLines="None" ondeletecommand="grvChucDanhCongViec_DeleteCommand" 
                onneeddatasource="grvChucDanhCongViec_NeedDataSource" 
                oninsertcommand="grvChucDanhCongViec_InsertCommand" onunload="grvChucDanhCongViec_Unload" 
                onupdatecommand="grvChucDanhCongViec_UpdateCommand" Width="100%">
                <MasterTableView AutoGenerateColumns="False" ShowHeadersWhenNoRecords="True" DataKeyNames="IDChucDanhCongViec"
                    CommandItemDisplay="Top" InsertItemPageIndexAction="ShowItemOnCurrentPage">
                    <CommandItemSettings ExportToPdfText="Export to PDF" />
                    <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" Visible="True" />
                    <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" Visible="True" />
                    <NoRecordsTemplate>
                        <div><center><strong>Không có dữ liệu</strong></center></div>
                    </NoRecordsTemplate>
                    <Columns>
                        <telerik:GridEditCommandColumn ButtonType="ImageButton" HeaderText="Sửa" >
                            <HeaderStyle Width="50px" />
                        </telerik:GridEditCommandColumn>
                        <telerik:GridButtonColumn ConfirmText="Có chắc xóa không?" ConfirmDialogType="RadWindow"
                            ConfirmTitle="Xóa" CommandName="Delete" ConfirmDialogHeight="100px" ButtonType="ImageButton"
                            ConfirmDialogWidth="285px" HeaderText="Xóa" UniqueName="columnXoa" >
                            <HeaderStyle Width="50px" />
                        </telerik:GridButtonColumn>
                        <telerik:GridTemplateColumn DataField="MaChucDanh" UniqueName="MaChucDanh"
                            FilterControlAltText="Filter column column" HeaderText="Mã chức danh">
                            <EditItemTemplate>
                                <asp:TextBox ID="MaChucDanhTextBox" runat="server" Text='<%# Bind("MaChucDanh") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="MaChucDanhLabel" runat="server" Text='<%# Eval("MaChucDanh") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="TenChucDanh" UniqueName="TenChucDanh"
                            FilterControlAltText="Filter column column" HeaderText="Tên chức danh">
                            <EditItemTemplate>
                                <asp:TextBox ID="TenChucDanhTextBox" runat="server" Text='<%# Bind("TenChucDanh") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="TenChucDanhLabel" runat="server" Text='<%# Eval("TenChucDanh") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="MoTa" UniqueName="MoTa"
                            FilterControlAltText="Filter column column" HeaderText="Mô tả" >
                            <EditItemTemplate>
                                <asp:TextBox ID="MoTaTextBox" runat="server" Text='<%# Bind("MoTa") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="MoTaLabel" runat="server" Text='<%# Eval("MoTa") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridNumericColumn DataField="HSChucDanh" 
                            FilterControlAltText="Filter HSChucDanh column" HeaderText="HS Chức danh" 
                            UniqueName="HSChucDanh">
                        </telerik:GridNumericColumn>
                        <telerik:GridNumericColumn DataField="HSTrachNhiemPhuCap"
                            FilterControlAltText="Filter HSTrachNhiemPhuCap column" HeaderText="HS phụ cấp" 
                            UniqueName="HSTrachNhiemPhuCap">
                        </telerik:GridNumericColumn>
                        <telerik:GridBoundColumn DataField="NguoiTao" 
                            FilterControlAltText="Filter NguoiTao column" HeaderText="Người tạo" 
                            ReadOnly="True" UniqueName="NguoiTao">
                        </telerik:GridBoundColumn>
                        <telerik:GridDateTimeColumn DataField="NgayTao" 
                            DataFormatString="{0:dd/MM/yyyy H:mm}" 
                            FilterControlAltText="Filter NgayTao column" HeaderText="Ngày tạo" 
                            ReadOnly="True" UniqueName="NgayTao">
                        </telerik:GridDateTimeColumn>
                        <telerik:GridBoundColumn DataField="NguoiCapNhat" 
                            FilterControlAltText="Filter NguoiCapNhat column" HeaderText="Người sửa" 
                            ReadOnly="True" UniqueName="NguoiCapNhat">
                        </telerik:GridBoundColumn>
                        <telerik:GridDateTimeColumn DataField="NgayCapNhat" 
                            DataFormatString="{0:dd/MM/yyyy H:mm}" 
                            FilterControlAltText="Filter NgayCapNhat column" HeaderText="Ngày sửa" 
                            ReadOnly="True" UniqueName="NgayCapNhat">
                        </telerik:GridDateTimeColumn>
                    </Columns>
                    <EditFormSettings>
                        <EditColumn FilterControlAltText="Filter EditCommandColumn column" />
                    </EditFormSettings>
                </MasterTableView>
                <FilterMenu EnableImageSprites="False" />
            </telerik:RadGrid>
        </telerik:RadAjaxPanel>
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" />
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />
    </form>
</body>
</html>

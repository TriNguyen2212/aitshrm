<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QLTonGiao.aspx.cs" Inherits="Aits_Hrm.Category.QLTonGiao" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quản lý danh mục tôn giáo</title>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server" />
        <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
            <telerik:RadGrid ID="grvTonGiao" Culture="vi-VN" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0"
                GridLines="None" ondeletecommand="grvTonGiao_DeleteCommand" 
                onneeddatasource="grvTonGiao_NeedDataSource" 
                oninsertcommand="grvTonGiao_InsertCommand" onunload="grvTonGiao_Unload" 
                onupdatecommand="grvTonGiao_UpdateCommand" Width="100%">
                <MasterTableView AutoGenerateColumns="False" ShowHeadersWhenNoRecords="True" DataKeyNames="IDTonGiao"
                    CommandItemDisplay="Top" InsertItemPageIndexAction="ShowItemOnCurrentPage">
                    <CommandItemSettings ExportToPdfText="Export to PDF" />
                    <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" Visible="True">
                        <HeaderStyle Width="20px" />
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" Visible="True">
                        <HeaderStyle Width="20px" />
                    </ExpandCollapseColumn>
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
                        <telerik:GridTemplateColumn DataField="TonGiao1" 
                            FilterControlAltText="Filter column column" HeaderText="Tôn giáo" UniqueName="column">
                            <EditItemTemplate>
                                <asp:TextBox ID="TonGiao1TextBox" runat="server" Text='<%# Bind("TonGiao1") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="TonGiao1Label" runat="server" Text='<%# Eval("TonGiao1") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
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
        <telerik:RadWindowManager ID="RadWindowManager2" runat="server" />
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />
    </form>
</body>
</html>

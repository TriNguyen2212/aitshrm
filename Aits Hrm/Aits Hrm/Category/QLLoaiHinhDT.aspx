<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QLLoaiHinhDT.aspx.cs" Inherits="Aits_Hrm.Category.QLLoaiHinhDT" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quản lý loại hình đào tạo</title>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server" />
        <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
            <telerik:RadGrid ID="grvLoaiHinhDT" Culture="vi-VN" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0"
                GridLines="None" ondeletecommand="grvLoaiHinhDT_DeleteCommand" 
                onneeddatasource="grvLoaiHinhDT_NeedDataSource" 
                oninsertcommand="grvLoaiHinhDT_InsertCommand" onunload="grvLoaiHinhDT_Unload" 
                onupdatecommand="grvLoaiHinhDT_UpdateCommand" Width="100%">
                <MasterTableView AutoGenerateColumns="False" ShowHeadersWhenNoRecords="True" DataKeyNames="IDLoaiHinh"
                    CommandItemDisplay="Top" InsertItemPageIndexAction="ShowItemOnCurrentPage">
                    <CommandItemSettings ExportToPdfText="Export to PDF" />
                    <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" Visible="True">
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" Visible="True">
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
                        <telerik:GridTemplateColumn DataField="LoaiHinhDT1" 
                            FilterControlAltText="Filter column column" HeaderText="Loại hình đào tạo" UniqueName="column">
                            <EditItemTemplate>
                                <asp:TextBox ID="LoaiHinhDT1TextBox" runat="server" Text='<%# Bind("LoaiHinhDT1") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LoaiHinhDT1Label" runat="server" Text='<%# Eval("LoaiHinhDT1") %>'></asp:Label>
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
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" />
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />
    </form>
</body>
</html>

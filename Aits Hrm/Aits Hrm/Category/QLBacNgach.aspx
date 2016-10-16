<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QLBacNgach.aspx.cs" Inherits="Aits_Hrm.Category.QLBacNgach1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quản lý bậc ngạch</title>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server" />
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="grvNgach">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="grvNgach" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <telerik:RadGrid ID="grvNgach" runat="server" Width="100%" ShowStatusBar="true" Culture="vi-VN"
            AutoGenerateColumns="False" PageSize="5" AllowSorting="True" AllowMultiRowSelection="False"
            AllowPaging="True" OnDetailTableDataBind="grvNgach_DetailTableDataBind" ondeletecommand="grvNgach_DeleteCommand"
            Oninsertcommand="grvNgach_InsertCommand" onupdatecommand="grvNgach_UpdateCommand" onunload="grvNgach_Unload"
            OnNeedDataSource="grvNgach_NeedDataSource" OnPreRender="grvNgach_PreRender">
            <PagerStyle Mode="NumericPages" />
            <MasterTableView Width="100%" DataKeyNames="IDNgach" Name="tbl_Ngach"
                CommandItemDisplay="Top" ShowHeadersWhenNoRecords="True" AllowMultiColumnSorting="True">
                <DetailTables>
                    <telerik:GridTableView DataKeyNames="IDBacNgach"
                        CommandItemDisplay="Top" ShowHeadersWhenNoRecords="True" Name="tbl_BacNgach" Width="100%">
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
                            <telerik:GridBoundColumn SortExpression="Bac" HeaderText="Bậc" HeaderButtonType="TextButton"
                                DataField="Bac">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn SortExpression="HeSo" HeaderText="Hệ số" HeaderButtonType="TextButton"
                                DataField="HeSo" UniqueName="HeSo">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn DataField="TuNgay" 
                                FilterControlAltText="Filter TuNgay column" HeaderText="Từ ngày" 
                                UniqueName="TuNgay">
                                <EditItemTemplate>
                                    <telerik:RadDatePicker ID="TuNgayRadDatePicker" runat="server" Culture="vi-VN" ShowPopupOnFocus="true"
                                        DbSelectedDate='<%# Bind("TuNgay") %>' Calendar-DayNameFormat="Short">
                                    </telerik:RadDatePicker>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="TuNgayLabel" runat="server" Text='<%# Eval("TuNgay","{0:dd/MM/yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn DataField="DenNgay" 
                                FilterControlAltText="Filter DenNgay column" HeaderText="Đến ngày" 
                                UniqueName="DenNgay">
                                <EditItemTemplate>
                                    <telerik:RadDatePicker ID="DenNgayRadDatePicker" runat="server" Culture="vi-VN" ShowPopupOnFocus="true" 
                                         Calendar-DayNameFormat="Short" DbSelectedDate='<%# Bind("DenNgay") %>'>
                                    </telerik:RadDatePicker>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="DenNgayLabel" runat="server" Text='<%# Eval("DenNgay","{0:dd/MM/yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn SortExpression="Ghichu" HeaderText="Ghi chú" HeaderButtonType="TextButton"
                                DataField="Ghichu">
                            </telerik:GridBoundColumn>
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
                    </telerik:GridTableView>
                </DetailTables>
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
                    <telerik:GridBoundColumn SortExpression="MaNgach" HeaderText="Mã ngạch" HeaderButtonType="TextButton"
                        DataField="MaNgach">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn SortExpression="SoBac" HeaderText="Tổng số bậc" HeaderButtonType="TextButton"
                        DataField="SoBac">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn SortExpression="MoTa" HeaderText="Mô tả" HeaderButtonType="TextButton"
                        DataField="MoTa">
                    </telerik:GridBoundColumn>
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
            </MasterTableView>
        </telerik:RadGrid>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" />
    </form>
</body>
</html>

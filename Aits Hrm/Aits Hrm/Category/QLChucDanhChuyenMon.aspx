<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QLChucDanhChuyenMon.aspx.cs" Inherits="Aits_Hrm.Category.QLChucDanhChuyenMon" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quản lý chức danh chuyên môn</title>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server" />
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="grvNhomChucDanh">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="grvNhomChucDanh" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <telerik:RadGrid ID="grvNhomChucDanh" runat="server" Width="100%" ShowStatusBar="true" Culture="vi-VN"
            AutoGenerateColumns="False" PageSize="10" AllowSorting="True" AllowMultiRowSelection="False"
            AllowPaging="True" OnDetailTableDataBind="grvNhomChucDanh_DetailTableDataBind" ondeletecommand="grvNhomChucDanh_DeleteCommand"
            Oninsertcommand="grvNhomChucDanh_InsertCommand" onupdatecommand="grvNhomChucDanh_UpdateCommand" onunload="grvNhomChucDanh_Unload"
            OnNeedDataSource="grvNhomChucDanh_NeedDataSource" OnPreRender="grvNhomChucDanh_PreRender">
            <PagerStyle Mode="NumericPages" />
            <MasterTableView Width="100%" DataKeyNames="IDNhomChucDanh" Name="tbl_NhomChucDanh"
                CommandItemDisplay="Top" ShowHeadersWhenNoRecords="True" AllowMultiColumnSorting="True">
                <DetailTables>
                    <telerik:GridTableView DataKeyNames="IDChucDanh" Width="100%"
                        CommandItemDisplay="Top" ShowHeadersWhenNoRecords="True" Name="tbl_ChucDanhChuyenMon">
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
                            <telerik:GridBoundColumn SortExpression="MaChucDanh" HeaderText="Mã chức danh" HeaderButtonType="TextButton"
                                DataField="MaChucDanh">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn SortExpression="TenChucDanh" HeaderText="Tên chức danh" HeaderButtonType="TextButton"
                                DataField="TenChucDanh" UniqueName="TenChucDanh">
                            </telerik:GridBoundColumn>                            
                            <telerik:GridBoundColumn SortExpression="MoTa" HeaderText="Mô tả" HeaderButtonType="TextButton"
                                DataField="MoTa" UniqueName="MoTa">
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
                    <telerik:GridBoundColumn SortExpression="NhomChucDanh1" HeaderText="Nhóm chức danh" HeaderButtonType="TextButton"
                        DataField="NhomChucDanh1">
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

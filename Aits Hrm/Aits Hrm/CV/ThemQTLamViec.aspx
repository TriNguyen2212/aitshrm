<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThemQTLamViec.aspx.cs" Inherits="Aits_Hrm.CV.ThemQTLamViec" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Thêm thông tin quá trình làm việc</title>
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
                <telerik:RadToolBarButton runat="server" Value="Reset" Text="Nhập lại"></telerik:RadToolBarButton>
            </Items>
        </telerik:RadToolBar>
                
        <fieldset>
            <legend style="font-weight:bold;">Quá trình làm việc</legend>
            <table width="100%">
                <tr>
                    <td style="width:15%;"><label for="txtTuNgayQTLamViec">Từ ngày</label></td>
                    <td style="width:40%;">
                        <telerik:RadDatePicker ID="txtTuNgayQTLamViec" runat="server" Culture="vi-VN" Width="80%" 
                            ShowPopupOnFocus="True" TabIndex="1" >
                            <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" 
                                ViewSelectorText="x" DayNameFormat="Short">
                            </Calendar>
                            <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" 
                                LabelWidth="40%">
                            </DateInput>
                            <DatePopupButton HoverImageUrl="" ImageUrl="" />
                        </telerik:RadDatePicker>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="None" Text="*"
                             ControlToValidate="txtTuNgayQTLamViec" SetFocusOnError="true" ErrorMessage="Chưa nhập ngày bắt đầu">
                        </asp:RequiredFieldValidator>
                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" TargetControlID="RequiredFieldValidator1"
                            HighlightCssClass="highlight" PopupPosition="Right" runat="server">
                        </asp:ValidatorCalloutExtender>
                    </td>
                    <td style="width:15%;"><label for="txtDenNgayQTLamViec">Đến ngày</label></td>
                    <td align="right" style="width:30%;">
                        <telerik:RadDatePicker ID="txtDenNgayQTLamViec" TabIndex="2" runat="server" Culture="vi-VN" Width="100%" 
                            ShowPopupOnFocus="True" >
                            <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" 
                                ViewSelectorText="x" DayNameFormat="Short">
                            </Calendar>
                            <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" 
                                LabelWidth="40%">
                            </DateInput>
                            <DatePopupButton HoverImageUrl="" ImageUrl="" />
                        </telerik:RadDatePicker>
                    </td>
                </tr>
                <tr>
                    <td><label for="cboChucDanh">Chức danh công việc</label></td>
                    <td>
                        <telerik:RadComboBox ID="cboChucDanh" TabIndex="3" runat="server" AutoPostBack="true" Width="80%"
                            onselectedindexchanged="cboChucDanh_SelectedIndexChanged">
                        </telerik:RadComboBox>
                    </td>
                    <td><label for="txtMucLuong">Mức lương</label></td>
                    <td align="right">
                        <telerik:RadNumericTextBox ID="txtMucLuong" TabIndex="4" Width="100%" runat="server" 
                            Culture="vi-VN" Type="Currency" >                    
                            <NumberFormat DecimalDigits="0" DecimalSeparator="." GroupSeparator="," 
                                ZeroPattern="n ₫" />
                        </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td><label for="cboNhomChucDanh">Nhóm chức danh</label></td>
                    <td colspan="3">
                        <telerik:RadComboBox ID="cboNhomChucDanh" TabIndex="5" Width="100%" runat="server">
                        </telerik:RadComboBox>
                    </td>
                </tr>
                <tr>
                    <td><label for="txtTenCongViec">Công việc chuyên môn</label></td>
                    <td colspan="3">
                        <telerik:RadTextBox ID="txtTenCongViec" TabIndex="6" runat="server" Width="100%">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td><label for="cboDonVi">Đơn vị công tác</label></td>
                    <td colspan="3">
                        <telerik:RadComboBox ID="cboDonVi" TabIndex="7" runat="server" Width="100%" AutoPostBack="true" 
                            onselectedindexchanged="cboDonVi_SelectedIndexChanged" >
                        </telerik:RadComboBox>
                    </td>
                </tr>
                <tr>
                    <td><label for="txtDiaDiemLamViec">Địa điểm làm việc</label></td>
                    <td colspan="3">
                        <telerik:RadTextBox ID="txtDiaDiemLamViec" TabIndex="8" runat="server" Width="100%">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td valign="top"><label for="txtMoTa">Mô tả công việc</label></td>
                    <td colspan="3">
                        <telerik:RadTextBox ID="txtMoTa" runat="server" TabIndex="9" Width="100%" TextMode="MultiLine" Rows="4">
                        </telerik:RadTextBox>
                    </td>
                </tr>
            </table>

            <telerik:RadGrid ID="grdQTLamViec" Culture="vi-VN" AutoGenerateColumns="False"
                AllowPaging="True" AllowSorting="True" CellSpacing="0" GridLines="None" 
                runat="server" onitemcommand="grdQTLamViec_ItemCommand" 
                ondeletecommand="grdQTLamViec_DeleteCommand" 
                onneeddatasource="grdQTLamViec_NeedDataSource">
                <ClientSettings EnablePostBackOnRowClick="true" />
                <MasterTableView ShowHeadersWhenNoRecords="True" DataKeyNames="IDQuaTrinhLamViec">
                <NoRecordsTemplate>
                    <div><center><strong>Không có dữ liệu</strong></center></div>
                </NoRecordsTemplate>
                <RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
                <HeaderStyle Width="20px"></HeaderStyle>
                </RowIndicatorColumn>
                <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
                <HeaderStyle Width="20px"></HeaderStyle>
                </ExpandCollapseColumn>
                    <Columns>
                        <telerik:GridButtonColumn ConfirmText="Có chắc xóa không?" ConfirmDialogType="RadWindow"
                            ConfirmTitle="Xóa" CommandName="Delete" ConfirmDialogHeight="100px" ButtonType="ImageButton"
                            ConfirmDialogWidth="285px" FilterControlAltText="Filter columnXoa column" 
                            HeaderText="Xóa" Text="Xóa" UniqueName="columnXoa" />
                        <telerik:GridBoundColumn DataField="ThoiGianBatDau" 
                            FilterControlAltText="Filter column3 column" HeaderText="Từ ngày" 
                            UniqueName="column3" DataFormatString="{0:d/M/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ThoiGianKetThuc" 
                            FilterControlAltText="Filter column4 column" HeaderText="Đến ngày" 
                            UniqueName="column4" DataFormatString="{0:d/M/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ChucDanh" 
                            FilterControlAltText="Filter column column" HeaderText="Chức danh" 
                            UniqueName="column">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="NhomChucDanh" 
                            FilterControlAltText="Filter column1 column" HeaderText="Nhóm chức danh" 
                            UniqueName="column1">
                        </telerik:GridBoundColumn>
                        <telerik:GridNumericColumn DataField="MucLuong" DataFormatString="{0:###,###,###} ₫"
                            DecimalDigits="2" FilterControlAltText="Filter column11 column" 
                            HeaderText="Mức lương" UniqueName="column11">
                        </telerik:GridNumericColumn>
                        <telerik:GridBoundColumn DataField="TenViec" 
                            FilterControlAltText="Filter column2 column" HeaderText="Công việc" 
                            UniqueName="column2">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ToChuc" 
                            FilterControlAltText="Filter column5 column" HeaderText="Đơn vị công tác" 
                            UniqueName="column5">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DiaDiemLamViec" 
                            FilterControlAltText="Filter column5 column" HeaderText="Địa điểm" 
                            UniqueName="column5">
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
                <EditFormSettings>
                <EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
                </EditFormSettings>
                </MasterTableView>
                <FilterMenu EnableImageSprites="False"></FilterMenu>
            </telerik:RadGrid>
        </fieldset>
        </telerik:RadAjaxPanel>
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" />
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThemNghiPhep.aspx.cs" Inherits="Aits_Hrm.CV.ThemNghiPhep" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quản lý quá trình nghỉ</title>
    <link rel="stylesheet" href="../Styles/StyleSheet.css" type="text/css" />
    <style type="text/css">
        .multipleRowsColumns .rcbItem, .multipleRowsColumns .rcbHovered
        {float: left;margin: 0 1px;min-height: 13px;overflow: hidden;padding: 2px 19px 2px 6px;width: 125px;}
        .col1{text-align: left;}
        .col2{text-align: right;width:37px;}
        html.rfdButton a.rfdSkinnedButton{vertical-align: middle;margin: 0 0 0 5px;}
        label{display: inline-block;width: 150px;padding-right: 5px;}
        * html.rfdButton a.rfdSkinnedButton,
        * html.rfdButton input.rfdDecorated{vertical-align: top;}
        .rbl label{display:inline;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server" />
        <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
        <telerik:RadFormDecorator ID="FormDecorator1" runat="server" DecoratedControls="all" />
        <telerik:RadToolBar ID="RadToolBar1" Runat="server" EnableRoundedCorners="true" 
            EnableShadows="true" Width="100%" onbuttonclick="RadToolBar1_ButtonClick">
            <Items>
                <telerik:RadToolBarButton runat="server" Value="Save" Text="Lưu lại"></telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" CausesValidation="false" Value="Reset" Text="Nhập lại"></telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" Value="Report" Text="In"></telerik:RadToolBarButton>
            </Items>
        </telerik:RadToolBar>
        <fieldset>
            <legend style="font-weight:bold;">Quản lý nghỉ</legend>
            <table width="100%">
                <tr>
                    <td style="width:15%;"><label for="cboNhanVien">Họ và tên: </label></td>
                    <td style="width:40%;"><telerik:RadComboBox ID="cboNhanVien" runat="server" MarkFirstMatch="true" Width="80%" 
                            ShowDropDownOnTextboxClick="False" ShowToggleImage="False" AutoPostBack="True" />
                    </td>
                    <td style="width:15%;"><asp:Label ID="lbMaNV" AssociatedControlID="txtMaNV" runat="server" Text="Mã nhân viên: " /></td>
                    <td style="width:30%;"><asp:Label ID="txtMaNV" Font-Bold="true" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                </tr>
                <tr>
                    <td><asp:Label ID="NamSinh" AssociatedControlID="lbNamSinh" runat="server" Text="Năm sinh: " /></td>
                    <td><asp:Label ID="lbNamSinh" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                    <td><asp:Label ID="MaChucDanh" AssociatedControlID="lbMaChucDanh" runat="server" Text="Mã chức danh: " /></td>
                    <td><asp:Label ID="lbMaChucDanh" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                </tr>
                <tr>
                    <td><asp:Label ID="NgayBienChe" AssociatedControlID="lbNgayBienChe" runat="server" Text="Ngày biên chế: " /></td>
                    <td><asp:Label ID="lbNgayBienChe" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                    <td><asp:Label ID="NgayVaoHK" AssociatedControlID="lbNgayVaoHK" runat="server" Text="Ngày vào HK: " /></td>
                    <td><asp:Label ID="lbNgayVaoHK" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                </tr>
                <tr>
                    <td><asp:Label ID="DonVi" AssociatedControlID="lbDonVi" runat="server" Text="Đơn vị: " /></td>
                    <td colspan="3"><asp:Label ID="lbDonVi" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                </tr>
                <tr>
                    <td><label for="cboLoaiNghi">Hình thức nghỉ: </label></td>
                    <td colspan="3"><telerik:RadComboBox ID="cboLoaiNghi" Width="100%" runat="server" /></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lbTuNgay" AssociatedControlID="txtTuNgay" runat="server" Text="Từ ngày: " /></td>
                    <td>
                        <telerik:RadDatePicker ID="txtTuNgay" Width="80%"
                            Calendar-CultureInfo="vi-VN" Calendar-DayNameFormat="Short" runat="server" 
                            Culture="vi-VN" ShowPopupOnFocus="True" AutoPostBack="True" 
                            onselecteddatechanged="txtTuNgay_SelectedDateChanged" >
                            <Calendar DayNameFormat="Short" UseColumnHeadersAsSelectors="False" 
                                UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                            </Calendar>
                            <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" 
                                LabelWidth="40%">
                            </DateInput>
                            <DatePopupButton HoverImageUrl="" ImageUrl="" />
                        </telerik:RadDatePicker>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="None" Text="*"
                             ControlToValidate="txtTuNgay" SetFocusOnError="true" ErrorMessage="Chưa nhập ngày nghỉ">
                        </asp:RequiredFieldValidator>
                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" TargetControlID="RequiredFieldValidator1"
                            HighlightCssClass="highlight" PopupPosition="TopRight" runat="server">
                        </asp:ValidatorCalloutExtender>
                    </td>
                    <td><asp:Label ID="lbDenNgay" AssociatedControlID="txtDenNgay" runat="server" Text="Đến ngày: " /></td>
                    <td>
                        <telerik:RadDatePicker ID="txtDenNgay" Width="100%"
                            Calendar-CultureInfo="vi-VN" Calendar-DayNameFormat="Short" runat="server" 
                            Culture="vi-VN" ShowPopupOnFocus="True" AutoPostBack="True" 
                            onselecteddatechanged="txtDenNgay_SelectedDateChanged" >
                            <Calendar DayNameFormat="Short" UseColumnHeadersAsSelectors="False" 
                                UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                            </Calendar>
                            <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" 
                                LabelWidth="40%" AutoPostBack="True">
                            </DateInput>
                            <DatePopupButton HoverImageUrl="" ImageUrl="" />
                        </telerik:RadDatePicker>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="TongPhepNam" AssociatedControlID="lbTongPhepNam" runat="server" Text="Tổng ngày phép năm: " /></td>
                    <td><asp:Label ID="lbTongPhepNam" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                    <td><asp:Label ID="TongDaNghi" AssociatedControlID="lbTongDaNghi" runat="server" Text="Tổng ngày đã nghỉ: " /></td>
                    <td><asp:Label ID="lbTongDaNghi" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                </tr>
                <tr>
                    <td><asp:Label ID="SoNgayXinNghi" AssociatedControlID="lbSoNgayXinNghi" runat="server" Text="Số ngày xin nghỉ: " /></td>
                    <td>
                        <telerik:RadNumericTextBox ID="lbSoNgayXinNghi" Width="80%" runat="server" >
                            <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                        </telerik:RadNumericTextBox>
                    </td>
                    <%--<td><asp:Label ID="lbSoNgayXinNghi" CssClass="rfdAspLabel" runat="server" ForeColor="Red" Text="" /></td>--%>
                    <td><asp:Label ID="SoNgayConLai" AssociatedControlID="lbSoNgayConLai" runat="server" Text="Số ngày còn lại: " /></td>
                    <td><asp:Label ID="lbSoNgayConLai" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                </tr>
                <tr>
                    <td valign="top"><asp:Label ID="lbLyDo" AssociatedControlID="txtLyDo" runat="server" Text="Lý do nghỉ: " /></td>
                    <td colspan="3">
                        <telerik:RadTextBox ID="txtLyDo" TextMode="MultiLine" runat="server" Width="100%" Rows="4">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td><label for="cboNhanVienBanGiao">Bàn giao cho: </label></td>
                    <td><telerik:RadComboBox ID="cboNhanVienBanGiao" runat="server" Width="80%" MarkFirstMatch="true" >
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
                     <td><label for="radioDongY">Được nghỉ: </label></td>
                     <td>
                        <asp:RadioButtonList ID="radioDongY" Width="100%" RepeatDirection="Horizontal" 
                             CssClass="rbl" runat="server">
                            <asp:ListItem Text="Có" Value="True"></asp:ListItem>
                            <asp:ListItem Text="Không" Value="False"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
            <telerik:RadGrid ID="grvNghi" Culture="vi-VN" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" 
                GridLines="None" onitemcommand="grvNghi_ItemCommand" ondeletecommand="grvNghi_DeleteCommand" 
                onneeddatasource="grvNghi_NeedDataSource" 
                onitemdatabound="grvNghi_ItemDataBound">
                <ClientSettings EnablePostBackOnRowClick="true" />
                <MasterTableView ShowHeadersWhenNoRecords="True" DataKeyNames="IDNghiPhep">
                    <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>
                    <RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
                        <HeaderStyle Width="20px"></HeaderStyle>
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
                        <HeaderStyle Width="20px"></HeaderStyle>
                    </ExpandCollapseColumn>
                    <NoRecordsTemplate>
                        <div><center><strong>Không có dữ liệu</strong></center></div>
                    </NoRecordsTemplate>
                    <Columns>
                        <telerik:GridButtonColumn ConfirmText="Có chắc xóa không?" ConfirmDialogType="RadWindow"
                            ConfirmTitle="Xóa" CommandName="Delete" ConfirmDialogHeight="100px" ButtonType="ImageButton"
                            ConfirmDialogWidth="285px" FilterControlAltText="Filter columnXoa column" HeaderStyle-Width="30px"
                            HeaderText="Xóa" Text="Xóa" UniqueName="columnXoa" />
                        <telerik:GridBoundColumn DataField="TuNgay" DataFormatString="{0:dd/MM/yyyy}" 
                            FilterControlAltText="Filter column3 column" HeaderText="Từ ngày" 
                            HeaderStyle-Width="80px" UniqueName="column3">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DenNgay" DataFormatString="{0:dd/MM/yyyy}" 
                            FilterControlAltText="Filter column4 column" HeaderText="Đến ngày" 
                            HeaderStyle-Width="80px" UniqueName="column4">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SoNgayDaNghi" HeaderStyle-Width="80px"
                            FilterControlAltText="Filter SoNgayDaNghi column" HeaderText="Số ngày đã nghỉ" 
                            UniqueName="column1">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="LoaiNghi" HeaderStyle-Width="80px"
                            FilterControlAltText="Filter column1 column" HeaderText="Loại nghỉ" 
                            UniqueName="column1">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="LyDoNghi" HeaderStyle-Width="200px"
                            FilterControlAltText="Filter column2 column" HeaderText="Lý do nghỉ" 
                            UniqueName="column2">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="TenNVBanGiao" HeaderStyle-Width="80px"
                            FilterControlAltText="Filter column2 column" HeaderText="Nhân viên bàn giao" 
                            UniqueName="column6">
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn DataField="DuocNghi" HeaderStyle-Width="50px"
                            FilterControlAltText="Filter column5 column" HeaderText="Được nghỉ" 
                            UniqueName="column5">
                            <ItemTemplate>
                                <asp:Label ID="DuocNghiLabel" runat="server" Text='<%# Eval("DuocNghi") %>'></asp:Label>
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
                        <EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
                    </EditFormSettings>
                </MasterTableView>
                <FilterMenu EnableImageSprites="False">
                </FilterMenu>
            </telerik:RadGrid>
        </fieldset>
        </telerik:RadAjaxPanel>
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" />
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />
    </form>
</body>
</html>
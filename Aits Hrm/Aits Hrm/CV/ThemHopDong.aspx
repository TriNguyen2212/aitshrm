﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThemHopDong.aspx.cs" Inherits="Aits_Hrm.CV.ThemHopDong" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Thêm hợp đồng nhân viên</title>
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
            .col1{text-align: left;}
            .col2{text-align: right;width:37px;}
            label
            {
                display: inline-block;
                width: 150px;
                padding-right: 5px;
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

    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
        <script type="text/javascript">
            function keyPress(sender, args) {
                var text = sender.get_value() + args.get_keyCharacter();
                if (!text.match('^[0-9]+$'))
                    args.set_cancel(true);
            }

            function formatDollar(num) {
                var p = num.toFixed(2).split(".");
                return p[0].split("").reverse().reduce(function (acc, num, i, orig) {
                    return num + (i && !(i % 3) ? "," : "") + acc;
                }, "") + " ₫";
            }

            function CalLuong(obj) {
                var mucLuongBH = obj.value * document.getElementById("<%=txtHeSo.ClientID%>").innerHTML.split(',');
                document.getElementById("<%=txtMucLuongBHXH.ClientID%>").innerHTML = formatDollar(mucLuongBH);
            }
        </script>
    </telerik:RadScriptBlock>
    <asp:UpdatePanel runat="server">
    <ContentTemplate>
    <telerik:RadFormDecorator ID="FormDecorator1" runat="server" DecoratedControls="all" />
    
    <fieldset><telerik:RadToolBar ID="RadToolBar1" Runat="server" EnableRoundedCorners="true" 
        EnableShadows="true" Width="100%" onbuttonclick="RadToolBar1_ButtonClick">
        <Items>
            <telerik:RadToolBarButton runat="server" Value="Save" Text="Lưu lại"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Value="Reset" CausesValidation="false" Text="Nhập mới"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Value="Report" Text="In ấn"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Value="PhuLuc" Text="Thêm phụ lục"></telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
        <legend style="font-weight:bold;">Hợp đồng lao động</legend>
        
        <table width="100%">
            <tr>
                <td style="width:15%;"><label for="txtSoHD">Số hợp đồng: </label></td>
                <td style="width:35%;"><telerik:RadTextBox ID="txtSoHD" Width="80%" runat="server" TabIndex="1" /></td>
            </tr>
            <tr>
                <td><label for="cboNguoiDaiDien">Người sử dụng LĐ: </label></td>
                <td>
                    <telerik:RadComboBox ID="cboNguoiDaiDien" AutoPostBack="true" runat="server" Width="80%"
                        MarkFirstMatch="true" EnableLoadOnDemand="true" Height="300px"
                        onselectedindexchanged="cboNguoiDaiDien_SelectedIndexChanged" 
                        onitemsrequested="cbxNhanVien_ItemsRequested" TabIndex="2" 
                        CausesValidation="False" >
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
                <td style="width:15%;"><asp:Label ID="lbQuocTich" AssociatedControlID="txtQuocTich" runat="server" Text="Quốc tịch: " /></td>
                <td style="width:35%;"><asp:Label ID="txtQuocTich" CssClass="rfdAspLabel" runat="server" Text="" /></td>
            </tr>
            <tr>
                <td><asp:Label ID="lbChucDanhNguoiDaiDien" AssociatedControlID="txtChucDanhNguoiDaiDien" runat="server" Text="Chức vụ: " /></td>
                <td><asp:Label ID="txtChucDanhNguoiDaiDien" CssClass="rfdAspLabel" runat="server" Text="" /></td>
            </tr>
            <tr>
                <td><label for="cboDonViLamViec">Đại diện cho: </label></td>
                <td><telerik:RadComboBox ID="cboDonViLamViec" runat="server" AutoPostBack="true" 
                        Width="80%" onselectedindexchanged="cboDonViLamViec_SelectedIndexChanged" 
                        TabIndex="3" CausesValidation="False" />
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lbDiaChi" AssociatedControlID="txtDiaChi" runat="server" Text="Địa chỉ: " /></td>
                <td><asp:Label ID="txtDiaChi" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                <td><asp:Label ID="lbDienThoai" AssociatedControlID="txtDienThoai" runat="server" Text="Điện thoại: " /></td>
                <td><asp:Label ID="txtDienThoai" CssClass="rfdAspLabel" runat="server" Text="" /></td>
            </tr>
            <tr>
                <td><label for="cboNguoiLD">Người lao động: </label></td>
                <td><telerik:RadComboBox ID="cboNguoiLD" Width="80%" runat="server" MarkFirstMatch="true" CausesValidation="false"
                    ShowDropDownOnTextboxClick="False" ShowToggleImage="False" AutoPostBack="True" onitemsrequested="cbxNhanVien_ItemsRequested"
                    onselectedindexchanged="cboNguoiLD_SelectedIndexChanged" TabIndex="4" >
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
                    </telerik:RadComboBox></td>
                <td><asp:Label ID="lbQuocTichNguoiLD" AssociatedControlID="txtQuocTichNguoiLD" runat="server" Text="Quốc tịch: " /></td>
                <td><asp:Label ID="txtQuocTichNguoiLD" CssClass="rfdAspLabel" runat="server" Text="" /></td>
            </tr>
            <tr>
                <td><asp:Label ID="lbNgaySinh" AssociatedControlID="txtNgaySinh" runat="server" Text="Sinh ngày: " /></td>
                <td><asp:Label ID="txtNgaySinh" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                <td><asp:Label ID="lbNoiSinh" AssociatedControlID="txtNoiSinh" runat="server" Text="Nơi sinh: " /></td>
                <td><asp:Label ID="txtNoiSinh" CssClass="rfdAspLabel" runat="server" Text="" /></td>
            </tr>
            <tr>
                <td><label for="txtTrinhDoChuyenMon">Trình độ chuyên môn: </label></td>
                <td colspan="3">
                    <telerik:RadTextBox ID="txtTrinhDoChuyenMon" runat="server" Width="100%" 
                        TabIndex="5" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="None" Text="*"
                            ControlToValidate="txtTrinhDoChuyenMon" SetFocusOnError="true" ErrorMessage="Chưa nhập trình độ chuyên môn">
                    </asp:RequiredFieldValidator>
                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" TargetControlID="RequiredFieldValidator1"
                        HighlightCssClass="highlight" PopupPosition="BottomLeft" runat="server">
                    </asp:ValidatorCalloutExtender>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lbDiaChiThuongTru" AssociatedControlID="txtDiaChiThuongTru" runat="server" Text="Địa chi thường trú: " /></td>
                <td colspan="3"><asp:Label ID="txtDiaChiThuongTru" CssClass="rfdAspLabel" runat="server" Width="100%" Text="" /></td>
            </tr>
            <tr>
                <td><asp:Label ID="lbCMND" AssociatedControlID="txtCMND" runat="server" Text="Số CMND: " /></td>
                <td><asp:Label ID="txtCMND" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                <td><asp:Label ID="lbNgayCap" AssociatedControlID="txtNgayCap" runat="server" Text="Ngày cấp: " /></td>
                <td><asp:Label ID="txtNgayCap" CssClass="rfdAspLabel" runat="server" Text="" /></td>
            </tr>
            <tr>
                <td><asp:Label ID="lbNoiCap" AssociatedControlID="txtNoiCap" runat="server" Text="Nơi cấp: " /></td>
                <td colspan="3"><asp:Label ID="txtNoiCap" CssClass="rfdAspLabel" runat="server" Width="100%" Text="" /></td>
            </tr>
            <tr>
                <td><label for="cboLoaiHD">Loại hợp đồng</label></td>
                <td><telerik:RadComboBox ID="cboLoaiHD" runat="server" Width="80%" TabIndex="6" /></td>
                <td><label for="txtNgayKyHD">Ngày ký</label></td>
                <td>
                    <telerik:RadDatePicker ID="txtNgayKyHD" Width="100%" 
                        Calendar-CultureInfo="vi-VN" Calendar-DayNameFormat="Short" runat="server" 
                        Culture="en-US" ShowPopupOnFocus="True" TabIndex="7" >
                    <Calendar DayNameFormat="Short" UseColumnHeadersAsSelectors="False" 
                        UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                    </Calendar>
                    <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" 
                        LabelWidth="40%" TabIndex="7">
                    </DateInput>
                    <DatePopupButton HoverImageUrl="" ImageUrl="" TabIndex="7" />
                    </telerik:RadDatePicker>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="None" Text="*"
                            ControlToValidate="txtNgayKyHD" SetFocusOnError="true" ErrorMessage="Chưa nhập ngày ký HĐ">
                    </asp:RequiredFieldValidator>
                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" TargetControlID="RequiredFieldValidator2"
                        HighlightCssClass="highlight" PopupPosition="BottomLeft" runat="server">
                    </asp:ValidatorCalloutExtender>
                </td>
            </tr>
            <tr>
                <td><label for="txtTuNgayKyHD">Từ ngày: </label></td>
                <td><telerik:RadDatePicker ID="txtTuNgayKyHD" Calendar-CultureInfo="vi-VN" Width="80%"
                        Calendar-DayNameFormat="Short" runat="server" Culture="en-US" 
                        ShowPopupOnFocus="True" TabIndex="8" >
                    <Calendar DayNameFormat="Short" UseColumnHeadersAsSelectors="False" 
                        UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                    </Calendar>
                    <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" 
                        LabelWidth="40%" TabIndex="8">
                    </DateInput>
                    <DatePopupButton HoverImageUrl="" ImageUrl="" TabIndex="8" />
                    </telerik:RadDatePicker>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="None" Text="*"
                            ControlToValidate="txtNgayKyHD" SetFocusOnError="true" ErrorMessage="Chưa nhập ngày bắt đầu">
                    </asp:RequiredFieldValidator>
                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" TargetControlID="RequiredFieldValidator3"
                        HighlightCssClass="highlight" PopupPosition="Right" runat="server">
                    </asp:ValidatorCalloutExtender>
                </td>
                <td><label for="txtDenNgayKyHD">Đến ngày: </label></td>
                <td><telerik:RadDatePicker ID="txtDenNgayKyHD" Width="100%" 
                        Calendar-CultureInfo="vi-VN" Calendar-DayNameFormat="Short" runat="server" 
                        Culture="en-US" ShowPopupOnFocus="True" TabIndex="9" >
                    <Calendar DayNameFormat="Short" UseColumnHeadersAsSelectors="False" 
                        UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                    </Calendar>
                    <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" 
                        LabelWidth="40%" TabIndex="9">
                    </DateInput>
                    <DatePopupButton HoverImageUrl="" ImageUrl="" TabIndex="9" />
                    </telerik:RadDatePicker>
                </td>
            </tr>
            <tr>
                <td><label for="txtDiaDiemLamViec">Địa điểm làm việc: </label></td>
                <td colspan="3"><telerik:RadTextBox ID="txtDiaDiemLamViec" runat="server" 
                        Width="100%" TabIndex="10" /></td>
            </tr>
            <tr>
                <td><label for="cboChucDanhNghiepVu">Chức danh chuyên môn: </label></td>
                <td><telerik:RadComboBox ID="cboChucDanhNghiepVu" runat="server" Width="80%" 
                        TabIndex="11" /></td>
                <td><label for="cboChucDanhCongViec">Chức danh công việc: </label></td>
                <td>
                    <telerik:RadComboBox ID="cboChucDanhCongViec" AutoPostBack="true" Width="80%" runat="server" 
                        onselectedindexchanged="cboChucDanhCongViec_SelectedIndexChanged" 
                        TabIndex="12" />
                    <asp:Label ID="txtMaChucDanhCongViec" Width="18%" CssClass="rfdAspLabel" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td><label for="cboNgach">Ngạch: </label></td>
                <td><telerik:RadComboBox ID="cboNgach" Width="80%" runat="server" AutoPostBack="true"
                        onselectedindexchanged="cboNgach_SelectedIndexChanged" TabIndex="13" /></td>
                <td><label for="cboBac">Bậc: </label></td>
                <td><telerik:RadComboBox ID="cboBac" AutoPostBack="true" Width="100%" 
                        runat="server" onselectedindexchanged="cboBac_SelectedIndexChanged" 
                        TabIndex="14"/></td>
            </tr>
            <tr>
                <td><label for="txtMucHuong">Mức hưởng lương: </label></td>
                <td>
                    <telerik:RadTextBox ID="txtMucHuong" Width="60px" MaxLength="3" runat="server" 
                        TabIndex="15" >
                    </telerik:RadTextBox> %
                </td>
                <td><asp:Label ID="lbHeSo" AssociatedControlID="txtHeSo" runat="server" Text="Hệ số: " /></td>
                <td><asp:Label ID="txtHeSo" CssClass="rfdAspLabel" runat="server" Text="" /></td>
            </tr>
            <tr>
                <td><label for="txtMucLuongToiThieu">Mức lương tối thiểu: </label></td>
                <td><telerik:RadNumericTextBox ID="txtMucLuongToiThieu" Width="80%" runat="server" 
                        Culture="vi-VN" Type="Currency" TabIndex="16" >
                    <NumberFormat DecimalDigits="0" DecimalSeparator="." GroupSeparator="," 
                        ZeroPattern="n ₫" />
                    </telerik:RadNumericTextBox>
                </td>
                <td><asp:Label ID="lbMucLuongBH" AssociatedControlID="txtMucLuongBHXH" runat="server" Text="Mức lương BHXH: " /></td>
                <td><asp:Label ID="txtMucLuongBHXH" CssClass="rfdAspLabel" runat="server" Text="" /></td>
            </tr>
            <tr>
                <td><label for="txtPhuCapCV">Phụ cấp chức vụ: </label></td>
                <td><telerik:RadNumericTextBox ID="txtPhuCapCV" Width="80%" runat="server" 
                        Culture="vi-VN" Type="Currency" TabIndex="17" >
                    <NumberFormat DecimalDigits="0" DecimalSeparator="." GroupSeparator="," 
                        ZeroPattern="n ₫" />
                    </telerik:RadNumericTextBox>
                </td>
            </tr>
            <tr>
                <td><label for="txtTepDinhKem">Tệp đính kèm: </label></td>
                <td colspan="3">
                    <asp:LinkButton ID="btnDownload" runat="server" CssClass="rfdAspLabel" OnClick="btnDownload_OnClick" />
                    <telerik:RadAsyncUpload ID="txtTepDinhKem" MultipleFileSelection="Disabled" 
                        MaxFileInputsCount="1" runat="server" 
                        TargetFolder="../FileUploaded" ToolTip="Chọn tệp cần tải lên" 
                        onfileuploaded="txtTepDinhKem_FileUploaded">
                        <Localization Cancel="Hủy" Remove="Xóa" Select="Chọn" />
                    </telerik:RadAsyncUpload>
                </td>
            </tr>
            <tr>
                <td valign="top"><label for="txtGhiChu">Ghi chú</label></td>
                <td colspan="3">
                    <telerik:RadTextBox ID="txtGhiChu" TextMode="MultiLine" runat="server" 
                        Width="100%" Rows="4" TabIndex="19">
                    </telerik:RadTextBox>
                </td>
            </tr>
        </table>

        <telerik:RadGrid ID="grvHopDong" runat="server" AllowPaging="True" Culture="vi-VN" 
            AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" 
            GridLines="None" ondeletecommand="grvHopDong_DeleteCommand" 
            onitemcommand="grvHopDong_ItemCommand" 
            onneeddatasource="grvHopDong_NeedDataSource">
            <ClientSettings EnablePostBackOnRowClick="true" />
            <MasterTableView ShowHeadersWhenNoRecords="True" DataKeyNames="IDHopDongLD">
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
                    <telerik:GridButtonColumn ConfirmText="Có chắc xóa không?" ConfirmDialogType="RadWindow"
                        ConfirmTitle="Xóa" CommandName="Delete" ConfirmDialogHeight="100px" ButtonType="ImageButton"
                        ConfirmDialogWidth="285px" FilterControlAltText="Filter columnXoa column" 
                        HeaderText="Xóa" Text="Xóa" UniqueName="columnXoa" />
                    <telerik:GridBoundColumn DataField="SoHD" HeaderStyle-Width="40px"
                        FilterControlAltText="Filter column column" HeaderText="Số HĐ" 
                        UniqueName="column">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="LoaiHD" 
                        FilterControlAltText="Filter column1 column" HeaderText="Loại HĐ" 
                        UniqueName="column1">
                    </telerik:GridBoundColumn>
                    <telerik:GridDateTimeColumn DataField="NgayKyHD" 
                        DataFormatString="{0:dd/MM/yyyy}" FilterControlAltText="Filter column2 column" 
                        HeaderText="Ngày ký" UniqueName="column2">
                    </telerik:GridDateTimeColumn>
                    <telerik:GridDateTimeColumn DataField="TuNgay" 
                        DataFormatString="{0:dd/MM/yyyy}" FilterControlAltText="Filter column3 column" 
                        HeaderText="Từ ngày" UniqueName="column3">
                    </telerik:GridDateTimeColumn>
                    <telerik:GridDateTimeColumn DataField="DenNgay" 
                        DataFormatString="{0:dd/MM/yyyy}" FilterControlAltText="Filter column4 column" 
                        HeaderText="Đến ngày" UniqueName="column4">
                    </telerik:GridDateTimeColumn>
                    <telerik:GridBoundColumn DataField="NguoiDaiDien" 
                        FilterControlAltText="Filter column6 column" HeaderText="Người sử dụng LĐ" 
                        UniqueName="column6">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="NguoiLaoDong" 
                        FilterControlAltText="Filter column5 column" HeaderText="Người LĐ" 
                        UniqueName="column5">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ChucDanh" 
                        FilterControlAltText="Filter column7 column" HeaderText="Chức danh chuyên môn" 
                        UniqueName="column7">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MaNgach" 
                        FilterControlAltText="Filter column7 column" HeaderText="Mã ngạch" 
                        UniqueName="column7">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Bac" 
                        FilterControlAltText="Filter column7 column" HeaderText="Bậc" 
                        UniqueName="column7">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="TrinhDoChuyenMon" 
                        FilterControlAltText="Filter column8 column" HeaderText="Trình độ" 
                        UniqueName="column8">
                    </telerik:GridBoundColumn>                    
                    <telerik:GridNumericColumn DataField="MucHuong" DataFormatString="{0:#.#} %" 
                        DecimalDigits="2" FilterControlAltText="Filter column11 column" 
                        HeaderText="Mức hưởng" UniqueName="column11">
                    </telerik:GridNumericColumn>
                    <telerik:GridNumericColumn DataField="MucLuongToiThieu" DecimalDigits="0" DataFormatString="{0:###,###,###} ₫"
                        FilterControlAltText="Filter column12 column" HeaderText="Mức lương tối thiểu" 
                        UniqueName="column12">
                    </telerik:GridNumericColumn>
                    <telerik:GridNumericColumn DataField="PhuCapCV" DecimalDigits="0" DataFormatString="{0:###,###,###} ₫"
                        FilterControlAltText="Filter column13 column" HeaderText="Phụ cấp công việc" 
                        UniqueName="column13">
                    </telerik:GridNumericColumn>
                    <telerik:GridBoundColumn DataField="NguoiTao" ReadOnly="True" UniqueName="NguoiTao"
                        FilterControlAltText="Filter NguoiTao column" HeaderText="Người tạo" >
                    </telerik:GridBoundColumn>
                    <telerik:GridDateTimeColumn DataField="NgayTao" 
                        DataFormatString="{0:dd/MM/yyyy H:mm}" ReadOnly="True" UniqueName="NgayTao"
                        FilterControlAltText="Filter NgayTao column" HeaderText="Ngày tạo" >
                    </telerik:GridDateTimeColumn>
                    <telerik:GridBoundColumn DataField="NguoiCapNhat" ReadOnly="True" UniqueName="NguoiCapNhat"
                        FilterControlAltText="Filter NguoiCapNhat column" HeaderText="Người sửa" >
                    </telerik:GridBoundColumn>
                    <telerik:GridDateTimeColumn DataField="NgayCapNhat" 
                        DataFormatString="{0:dd/MM/yyyy H:mm}" ReadOnly="True" UniqueName="NgayCapNhat"
                        FilterControlAltText="Filter NgayCapNhat column" HeaderText="Ngày sửa" >
                    </telerik:GridDateTimeColumn>
                </Columns>
                <EditFormSettings>
                    <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                    </EditColumn>
                </EditFormSettings>
            </MasterTableView>
            <FilterMenu EnableImageSprites="False">
            </FilterMenu>
        </telerik:RadGrid>
    </fieldset>
    </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnDownload" runat="Server" />
        </Triggers>
    </asp:UpdatePanel>
    <telerik:RadWindowManager ID="RadWindowManager1" runat="server" />
    </form>
</body>
</html>

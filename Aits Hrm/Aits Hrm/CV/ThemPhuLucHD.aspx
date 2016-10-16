<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThemPhuLucHD.aspx.cs" Inherits="Aits_Hrm.CV.ThemPhuLucHD" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Thêm phụ lục hợp đồng</title>
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
     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <telerik:RadFormDecorator ID="FormDecorator1" runat="server" DecoratedControls="all" />
        <telerik:RadToolBar ID="RadToolBar1" Runat="server" EnableRoundedCorners="true" 
            EnableShadows="true" Width="100%" onbuttonclick="RadToolBar1_ButtonClick">
            <Items>
                <telerik:RadToolBarButton runat="server" Value="Save" Text="Lưu lại"></telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" Value="Reset" Text="Nhập lại"></telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" Value="Print" Text="In ấn"></telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" Value="HopDong" CausesValidation="false" Text="Hợp đồng"></telerik:RadToolBarButton>
            </Items>
        </telerik:RadToolBar>
        <fieldset>
            <legend style="font-weight:bold;">Thông tin phụ lục hợp đồng</legend>
            <table width="100%">
                <tr>
                    <td style="width:15%;"><label for="txtSoPhuLuc">Số phụ lục</label></td>
                    <td style="width:40%;">
                        <telerik:RadTextBox Width="80%" ID="txtSoPhuLuc" TabIndex="1" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="None" Text="*"
                             ControlToValidate="txtSoPhuLuc" SetFocusOnError="true" ErrorMessage="Chưa nhập số phụ lục">
                        </asp:RequiredFieldValidator>
                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" TargetControlID="RequiredFieldValidator4"
                            HighlightCssClass="highlight" PopupPosition="Right" runat="server">
                        </asp:ValidatorCalloutExtender>
                    </td>
                    <td style="width:15%;"><asp:Label ID="lbSoHD" AssociatedControlID="txtSoHD" runat="server" Text="Số hợp đồng " /></td>
                    <td style="width:30%;"><asp:Label ID="txtSoHD" CssClass="rfdAspLabel" Font-Bold="true" runat="server" Text="" /></td>
                </tr>
                <tr>
                    <td><label for="txtTenPhuLuc">Tên phụ lục</label></td>
                    <td>
                        <telerik:RadTextBox ID="txtTenPhuLuc" runat="server" Width="80%" TabIndex="2" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="None" Text="*"
                             ControlToValidate="txtTenPhuLuc" SetFocusOnError="true" ErrorMessage="Chưa nhập tên phụ lục">
                        </asp:RequiredFieldValidator>
                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" TargetControlID="RequiredFieldValidator2"
                            HighlightCssClass="highlight" PopupPosition="Right" runat="server">
                        </asp:ValidatorCalloutExtender>
                    </td>
                    <td><label for="txtNgayKy">Ngày ký</label></td>
                    <td align="right">
                        <telerik:RadDatePicker ID="txtNgayKy" Width="100%" TabIndex="3"
                            Calendar-CultureInfo="vi-VN" Calendar-DayNameFormat="Short" runat="server" 
                            Culture="vi-VN" ShowPopupOnFocus="True" >
                        <Calendar DayNameFormat="Short" UseColumnHeadersAsSelectors="False" 
                            UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                        </Calendar>
                        <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" 
                            LabelWidth="40%" TabIndex="3">
                        </DateInput>
                        <DatePopupButton HoverImageUrl="" ImageUrl="" TabIndex="3" />
                        </telerik:RadDatePicker>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="None" Text="*"
                             ControlToValidate="txtNgayKy" SetFocusOnError="true" ErrorMessage="Chưa nhập ngày ký">
                        </asp:RequiredFieldValidator>
                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" TargetControlID="RequiredFieldValidator1"
                            HighlightCssClass="highlight" PopupPosition="Right" runat="server">
                        </asp:ValidatorCalloutExtender>
                    </td>
                </tr>
                <tr>
                    <td><label for="cboNguoiDaiDien">Người đại diện: </label></td>
                    <td>
                        <telerik:RadComboBox ID="cboNguoiDaiDien" AutoPostBack="true" runat="server" Width="80%" CausesValidation="false"
                            MarkFirstMatch="true" Height="300px" onselectedindexchanged="cboNguoiDaiDien_SelectedIndexChanged" TabIndex="4" >
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
                    <td><asp:Label ID="lbChucDanhNguoiDaiDien" AssociatedControlID="txtChucDanhNguoiDaiDien" runat="server" Text="Chức vụ: " /></td>
                    <td><asp:Label ID="txtChucDanhNguoiDaiDien" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                </tr>
                <tr>
                    <td><label for="txtDonViLamViec">Đại diện cho: </label></td>
                    <td><asp:Label ID="txtDonViLamViec" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                    <td><label for="txtNgayUyQuyen">TGĐ ủy quyền ngày:</label></td>
                    <td>
                        <telerik:RadDatePicker ID="txtNgayUyQuyen" Width="100%" TabIndex="5"
                            Calendar-CultureInfo="vi-VN" Calendar-DayNameFormat="Short" runat="server" 
                            Culture="vi-VN" ShowPopupOnFocus="True" >
                            <Calendar DayNameFormat="Short" UseColumnHeadersAsSelectors="False" 
                                UseRowHeadersAsSelectors="False" ViewSelectorText="x" />
                            <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" 
                                LabelWidth="40%" TabIndex="5" />
                        <DatePopupButton HoverImageUrl="" ImageUrl="" TabIndex="5" />
                        </telerik:RadDatePicker>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="lbDiaChi" AssociatedControlID="txtDiaChi" runat="server" Text="Địa chỉ: " /></td>
                    <td><asp:Label ID="txtDiaChi" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                    <td><asp:Label ID="lbDienThoai" AssociatedControlID="txtDienThoai" runat="server" Text="Điện thoại: " /></td>
                    <td><asp:Label ID="txtDienThoai" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                </tr>
                <tr>
                    <td><label for="txtNguoiLD">Người lao động: </label></td>
                    <td><asp:Label ID="txtNguoiLD" CssClass="rfdAspLabel" runat="server" Text="" /></td>
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
                    <td><asp:Label ID="txtTrinhDoChuyenMon" CssClass="rfdAspLabel" runat="server" Text="" /></td>
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
                    <td valign="top"><label for="txtTepDinhKem">Tệp đính kèm: </label></td>
                    <td>
                        <asp:LinkButton ID="btnDownload" runat="server" TabIndex="5" CssClass="rfdAspLabel" OnClick="btnDownload_OnClick"></asp:LinkButton>
                        <telerik:RadAsyncUpload ID="txtTepDinhKem" MultipleFileSelection="Disabled" TargetFolder="../FileUploaded"
                            MaxFileInputsCount="1" runat="server" ToolTip="Chọn tệp cần tải lên" TabIndex="6"
                            onfileuploaded="txtTepDinhKem_FileUploaded">
                            <Localization Cancel="Hủy" Remove="Xóa" Select="Chọn" />
                        </telerik:RadAsyncUpload>
                    </td>
                </tr>
            </table>

            <telerik:RadGrid ID="grvPhuLuc" runat="server" AllowPaging="True" Culture="vi-VN" 
                AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" 
                GridLines="None" ondeletecommand="grvPhuLuc_DeleteCommand" 
                onitemcommand="grvPhuLuc_ItemCommand" 
                onneeddatasource="grvPhuLuc_NeedDataSource">
                <ClientSettings EnablePostBackOnRowClick="true" />
                <MasterTableView ShowHeadersWhenNoRecords="True" DataKeyNames="IDPhuLucHD">
                    <CommandItemSettings ExportToPdfText="Export to PDF" />
                    <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" Visible="True">
                        <HeaderStyle Width="20px" />
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" 
                        Visible="True">
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
                        <telerik:GridBoundColumn DataField="SoPhuLuc" 
                            FilterControlAltText="Filter column column" HeaderText="Số phụ lục" 
                            UniqueName="column">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="TenPhuLuc" 
                            FilterControlAltText="Filter column1 column" HeaderText="Tên phụ lục" 
                            UniqueName="column1">
                        </telerik:GridBoundColumn>
                        <telerik:GridDateTimeColumn DataField="NgayKy" 
                            DataFormatString="{0:dd/MM/yyyy}" FilterControlAltText="Filter column2 column" 
                            HeaderText="Ngày ký" UniqueName="column2">
                        </telerik:GridDateTimeColumn>
                        <telerik:GridDateTimeColumn DataField="NgayHieuLuc" 
                            DataFormatString="{0:dd/MM/yyyy}" FilterControlAltText="Filter column3 column" 
                            HeaderText="Ngày ủy quyền" UniqueName="column3">
                        </telerik:GridDateTimeColumn>
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

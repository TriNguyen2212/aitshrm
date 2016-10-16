<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SuaHopDong.aspx.cs" Inherits="Aits_Hrm.CV.SuaHopDong" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Sửa hợp đồng nhân viên</title>
    <link rel="stylesheet" href="../Styles/StyleSheet.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
     <telerik:RadWindowManager ID="Singleton" runat="server">
            <Windows>
                <telerik:RadWindow ID="DialogWindow" ReloadOnShow="true"
                    BackColor="Gray" Modal="true" runat="server" 
                     Width="1062px" Height="586px"
                    Behavior="Close, Maximize, Move, Reload" 
                    Behaviors="Close, Maximize, Move, Reload" >
                </telerik:RadWindow>
                  <telerik:RadWindow ID="RadWindow1" ReloadOnShow="true"
                    BackColor="Gray" Modal="true" runat="server" 
                     Width="1062px" Height="586px" 
                    Behavior="Close, Maximize, Move, Reload" 
                    Behaviors="Close, Maximize, Move, Reload" >
                </telerik:RadWindow>
            </Windows>
        </telerik:RadWindowManager>
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server"/>    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <telerik:RadFormDecorator ID="FormDecorator1" runat="server" DecoratedControls="all" />
            <telerik:RadToolBar ID="RadToolBar1" Runat="server" EnableRoundedCorners="true" 
                EnableShadows="true" Width="100%" onbuttonclick="RadToolBar1_ButtonClick">
                <Items>
                    <telerik:RadToolBarButton runat="server" Value="Save" Text="Lưu lại"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Value="Reset" Text="Nhập lại"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Value="Report" Text="In ấn"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Value="PhuLuc" Text="Thêm phụ lục"></telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            <fieldset>
                <legend style="font-weight:bold;">Hợp đồng lao động</legend>
                <table width="100%">
                    <tr>
                        <td style="width:15%;"><label for="txtSoHD">Số hợp đồng: </label></td>
                        <td style="width:35%;"><telerik:RadTextBox ID="txtSoHD" Width="80%" runat="server" /></td>
                    </tr>
                    <tr>
                        <td><label for="cboNguoiDaiDien">Người sử dụng LĐ: </label></td>
                        <td>
                    <telerik:RadComboBox ID="cboNguoiDaiDien" AutoPostBack="true" runat="server" Width="80%"
                     MarkFirstMatch="true" EnableLoadOnDemand="true" Height="300px"
                        onselectedindexchanged="cboNguoiDaiDien_SelectedIndexChanged" onitemsrequested="cbxNhanVien_ItemsRequested" >
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
                                Width="80%" onselectedindexchanged="cboDonViLamViec_SelectedIndexChanged" />
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
                        <td><telerik:RadComboBox ID="cboNguoiLD" Width="80%" runat="server" MarkFirstMatch="true" 
                    ShowDropDownOnTextboxClick="False" ShowToggleImage="False" AutoPostBack="True" onitemsrequested="cbxNhanVien_ItemsRequested"
                    onselectedindexchanged="cboNguoiLD_SelectedIndexChanged" >
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
                        <td colspan="3"><telerik:RadTextBox ID="txtTrinhDoChuyenMon" runat="server" Width="100%" /></td>
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
                        <td><telerik:RadComboBox ID="cboLoaiHD" runat="server" Width="80%" /></td>
                        <td><label for="txtNgayKyHD">Ngày ký</label></td>
                        <td>
                            <telerik:RadDatePicker ID="txtNgayKyHD" Width="100%" 
                                Calendar-CultureInfo="vi-VN" Calendar-DayNameFormat="Short" runat="server" 
                                Culture="en-US" ShowPopupOnFocus="True" >
                            <Calendar DayNameFormat="Short" UseColumnHeadersAsSelectors="False" 
                                UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                            </Calendar>
                            <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" 
                                LabelWidth="40%">
                            </DateInput>
                            <DatePopupButton HoverImageUrl="" ImageUrl="" />
                            </telerik:RadDatePicker>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="txtTuNgayKyHD">Từ ngày: </label></td>
                        <td><telerik:RadDatePicker ID="txtTuNgayKyHD" Calendar-CultureInfo="vi-VN" Width="80%"
                                Calendar-DayNameFormat="Short" runat="server" Culture="en-US" 
                                ShowPopupOnFocus="True" >
                            <Calendar DayNameFormat="Short" UseColumnHeadersAsSelectors="False" 
                                UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                            </Calendar>
                            <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" 
                                LabelWidth="40%">
                            </DateInput>
                            <DatePopupButton HoverImageUrl="" ImageUrl="" />
                            </telerik:RadDatePicker>
                        </td>
                        <td><label for="txtDenNgayKyHD">Đến ngày: </label></td>
                        <td><telerik:RadDatePicker ID="txtDenNgayKyHD" Width="100%" 
                                Calendar-CultureInfo="vi-VN" Calendar-DayNameFormat="Short" runat="server" 
                                Culture="en-US" ShowPopupOnFocus="True" >
                            <Calendar DayNameFormat="Short" UseColumnHeadersAsSelectors="False" 
                                UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                            </Calendar>
                            <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" 
                                LabelWidth="40%">
                            </DateInput>
                            <DatePopupButton HoverImageUrl="" ImageUrl="" />
                            </telerik:RadDatePicker>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="txtDiaDiemLamViec">Địa điểm làm việc: </label></td>
                        <td colspan="3"><telerik:RadTextBox ID="txtDiaDiemLamViec" runat="server" Width="100%" /></td>
                    </tr>
                    <tr>
                        <td><label for="cboChucDanhNghiepVu">Chức danh chuyên môn: </label></td>
                        <td><telerik:RadComboBox ID="cboChucDanhNghiepVu" runat="server" Width="80%" /></td>
                        <td><label for="cboChucDanhCongViec">Chức danh công việc: </label></td>
                        <td>
                            <telerik:RadComboBox ID="cboChucDanhCongViec" AutoPostBack="true" Width="80%" runat="server" 
                                onselectedindexchanged="cboChucDanhCongViec_SelectedIndexChanged" />
                            <asp:Label ID="txtMaChucDanhCongViec" Width="18%" CssClass="rfdAspLabel" runat="server" Text="" />
                        </td>
                    </tr>
                    <tr>
                        <td><label for="cboNgach">Ngạch: </label></td>
                        <td><telerik:RadComboBox ID="cboNgach" Width="80%" runat="server" AutoPostBack="true"
                                onselectedindexchanged="cboNgach_SelectedIndexChanged" /></td>
                        <td><label for="cboBac">Bậc: </label></td>
                        <td><telerik:RadComboBox ID="cboBac" AutoPostBack="true" Width="100%" 
                                runat="server" onselectedindexchanged="cboBac_SelectedIndexChanged"/></td>
                    </tr>
                    <tr>
                        <td><label for="txtMucHuong">Mức hưởng lương: </label></td>
                        <td>
                            <telerik:RadTextBox ID="txtMucHuong" Width="60px" MaxLength="3" runat="server" >
                                <ClientEvents OnKeyPress="keyPress"/>
                            </telerik:RadTextBox> %
                        </td>
                        <td><asp:Label ID="lbHeSo" AssociatedControlID="txtHeSo" runat="server" Text="Hệ số: " /></td>
                        <td><asp:Label ID="txtHeSo" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                    </tr>
                    <tr>
                        <td><label for="txtMucLuongToiThieu">Mức lương tối thiểu: </label></td>
                        <td><telerik:RadNumericTextBox ID="txtMucLuongToiThieu" Width="80%" runat="server" 
                                Culture="vi-VN" Type="Currency" >
                                <NumberFormat DecimalDigits="0" ZeroPattern="n ₫" DecimalSeparator="." 
                                    GroupSeparator="," />
                            </telerik:RadNumericTextBox>
                        </td>
                        <td><asp:Label ID="lbMucLuongBH" AssociatedControlID="txtMucLuongBHXH" runat="server" Text="Mức lương BHXH: " /></td>
                        <td><asp:Label ID="txtMucLuongBHXH" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                    </tr>
                    <tr>
                        <td><label for="txtPhuCapCV">Phụ cấp chức vụ: </label></td>
                        <td><telerik:RadNumericTextBox ID="txtPhuCapCV" Width="80%" runat="server" 
                                Culture="vi-VN" Type="Currency" >
                            <NumberFormat DecimalDigits="0" ZeroPattern="n ₫" DecimalSeparator="." 
                                GroupSeparator="," />
                            </telerik:RadNumericTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="txtTepDinhKem">Tệp đính kèm: </label></td>
                        <td colspan="3">
                            <asp:LinkButton ID="btnDownload" runat="server" CssClass="rfdAspLabel" OnClick="btnDownload_OnClick" />
                            <telerik:RadAsyncUpload ID="txtTepDinhKem" MultipleFileSelection="Disabled" MaxFileInputsCount="1" runat="server" 
                                TargetFolder="../FileUploaded" ToolTip="Chọn tệp cần tải lên" onfileuploaded="txtTepDinhKem_FileUploaded">
                                <Localization Cancel="Hủy" Remove="Xóa" Select="Chọn" />
                            </telerik:RadAsyncUpload>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top"><label for="txtGhiChu">Ghi chú</label></td>
                        <td colspan="3">
                            <telerik:RadTextBox ID="txtGhiChu" TextMode="MultiLine" runat="server" Width="100%" Rows="4">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <asp:Label ID="lbLog" CssClass="rfdAspLabel" runat="server" Text="" />
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnDownload" runat="Server" />
        </Triggers>
    </asp:UpdatePanel>    
    </form>
    
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
</body>
</html>

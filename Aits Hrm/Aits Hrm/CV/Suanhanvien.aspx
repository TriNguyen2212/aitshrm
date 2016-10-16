<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Suanhanvien.aspx.cs" Inherits="Aits_Hrm.CV.Suanhanvien" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Thông tin nhân viên</title>
    <style type="text/css">
        .invalid{color:Red;}
        .binary-image{margin-bottom:5px;}
    </style>
    <script type="text/javascript">
        function keyPress(sender, args) {
            var text = sender.get_value() + args.get_keyCharacter();
            if (!text.match('^[0-9]+$'))
                args.set_cancel(true);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <telerik:RadWindowManager ID="RadWindowManager1" runat="server">
    </telerik:RadWindowManager>
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server" />
        <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
            <script type="text/javascript">
                function fileUploaded(sender, args) {
                    $find('RadAjaxManager1').ajaxRequest();
                    $telerik.$(".invalid").html("");
                    setTimeout(function () {
                        sender.deleteFileInputAt(0);
                    }, 10);
                }

                function validationFailed(sender, args) {
                    $telerik.$(".invalid")
                    .html("File ảnh không hợp lệ");
                    sender.deleteFileInputAt(0);
                    $find('RadAjaxManager1').ajaxRequest('a');
                }
            </script>
        </telerik:RadCodeBlock>
        <telerik:RadAjaxManager runat="server" ID="RadAjaxManager1" onajaxrequest="RadAjaxManager1_AjaxRequest">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="AnhNV" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <telerik:RadFormDecorator ID="FormDecorator1" runat="server" DecoratedControls="all" />
        <telerik:RadToolBar ID="RadToolBar1" Runat="server" EnableRoundedCorners="true" 
            EnableShadows="true" Width="100%" onbuttonclick="RadToolBar1_ButtonClick1">
            <Items>
                <telerik:RadToolBarButton runat="server" Value="Save" Text="Lưu lại"></telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" CausesValidation="false" Value="Reset" Text="Nhập lại"></telerik:RadToolBarButton>
            </Items>
        </telerik:RadToolBar>
        <table width="100%">
            <tr>
                <td rowspan="5">
                    <telerik:RadBinaryImage ID="AnhNV" runat="server" AlternateText="Ảnh cá nhân"
                        ImageUrl="../Images/Staff.png" ResizeMode="Fill" Height="120px" ImageAlign="Middle" Width="90px" />
                    <span class="invalid"></span>
                </td>
            </tr>
            <tr>
                <td style="width:10%"><label for="txtMaNV">Mã nhân viên</label></td>
                <td style="width:20%">
                    <telerik:RadTextBox Width="80%" ID="txtMaNV" runat="server" TabIndex="1" >
                        <ClientEvents OnKeyPress="keyPress"/>
                    </telerik:RadTextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="None"
                         ControlToValidate="txtMaNV" Text="*" ErrorMessage="Chưa nhập mã nhân viên" SetFocusOnError="true">
                    </asp:RequiredFieldValidator>
                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" TargetControlID="RequiredFieldValidator1"
                         HighlightCssClass="highlight" PopupPosition="Right" runat="server">
                    </asp:ValidatorCalloutExtender>
                </td>
                <td style="width:10%"><label for="txtTenNV">Tên nhân viên</label></td>
                <td style="width:20%">
                    <telerik:RadTextBox Width="80%" ID="txtTenNV" runat="server" TabIndex="2" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="None"
                         ControlToValidate="txtTenNV" Text="*" ErrorMessage="Chưa nhập tên nhân viên" SetFocusOnError="true">
                    </asp:RequiredFieldValidator>
                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" TargetControlID="RequiredFieldValidator2"
                         HighlightCssClass="highlight" PopupPosition="Right" runat="server">
                    </asp:ValidatorCalloutExtender>
                </td>
                <td style="width:10%"><label for="cboGioiTinh">Giới tính</label></td>
                <td style="width:20%" align="right" >
                    <telerik:RadComboBox ID="cboGioiTinh" Width="80%" runat="server" TabIndex="3" >
                        <Items>
                            <telerik:RadComboBoxItem runat="server" Text="Nam" Value="True" />
                            <telerik:RadComboBoxItem runat="server" Text="Nữ" Value="False" />
                        </Items>
                    </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
                <td><label for="txtNgaySinh">Ngày sinh</label></td>
                <td>
                    <telerik:RadDatePicker ID="txtNgaySinh" runat="server" Culture="vi-VN" 
                        ShowPopupOnFocus="True" Width="80%" TabIndex="4" FocusedDate="2012-06-30" 
                        MinDate="1930-01-01">
                        <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x" 
                            DayNameFormat="Short"></Calendar>
                        <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" 
                            LabelWidth="40%"></DateInput>
                        <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                    </telerik:RadDatePicker>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="None"
                         ControlToValidate="txtNgaySinh" Text="*" ErrorMessage="Chưa nhập ngày sinh" SetFocusOnError="true">
                    </asp:RequiredFieldValidator>
                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" TargetControlID="RequiredFieldValidator3"
                         HighlightCssClass="highlight" PopupPosition="Right" runat="server">
                    </asp:ValidatorCalloutExtender>
                </td>
                <td><label for="txtNoiSinh">Nơi sinh</label></td>
                <td colspan="3">
                    <telerik:RadTextBox ID="txtNoiSinh" runat="server" Width="100%" TabIndex="5" >
                    </telerik:RadTextBox>
                </td>
            </tr>
            <tr>
                <td><label for="txtNguyenQuan">Nguyên quán</label></td>
                <td><telerik:RadTextBox ID="txtNguyenQuan" TabIndex="6" runat="server" Width="80%" /></td>
                <td><label for="txtNgayBienChe">Ngày biên chế</label></td>
                <td>
                    <telerik:RadDatePicker ID="txtNgayBienChe" runat="server" TabIndex="7" Culture="vi-VN" 
                        ShowPopupOnFocus="True" Width="80%">
                        <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x" 
                            DayNameFormat="Short"></Calendar>
                        <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" 
                            LabelWidth="40%"></DateInput>
                        <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                    </telerik:RadDatePicker>
                </td>
                <td><label for="txtNgayVaoHK">Ngày vào HK</label></td>
                <td align="right">
                    <telerik:RadDatePicker ID="txtNgayVaoHK" runat="server" Culture="vi-VN" TabIndex="8" 
                        ShowPopupOnFocus="True" Width="80%" FocusedDate="2012-06-30" 
                        MinDate="1930-01-01">
                        <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x" 
                            DayNameFormat="Short"></Calendar>
                        <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" 
                            LabelWidth="40%"></DateInput>
                        <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                    </telerik:RadDatePicker>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="None"
                         ControlToValidate="txtNgayVaoHK" Text="*" ErrorMessage="Chưa nhập ngày vào hàng không" SetFocusOnError="true">
                    </asp:RequiredFieldValidator>
                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender5" TargetControlID="RequiredFieldValidator5"
                         HighlightCssClass="highlight" PopupPosition="Right" runat="server">
                    </asp:ValidatorCalloutExtender>
                </td>
            </tr>
            <tr>
                <td valign="top"><label for="txtAnhCaNhan">Ảnh cá nhân</label></td>
                <td valign="top" colspan="3">
                    <telerik:RadAsyncUpload ID="txtAnhCaNhan" MultipleFileSelection="Disabled" MaxFileInputsCount="1" 
                        OnClientFileUploaded="fileUploaded" 
                        OnFileUploaded="AsyncUpload1_FileUploaded" Width="160px" 
                        OnClientValidationFailed="validationFailed" 
                        allowedfileextensions=".jpg,.jpeg,.gif,.png" runat="server" TabIndex="9">
                        <Localization Cancel="Hủy" Remove="Xóa" Select="Chọn ảnh" />
                    </telerik:RadAsyncUpload>
                    <telerik:RadButton ID="butXoaAnh" runat="server" CausesValidation="false" TabIndex="10"
                        Text="Xóa ảnh" onclick="butXoaAnh_Click" style="top: -29px; left: 230px" />
                </td>
            </tr>
        </table>
        <table width="100%">
            <tr>
                <td style="width:50%;">
                    <fieldset style="width:95%;">
                        <table width="100%">
                            <tr>
                                <td style="width:15%;"><label for="txtSoCMND">Số CMND</label></td>
                                <td style="width:35%;">
                                    <telerik:RadTextBox Width="80%" ID="txtSoCMND" MaxLength="9" runat="server" 
                                        TabIndex="11" >
                                        <ClientEvents OnKeyPress="keyPress"/>
                                    </telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Display="None"
                                         ControlToValidate="txtSoCMND" Text="*" ErrorMessage="Chưa nhập CMND" SetFocusOnError="true">
                                    </asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender6" TargetControlID="RequiredFieldValidator6"
                                         HighlightCssClass="highlight" PopupPosition="Right" runat="server">
                                    </asp:ValidatorCalloutExtender>
                                </td>
                                <td style="width:15%;"><label for="txtNgayCap">Ngày cấp</label></td>
                                <td style="width:35%;" align="right">
                                    <telerik:RadDatePicker ID="txtNgayCap" runat="server" Culture="vi-VN" 
                                        ShowPopupOnFocus="True" Width="80%" TabIndex="12" FocusedDate="2012-06-30" 
                                        MinDate="1930-01-01">
                                        <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x" 
                                            DayNameFormat="Short"></Calendar>
                                        <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" 
                                            LabelWidth="40%"></DateInput>
                                        <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                                    </telerik:RadDatePicker>
                                </td>
                            </tr>
                            <tr>
                                <td><label for="txtNoiCap">Nơi cấp</label></td>
                                <td colspan="3"><telerik:RadTextBox ID="txtNoiCap" runat="server" Width="100%" 
                                        TabIndex="13" /></td>
                            </tr>
                            <tr>
                                <td><label for="cboDanToc">Dân tộc</label></td>
                                <td><telerik:RadComboBox Width="80%" ID="cboDanToc" runat="server" TabIndex="14" /></td>
                                <td><label for="cboTTHonNhan">TT hôn nhân</label></td>
                                <td align="right"><telerik:RadComboBox Width="80%" ID="cboTTHonNhan" runat="server" 
                                        TabIndex="15"/></td>
                            </tr>
                            <tr>
                                <td><label for="cboTonGiao">Tôn giáo</label></td>
                                <td><telerik:RadComboBox Width="80%" ID="cboTonGiao" runat="server" TabIndex="16" /></td>
                                <td><label for="cboQuocTich">Quốc tịch</label></td>
                                <td align="right"><telerik:RadComboBox Width="80%" ID="cboQuocTich" runat="server" 
                                        TabIndex="17" /></td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
                <td align="right" style="width:50%;">    
                    <fieldset style="width:95%;">
                        <table width="100%">
                            <tr align="left">
                                <td><label for="txtHoKhau">Hộ khẩu</label></td>
                                <td colspan="3"><telerik:RadTextBox ID="txtHoKhau" runat="server" Width="100%" 
                                        TabIndex="18" /></td>
                            </tr>
                            <tr align="left">
                                <td><label for="txtDCLienHe">ĐC liên hệ</label></td>
                                <td colspan="3"><telerik:RadTextBox ID="txtDCLienHe" runat="server" Width="100%" 
                                        TabIndex="19" /></td>
                            </tr>
                            <tr align="left">
                                <td style="width:15%;"><label for="txtMayBan">ĐT bàn</label></td>
                                <td style="width:35%;">
                                    <telerik:RadTextBox ID="txtMayBan" MaxLength="10" Width="80%" runat="server" 
                                        TabIndex="20">
                                        <ClientEvents OnKeyPress="keyPress"/>
                                    </telerik:RadTextBox>
                                </td>
                                <td style="width:15%;"><label for="txtDiDong">ĐT di động</label></td>
                                <td style="width:35%;" align="right">
                                    <telerik:RadTextBox Width="80%" ID="txtDiDong" MaxLength="12" runat="server" 
                                        TabIndex="21">
                                        <ClientEvents OnKeyPress="keyPress"/>
                                    </telerik:RadTextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td><label for="txtEmail">Email</label></td>
                                <td><telerik:RadTextBox ID="txtEmail" Width="80%" runat="server" TabIndex="22"></telerik:RadTextBox></td>
                                <td><label for="txtTaiKhoan">Số tài khoản</label></td>
                                <td align="right"><telerik:RadTextBox Width="80%" ID="txtTaiKhoan" runat="server" 
                                        TabIndex="23" /></td>
                            </tr>
                        </table>                        
                    </fieldset>
                </td>
            </tr>
        </table>
        <asp:Label ID="lbLog" CssClass="rfdAspLabel" runat="server" Text="" />
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThemChungChi.aspx.cs" Inherits="Aits_Hrm.CV.ThemChungChi" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Thêm thông tin chứng chỉ của nhân viên, ứng viên</title>
    <style type="text/css">
        .invalid{color:Red;}
        .binary-image{margin-bottom:5px;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
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
                        <telerik:AjaxUpdatedControl ControlID="AnhScan" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        
        <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" Height="100%" Width="100%">
        <telerik:RadFormDecorator ID="FormDecorator1" runat="server" DecoratedControls="all" />
        <telerik:RadToolBar ID="RadToolBar1" Runat="server" EnableRoundedCorners="true" 
            EnableShadows="true" Width="100%" onbuttonclick="RadToolBar1_ButtonClick">
            <Items>
                <telerik:RadToolBarButton runat="server" Value="Save" Text="Lưu lại"></telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" Value="Reset" Text="Nhập lại"></telerik:RadToolBarButton>
            </Items>
        </telerik:RadToolBar>
        <fieldset>
            <legend style="font-weight:bold;">Thông tin chứng chỉ</legend>
            <table width="100%">
                <tr>
                    <td valign="top" rowspan="7">
                        <telerik:RadBinaryImage ID="AnhScan" runat="server" AlternateText="Ảnh scan chứng chỉ" 
                            ResizeMode="Fill" Width="160px" Height="160px" ImageUrl="../Images/no_photo.jpg" ImageAlign="Middle" />
                        <span class="invalid"></span>
                    </td>
                </tr>
                <tr>
                    <td style="width:15%;"><label for="cboTenChungChi">Tên chứng chỉ</label></td>
                    <td style="width:30%;">
                        <telerik:RadComboBox ID="cboTenChungChi" Width="80%" runat="server" />
                    </td>
                    <td style="width:15%;"><label for="cboNoiDT">Nơi cấp chứng chỉ</label></td>
                    <td style="width:30%;">
                        <telerik:RadComboBox ID="cboNoiDT" runat="server" Width="100%" />
                    </td>
                </tr>
                <tr>
                    <td><label for="txtTuNgay">Ngày cấp</label></td>
                    <td>
                        <telerik:RadDatePicker ID="txtTuNgay" Culture="vi-VN" d runat="server" Width="80%" ShowPopupOnFocus="True" Calendar-DayNameFormat="Short">                        
                            <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%" />
                        </telerik:RadDatePicker>
                    </td>
                    <td><label for="txtDenNgay">Ngày hết hiệu lực</label></td>
                    <td align="right">
                        <telerik:RadDatePicker ID="txtDenNgay" Culture="vi-VN" runat="server" Width="100%" ShowPopupOnFocus="True" Calendar-DayNameFormat="Short">                        
                            <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%" />
                        </telerik:RadDatePicker>
                    </td>
                </tr>
                <tr>
                    <td><label for="cboChuyenNganh">Chuyên ngành</label></td>
                    <td colspan="3">
                        <telerik:RadComboBox ID="cboChuyenNganh" runat="server" Width="100%" />
                    </td>
                </tr>
                <tr>
                    <td><label for="cboLoaiBang">Loại bằng</label></td>
                    <td>
                        <telerik:RadComboBox Width="80%" ID="cboLoaiBang" runat="server" />
                    </td>
                    <td><label for="txtDiem">Số điểm</label></td>
                    <td>
                        <telerik:RadNumericTextBox Width="100%" ID="txtDiem" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td valign="top"><label for="upAnh">Ảnh scan</label></td>
                    <td colspan="3">
                        <telerik:RadAsyncUpload ID="upAnh" runat="server" MultipleFileSelection="Disabled" MaxFileInputsCount="1"
                            OnClientFileUploaded="fileUploaded" OnFileUploaded="AsyncUpload1_FileUploaded" 
                            OnClientValidationFailed="validationFailed" allowedfileextensions=".jpg,.jpeg,.gif,.png">
                            <Localization Cancel="Hủy" Remove="Xóa" Select="Chọn ảnh" />
                        </telerik:RadAsyncUpload>
                        <telerik:RadButton ID="butXoaAnh" runat="server" Text="Xóa ảnh" 
                            onclick="butXoaAnh_Click" style="top: -29px; left: 230px" />
                    </td>
                </tr>
            </table>

            <telerik:RadGrid ID="grvChungChi" Culture="vi-VN" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" 
                GridLines="None" onitemcommand="grvChungChi_ItemCommand" 
                ondeletecommand="grvChungChi_DeleteCommand" 
                onneeddatasource="grvChungChi_NeedDataSource">
                <ClientSettings EnablePostBackOnRowClick="true" />
                <MasterTableView ShowHeadersWhenNoRecords="True" DataKeyNames="IDDaoTao">
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
                            ConfirmDialogWidth="285px" FilterControlAltText="Filter columnXoa column" 
                            HeaderText="Xóa" Text="Xóa" UniqueName="columnXoa" HeaderStyle-Width="30px"/>
                        <telerik:GridBoundColumn DataField="ChungChi" 
                            FilterControlAltText="Filter column column" HeaderText="Tên chứng chỉ" 
                            HeaderStyle-Width="80px" UniqueName="column">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="NoiCapBang" 
                            FilterControlAltText="Filter column2 column" HeaderText="Nơi cấp bằng" 
                            UniqueName="column2">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="TuNgay" DataFormatString="{0:dd/MM/yyyy}" 
                            FilterControlAltText="Filter column3 column" HeaderText="Ngày cấp" 
                            UniqueName="column3" HeaderStyle-Width="70px">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DenNgay" DataFormatString="{0:dd/MM/yyyy}" 
                            FilterControlAltText="Filter column4 column" HeaderText="Ngày hêt hiệu lực" 
                            UniqueName="column4" HeaderStyle-Width="70px">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ChuyenNganh" 
                            FilterControlAltText="Filter column5 column" HeaderText="Chuyên ngành" 
                            UniqueName="column5" HeaderStyle-Width="100px">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="LoaiBang" 
                            FilterControlAltText="Filter column6 column" HeaderText="Loại bằng" 
                            HeaderStyle-Width="80px" UniqueName="column6">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Diem" 
                            FilterControlAltText="Filter column7 column" HeaderText="Điểm" 
                            HeaderStyle-Width="50px" UniqueName="column7">
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn DataField="Anh" HeaderStyle-Width="60px"
                            FilterControlAltText="Filter column8 column" HeaderText="Ảnh scan" 
                            UniqueName="column8">
                            <ItemTemplate>
                                    <asp:HyperLink ID="Link1" runat="server" Target="_blank">
                                        <telerik:RadBinaryImage ID="smallImage" runat="server" DataValue='<%# Eval("Anh") %>'
                                            ToolTip="Bấm vào đây để xem ảnh với kích thước đầy đủ" Width="45px" Height="60px" ResizeMode="Fit"/>
                                        <telerik:RadBinaryImage ID="largeImage" runat="server" DataValue='<%# Eval("Anh") %>'
                                            ResizeMode="None" style="display:none"/>
                                    </asp:HyperLink>
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
                <FilterMenu EnableImageSprites="False"></FilterMenu>
            </telerik:RadGrid>
        </fieldset>
        </telerik:RadAjaxPanel>
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" />
        <telerik:RadWindow ID="RadWindow1" runat="server">
        </telerik:RadWindow>
    </form>
</body>
</html>

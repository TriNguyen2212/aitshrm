<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThemNhanThan.aspx.cs" Inherits="Aits_Hrm.CV.ThemNhanThan" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chi tiết thông tin nhân thân của nhân viên</title>
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
            <legend style="font-weight:bold;">Thông tin nhân thân</legend>
            <table width="100%">
                <tr>
                    <td style="width:15%;"><label for="txtHoTenNT">Họ và tên</label></td>
                    <td colspan="3">
                        <telerik:RadTextBox ID="txtHoTenNT" runat="server" Width="100%" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="None" Text="*"
                             ControlToValidate="txtHoTenNT" SetFocusOnError="true" ErrorMessage="Chưa nhập họ tên">
                        </asp:RequiredFieldValidator>
                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" TargetControlID="RequiredFieldValidator1"
                            HighlightCssClass="highlight" PopupPosition="BottomLeft" runat="server">
                        </asp:ValidatorCalloutExtender>
                    </td>
                </tr>
                <tr>
                    <td><label for="cboNamSinh">Năm sinh</label></td>
                    <td><telerik:RadComboBox ID="cboNamSinh" Width="80%" runat="server" /></td>
                    <td style="width:15%;"><label for="cboQuanHe">Quan hệ</label></td>
                    <td align="right"><telerik:RadComboBox  Width="80%" ID="cboQuanHe" runat="server" /></td>
                </tr>
                <tr>
                    <td><label for="txtNgheNghiep">Tình trạng - nghề nghiệp</label></td>
                    <td colspan="3">
                        <telerik:RadTextBox ID="txtNgheNghiep" runat="server" Width="100%" >
                        </telerik:RadTextBox>
                    </td>
                </tr>
            </table>

            <telerik:RadGrid ID="grdNhanThan" Culture="vi-VN" AutoGenerateColumns="False"
                runat="server" AllowPaging="True" AllowSorting="True" CellSpacing="0"
                GridLines="None" onitemcommand="grdNhanThan_ItemCommand"
                ondeletecommand="grdNhanThan_DeleteCommand1"
                onneeddatasource="grdNhanThan_NeedDataSource">
                <ClientSettings EnablePostBackOnRowClick="true" />
                <MasterTableView OverrideDataSourceControlSorting="true" ShowHeadersWhenNoRecords="True" DataKeyNames="IDNhanThan">
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
                        <telerik:GridButtonColumn ConfirmDialogType="RadWindow" CommandName="Delete" ConfirmDialogHeight="100px"
                            ConfirmDialogWidth="285px" FilterControlAltText="Filter columnXoa column" 
                            HeaderText="Xóa" Text="Xóa" UniqueName="columnXoa" ButtonType="ImageButton" 
                            ConfirmText="Có chắc xóa không?" ConfirmTitle="Xóa" />
                        <telerik:GridBoundColumn DataField="HoTenNhanThan"
                            FilterControlAltText="Filter column column" HeaderText="Họ và tên" 
                            UniqueName="column">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="QuanHe" 
                            FilterControlAltText="Filter column1 column" HeaderText="Quan hệ" 
                            UniqueName="column1">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="NamSinh" 
                            FilterControlAltText="Filter column2 column" HeaderText="Năm sinh" 
                            UniqueName="column2">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="NgheNghiep" 
                            FilterControlAltText="Filter column3 column" HeaderText="Nghề nghiệp" 
                            UniqueName="column3">
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
                        <EditColumn FilterControlAltText="Filter EditCommandColumn column" />
                    </EditFormSettings>
                </MasterTableView>
                <FilterMenu EnableImageSprites="False">
                </FilterMenu>
            </telerik:RadGrid>
        </fieldset>
        </telerik:RadAjaxPanel>
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" />
    </form>
</body>
</html>

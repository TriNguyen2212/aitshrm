<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HoSoCaNhan.ascx.cs" Inherits="Aits_Hrm.Home.HoSoCaNhan" %>

<asp:HiddenField ID="HiddenField1" runat="server" />
 <telerik:RadTabStrip ID="RadTabStrip1" runat="server" SelectedIndex="0" 
    MultiPageID="RadMultiPage1" ScrollChildren="True" PerTabScrolling="True" 
    ReorderTabsOnSelect="True" ScrollButtonsPosition="Middle">
        <Tabs>
            <telerik:RadTab runat="server" Text="Thông tin chung" PerTabScrolling="True" Selected="true"
                ScrollButtonsPosition="Left" ScrollChildren="True">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Thông tin liên hệ">
                <TabTemplate>Thông tin liên hệ</TabTemplate>
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Nhân thân">
                <TabTemplate>Nhân thân</TabTemplate>
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Hợp đồng lao động">
                <TabTemplate>Hợp đồng lao động</TabTemplate>
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Đào tạo">
                <TabTemplate>Bằng cấp</TabTemplate>
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Chứng chỉ">
                <TabTemplate>Chứng chỉ</TabTemplate>
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Quá trình công tác">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Nghỉ phép">
            </telerik:RadTab>
             <telerik:RadTab runat="server" Text="Khen thưởng">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Lương">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Thuế">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Bảo Hiểm">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" CssClass="pageView"
            Width="100%">
            <telerik:RadPageView ID="RadPageView2" runat="server" Selected="true">
                <table width="100%">
                    <tr>
                        <td rowspan="10" style="width:15%;">
                            <telerik:RadBinaryImage ID="ImageEmp" runat="server" ResizeMode="Fit" Height="150px" ImageAlign="Middle" Width="100px" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width:15%;"><asp:Label ID="MaNV" AssociatedControlID="lbMaNV" runat="server" Text="Mã nhân viên: " /></td>
                        <td><asp:Label ID="lbMaNV" CssClass="rfdAspLabel" runat="server" Font-Bold="true" Text="" /></td>                                
                    </tr>
                    <tr>
                        <td><asp:Label ID="TenNV" AssociatedControlID="lbTenNV" runat="server" Text="Tên nhân viên: " /></td>
                        <td><asp:Label ID="lbTenNV" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                        <td style="width:15%;"><asp:Label ID="CMND" AssociatedControlID="lbCMND" runat="server" Text="Số CMND: " /></td>
                        <td><asp:Label ID="lbCMND" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                                                                                       
                    </tr>
                    <tr>
                        <td><asp:Label ID="GioiTinh" AssociatedControlID="lbGioitinh" runat="server" Text="Giới tính: " /></td>
                        <td><asp:Label ID="lbGioitinh" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                        <td><asp:Label ID="NgayCapCMND" AssociatedControlID="lbNgayCapCMND" runat="server" Text="Ngày cấp CMND: " /></td>
                        <td><asp:Label ID="lbNgayCapCMND" CssClass="rfdAspLabel" runat="server" Text="" /></td>   
                                
                    </tr>
                    <tr>
                        <td><asp:Label ID="DateOfBirth" AssociatedControlID="lbDateOfBirth" runat="server" Text="Ngày sinh: " /></td>
                        <td><asp:Label ID="lbDateOfBirth" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                        <td><asp:Label ID="NoiCapCMND" AssociatedControlID="lbNoiCapCMND" runat="server" Text="Nơi cấp CMND: " /></td>
                        <td><asp:Label ID="lbNoiCapCMND" CssClass="rfdAspLabel" runat="server" Text="" /></td>                                
                    </tr>
                    <tr>
                        <td><asp:Label ID="NoiSinh" AssociatedControlID="lbNoiSinh" runat="server" Text="Nơi sinh: " /></td>
                        <td><asp:Label ID="lbNoiSinh" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                        <td><asp:Label ID="NgayBienChe" AssociatedControlID="lbNgayBienChe" runat="server" Text="Ngày biên chế: " /></td>
                        <td><asp:Label ID="lbNgayBienChe" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                    </tr>
                    <tr>
                        <td><asp:Label ID="DanToc" AssociatedControlID="lbDanToc" runat="server" Text="Dân tộc: " /></td>
                        <td><asp:Label ID="lbDanToc" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                        <td><asp:Label ID="NgayVaoHK" AssociatedControlID="txtNgayVaoHK" runat="server" Text="Ngày vào HK: " /></td>
                        <td><asp:Label ID="txtNgayVaoHK" CssClass="rfdAspLabel" runat="server" Text="" /></td> 
                    </tr>
                    <tr>
                        <td><asp:Label ID="TonGiao" AssociatedControlID="lbTonGiao" runat="server" Text="Tôn giáo: " /></td>
                        <td><asp:Label ID="lbTonGiao" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                        <td><asp:Label ID="ChucDanh" AssociatedControlID="lbChucDanh" runat="server" Text="Chức danh: " /></td>
                        <td><asp:Label ID="lbChucDanh" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                    </tr>
                    <tr>
                        <td><asp:Label ID="QuocTich" AssociatedControlID="lbQuocTich" runat="server" Text="Quốc tịch: " /></td>
                        <td><asp:Label ID="lbQuocTich" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                        <td><asp:Label ID="DonVi" AssociatedControlID="lbDonVi" runat="server" Text="Đơn vị công tác: " /></td>
                        <td><asp:Label ID="lbDonVi" CssClass="rfdAspLabel" runat="server" Text="" /></td>    
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView ID="RadPageView3" runat="server">
                <table style="width:100%">
                    <tr>
                        <td style="width:15%;"><label>ĐTDĐ:</label></td>
                        <td style="width:35%;"><asp:TextBox ID="lbDTDĐ" runat="server" BorderStyle="None" BorderWidth="0px" ReadOnly="true" />
                        <td style="width:15%;"><label>Email cá nhân:</label></td>
                        <td style="width:35%;"><asp:TextBox ID="lbEmail" runat="server" BorderStyle="None" BorderWidth="0px" ReadOnly="true" />
                        </td>
                    </tr>
                    <tr>
                        <td><label>Điện thoại cơ quan:</label></td>
                        <td><asp:TextBox ID="lbDTCQ" runat="server" BorderStyle="None" BorderWidth="0px" ReadOnly="true" />
                    </tr>
                    <tr>
                        <td><label>Địa chỉ liên hệ:</label></td>
                        <td><asp:TextBox ID="lbDiaChi" runat="server" BorderStyle="None" BorderWidth="0px" ReadOnly="true" />
                    </tr>
                        <tr>
                        <td><label>Số Tài khoản:</label></td>
                        <td><asp:TextBox ID="lbSoTK" runat="server" BorderStyle="None" BorderWidth="0px" ReadOnly="true" />
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView ID="RadPageView4" runat="server" Width="100%">                    
                <telerik:RadGrid ID="RadGridNhanThan" runat="server" 
                    AutoGenerateColumns="False" CellSpacing="0" GridLines="None">
                    <MasterTableView AutoGenerateColumns="False">
                        <NoRecordsTemplate>
                            <div><center><strong>Không có dữ liệu</strong></center></div>
                        </NoRecordsTemplate>
                        <CommandItemSettings ExportToPdfText="Export to PDF" />
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" 
                            Visible="True">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" 
                            Visible="True">
                        </ExpandCollapseColumn>
                        <Columns>
                            <telerik:GridBoundColumn DataField="HoTenNhanThan" 
                                FilterControlAltText="Filter HoTenNhanThan column" HeaderText="Họ và tên" 
                                UniqueName="HoTenNhanThan">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="NamSinh" 
                                FilterControlAltText="Filter NamSinh column" HeaderText="Năm sinh" 
                                UniqueName="NamSinh">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="NgheNghiep" 
                                FilterControlAltText="Filter NgheNghiep column" HeaderText="Nghề nghiệp" 
                                UniqueName="NgheNghiep">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Quanhe" 
                                FilterControlAltText="Filter Quanhe column" HeaderText="Quan hệ" 
                                UniqueName="Quanhe">
                            </telerik:GridBoundColumn>
                        </Columns>
                        <EditFormSettings>
                            <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                            </EditColumn>
                        </EditFormSettings>
                    </MasterTableView>
                    <FilterMenu EnableImageSprites="False">
                    </FilterMenu>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView ID="RadPageView5" runat="server">                  
                <telerik:RadGrid ID="GridHD" runat="server" MasterTableView-ShowHeader="true"
                    CellSpacing="0" GridLines="None" AutoGenerateColumns="False">
                <MasterTableView>
                    <NoRecordsTemplate>
                        <div><center><strong>Không có dữ liệu</strong></center></div>
                    </NoRecordsTemplate>
                    <CommandItemSettings ExportToPdfText="Export to PDF" />
                    <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" 
                        Visible="True">
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" 
                        Visible="True">
                    </ExpandCollapseColumn>
                    <Columns>
            <telerik:GridBoundColumn DataField="IDHopDongLD"
                FilterControlAltText="Filter IDHopDongLD column" HeaderText="ID" 
                UniqueName="IDHopDongLD" Visible="false">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="SoHD" 
                FilterControlAltText="Filter SoHD column" HeaderText="Số HĐ" 
                UniqueName="SoHD" >
                <HeaderStyle Width="100px" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="NguoiLaoDong" 
                FilterControlAltText="Filter NguoiLaoDong column" HeaderText="Người Lao động" 
                UniqueName="NguoiLaoDong">
                <HeaderStyle Width="150px" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="NguoiDaiDien"
                FilterControlAltText="Filter NguoiDaiDien column" HeaderText="Người Đại diện" 
                UniqueName="NguoiDaiDien">
                <HeaderStyle Width="150px" />
            </telerik:GridBoundColumn>
            <telerik:GridDateTimeColumn DataField="NgayKyHD" DataFormatString="{0:dd/MM/yyyy}" PickerType="DatePicker"
                FilterControlAltText="Filter NgayKyHD column" HeaderText="Ngày Kí HĐ"
                UniqueName="NgayKyHD" >
                <HeaderStyle Width="220px" />
            </telerik:GridDateTimeColumn>
            <telerik:GridBoundColumn DataField="LoaiHD" 
                FilterControlAltText="Filter LoaiHD column" HeaderText="Loại HĐ"
                UniqueName="LoaiHD">
                <HeaderStyle Width="180px" />
            </telerik:GridBoundColumn>
            <telerik:GridDateTimeColumn DataField="TuNgay" DataFormatString="{0:dd/MM/yyyy}"
                FilterControlAltText="Filter TuNgay column" HeaderText="Từ ngày" PickerType="DatePicker"
                UniqueName="TuNgay">
                    <HeaderStyle Width="220px" />
            </telerik:GridDateTimeColumn>
            <telerik:GridDateTimeColumn DataField="Denngay" DataFormatString="{0:dd/MM/yyyy}" 
                FilterControlAltText="Filter column6 column" HeaderText="Đến ngày" PickerType="DatePicker"
                UniqueName="DenNgay" >
                    <HeaderStyle Width="220px" />
            </telerik:GridDateTimeColumn>
            <telerik:GridBoundColumn DataField="ToChuc"
                FilterControlAltText="Filter ToChuc column" HeaderText="Tổ chức" 
                UniqueName="ToChuc">
                <HeaderStyle Width="150px" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="DiaDiemLamViec"
                FilterControlAltText="Filter DiaDiemLamViec column" HeaderText="Địa điểm làm việc" 
                UniqueName="DiaDiemLamViec">
                <HeaderStyle Width="200px" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="TrinhDoChuyenMon"
                FilterControlAltText="Filter TrinhDoChuyenMon column" HeaderText="Trình độ chuyên môn" 
                UniqueName="TrinhDoChuyenMon">
                <HeaderStyle Width="160px" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="ChucDanh"
                FilterControlAltText="Filter ChucDanh column" HeaderText="Chức Danh" 
                UniqueName="ChucDanh">
                <HeaderStyle Width="100px" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="PhuCap"
                FilterControlAltText="Filter PhuCap column" HeaderText="Phụ cấp" 
                UniqueName="PhuCap">
                <HeaderStyle Width="100px" />
            </telerik:GridBoundColumn>
            <telerik:GridNumericColumn DataField="MucHuong" DataFormatString="{0:#.#} %"
                DecimalDigits="2" FilterControlAltText="Filter MucHuong column" 
                HeaderText="Mức hưởng" UniqueName="MucHuong" NumericType="Percent">
            </telerik:GridNumericColumn>
            <telerik:GridNumericColumn DataField="MucLuongToiThieu" DataFormatString="{0:###,###,###} ₫"
                DecimalDigits="2" FilterControlAltText="Filter MucLuongToiThieu column" 
                HeaderText="Mức lương tối thiểu" UniqueName="MucLuongToiThieu">
            </telerik:GridNumericColumn>
            <telerik:GridBoundColumn DataField="GhiChu"
                FilterControlAltText="Filter GhiChu column" HeaderText="Ghi chú" 
                UniqueName="GhiChu">
                <HeaderStyle Width="160px" />
            </telerik:GridBoundColumn>
        </Columns>
                <EditFormSettings>
                    <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                    </EditColumn>
                </EditFormSettings>
                </MasterTableView>
                    <FilterMenu EnableImageSprites="False">
                    </FilterMenu>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView ID="RadPageView6" runat="server">
                    <telerik:RadGrid ID="GridDT" Culture="vi-VN" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" 
                    GridLines="None">
                    <ClientSettings EnablePostBackOnRowClick="false" />
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
                            <telerik:GridBoundColumn DataField="TrinhDo" 
                                FilterControlAltText="Filter column column" HeaderText="Trình độ đào tạo" 
                                UniqueName="column">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="LoaiHinhDT" 
                                FilterControlAltText="Filter column1 column" HeaderText="Loại hình đào tạo" 
                                UniqueName="column1">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="NoiCapBang" 
                                FilterControlAltText="Filter column2 column" HeaderText="Nơi cấp bằng" 
                                UniqueName="column2">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TuNgay" DataFormatString="{0:dd/MM/yyyy}" 
                                FilterControlAltText="Filter column3 column" HeaderText="Từ ngày" 
                                UniqueName="column3">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DenNgay" DataFormatString="{0:dd/MM/yyyy}" 
                                FilterControlAltText="Filter column4 column" HeaderText="Đến ngày" 
                                UniqueName="column4">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ChuyenNganh" 
                                FilterControlAltText="Filter column5 column" HeaderText="Chuyên ngành" 
                                UniqueName="column5">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="LoaiBang" 
                                FilterControlAltText="Filter column6 column" HeaderText="Loại bằng cấp" 
                                UniqueName="column6">
                            </telerik:GridBoundColumn>
                        </Columns>
                        <EditFormSettings>
                            <EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
                        </EditFormSettings>
                    </MasterTableView>
                    <FilterMenu EnableImageSprites="False"></FilterMenu>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView ID="RadPageView14" runat="server">
                    <telerik:RadGrid ID="GridChungChi" Culture="vi-VN" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" 
                    GridLines="None">
                    <ClientSettings EnablePostBackOnRowClick="false" />
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
                            <telerik:GridBoundColumn DataField="ChungChi" 
                                FilterControlAltText="Filter column column" HeaderText="Tên chứng chỉ" 
                                UniqueName="column">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="NoiCapBang" 
                                FilterControlAltText="Filter column2 column" HeaderText="Nơi cấp bằng" 
                                UniqueName="column2">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TuNgay" DataFormatString="{0:dd/MM/yyyy}" 
                                FilterControlAltText="Filter column3 column" HeaderText="Ngày cấp" 
                                UniqueName="column3">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DenNgay" DataFormatString="{0:dd/MM/yyyy}" 
                                FilterControlAltText="Filter column4 column" HeaderText="Ngày hết hiệu lực" 
                                UniqueName="column4">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ChuyenNganh" 
                                FilterControlAltText="Filter column5 column" HeaderText="Chuyên ngành" 
                                UniqueName="column5">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="LoaiBang" 
                                FilterControlAltText="Filter column6 column" HeaderText="Loại bằng cấp" 
                                UniqueName="column6">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Diem" 
                                FilterControlAltText="Filter column7 column" HeaderText="Điểm" 
                                UniqueName="column7">
                            </telerik:GridBoundColumn> 
                        </Columns>
                        <EditFormSettings>
                            <EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
                        </EditFormSettings>
                    </MasterTableView>
                    <FilterMenu EnableImageSprites="False"></FilterMenu>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView ID="RadPageView7" runat="server"> 
                <telerik:RadGrid ID="GridQTCT" Culture="vi-VN" AutoGenerateColumns="False"
                    AllowPaging="True" AllowSorting="True" CellSpacing="0" GridLines="None" 
                    runat="server" >
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
                        </Columns>
                    <EditFormSettings>
                    <EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
                    </EditFormSettings>
                    </MasterTableView>
                    <FilterMenu EnableImageSprites="False"></FilterMenu>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView ID="RadPageView13" runat="server">
                <telerik:RadGrid ID="grvNghi" Culture="vi-VN" AutoGenerateColumns="False"
                    AllowPaging="True" AllowSorting="True" CellSpacing="0" GridLines="None" 
                    runat="server" onitemdatabound="grvNghi_ItemDataBound">
                    <MasterTableView ShowHeadersWhenNoRecords="True" DataKeyNames="IDNghiPhep">
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
                            <telerik:GridBoundColumn DataField="TuNgay" DataFormatString="{0:dd/MM/yyyy}" 
                                FilterControlAltText="Filter column3 column" HeaderText="Từ ngày" 
                                HeaderStyle-Width="150px" UniqueName="column3">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DenNgay" DataFormatString="{0:dd/MM/yyyy}" 
                                FilterControlAltText="Filter column4 column" HeaderText="Đến ngày" 
                                HeaderStyle-Width="150px" UniqueName="column4">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="LoaiNghi" HeaderStyle-Width="150px"
                                FilterControlAltText="Filter column1 column" HeaderText="Loại nghỉ" 
                                UniqueName="column1">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="LyDoNghi" 
                                FilterControlAltText="Filter column2 column" HeaderText="Lý do nghỉ" 
                                UniqueName="column2">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TenNVBanGiao" HeaderStyle-Width="150px"
                                FilterControlAltText="Filter column2 column" HeaderText="Nhân viên bàn giao" 
                                UniqueName="column6">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn DataField="DuocNghi" HeaderStyle-Width="80px"
                                FilterControlAltText="Filter column5 column" HeaderText="Được nghỉ" 
                                UniqueName="column5">
                                <ItemTemplate>
                                    <asp:Label ID="DuocNghiLabel" runat="server" Text='<%# Eval("DuocNghi") %>'></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    <EditFormSettings>
                    <EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
                    </EditFormSettings>
                    </MasterTableView>
                    <FilterMenu EnableImageSprites="False"></FilterMenu>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView ID="RadPageView11" runat="server">
                Khen thưởng
            </telerik:RadPageView>
            <telerik:RadPageView ID="RadPageView1" runat="server">
                Lương
            </telerik:RadPageView>
            <telerik:RadPageView ID="RadPageView8" runat="server">
                Thuế
            </telerik:RadPageView>
            <telerik:RadPageView ID="RadPageView9" runat="server">
                phúc lợi
            </telerik:RadPageView>
            <telerik:RadPageView ID="RadPageView10" runat="server">
                Bảo hiểm
            </telerik:RadPageView>                
            <telerik:RadPageView ID="RadPageView12" runat="server">
                Lịch sử thay đổi
            </telerik:RadPageView>
    </telerik:RadMultiPage>
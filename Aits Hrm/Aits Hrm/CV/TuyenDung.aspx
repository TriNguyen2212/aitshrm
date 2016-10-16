<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="TuyenDung.aspx.cs" Inherits="Aits_Hrm.CV.TuyenDung" %>
<%-- top left--%>
<asp:Content ID="left" ContentPlaceHolderID="TopLeft"  runat="server">
   
    <telerik:RadTreeView ID="RadTreeView1" runat="server" 
        OnNodeClick="RadTreeView1_Nodeclick" DataValueField="IDDotTuyenDung">
        <DataBindings>
            <telerik:RadTreeNodeBinding Expanded ="True" SelectedImageUrl="../Images/icon_hostusers_16px.gif"
             ExpandedImageUrl="../Images/icon_hostusers_16px.gif"/>
        </DataBindings>
    </telerik:RadTreeView>
    <telerik:RadContextMenu ID="RadContextMenu2" runat="server">
        <Targets>
            <telerik:ContextMenuControlTarget ControlID="RadTreeView1" />
        </Targets>
        <Items>
            <telerik:RadMenuItem runat="server" Text="Thu gọn...">
            </telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" Text="Mở rộng...">
            </telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" Text="Quản lý danh mục">
            </telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" Text="Đóng">
            </telerik:RadMenuItem>
        </Items>
    </telerik:RadContextMenu>
</asp:Content>
<%-- botttom left--%>
<asp:Content ID="Content3" ContentPlaceHolderID="BottomLeft" runat="server">
</asp:Content>

<%-- top right (grid view)--%>
<asp:Content ID="Content1" ContentPlaceHolderID=TopRight runat=server>
    <telerik:RadContextMenu ID="RadContextMenu1" runat="server"
     OnClientItemClicked="ContextMenuItemClick">
        <Targets>
            <telerik:ContextMenuControlTarget ControlID="RadGrid1" />
            <telerik:ContextMenuControlTarget ControlID="RadPageView2"/>
            <telerik:ContextMenuControlTarget ControlID="RadPageView3"/>
        </Targets>
        <Items>
            <telerik:RadMenuItem Text="Thêm nhân viên..." 
                Value="them" ImageUrl="../Images/them.png">
            </telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" Text=" Xem chi tiết..." 
                 Value="sua" Enabled="false" ImageUrl="../Images/sua.png">
            </telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" Text=" Chọn..." 
                 Value="chon" Enabled="false" ImageUrl="../Images/chon.png">
            </telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" Text=" Gửi thông báo..." 
                 Value="guitb" Enabled="false" >
            </telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" Text="Xóa" Value="xoa" Enabled="false" ImageUrl="../Images/xoa2.png">
            </telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" Text="In..." Value="in"
                ImageUrl="../Images/action_print.gif">
            </telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" Text="Đóng">
            </telerik:RadMenuItem>
        </Items>
    </telerik:RadContextMenu>
    <asp:Panel ID="Panel1" runat="server" Height="100%">
        <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn=true
        OnSortCommand="Grid_Sort" OnItemCreated="RadGrid1_ItemCreated" OnPreRender="Grid_PreRender"
        CellSpacing="0" GridLines="Both"
        AllowPaging="True" AllowSorting="True" 
        AllowAutomaticDeletes="True" AllowAutomaticInserts="True"
        AllowAutomaticUpdates="True" Culture="vi-VN" 
        GroupingEnabled="False" AllowCustomPaging="False" 
        AutoGenerateColumns="False" Height="95%"
         OnItemCommand="Grid_ItemCommand" onneeddatasource="Grid_NeedDataSource" PageSize="10">
        <ClientSettings AllowColumnsReorder="true" EnableRowHoverStyle="true"
            ReorderColumnsOnClient="true" EnablePostBackOnRowClick=true Resizing-AllowColumnResize=true>
            <Selecting AllowRowSelect="True" />
            <Scrolling FrozenColumnsCount="1" ScrollHeight="" AllowScroll="True" 
                UseStaticHeaders="True" />
        </ClientSettings>
        <MasterTableView AllowCustomPaging="False" GridLines="None" ShowFooter="false">
        <HeaderStyle Height=30px />
     
        <PagerTemplate>
                    <asp:Panel ID="PagerPanel" Style="padding: 6px; line-height: 24px" runat="server">
                        
                        <div style="margin: 0px; float: right;">
                            Trang
                            <%# (int)DataBinder.Eval(Container, "Paging.CurrentPageIndex") + 1 %>
                            /
                            <%# DataBinder.Eval(Container, "Paging.PageCount")%> trang
                            , từ bản ghi
                            <%# (int)DataBinder.Eval(Container, "Paging.FirstIndexInPage") + 1 %>
                            tới
                            <%# (int)DataBinder.Eval(Container, "Paging.LastIndexInPage") + 1 %>
                            /
                            <%# DataBinder.Eval(Container, "Paging.DataSourceCount")%> bản ghi
                        </div>
                        <div style="float: left">
                            <span style="margin-right: 3px;">Kích thước trang:</span>
                            <telerik:RadComboBox ID="RadComboBox1" DataSource="<%# new object[]{10, 20, 30, 40} %>"
                                Style="margin-right: 20px;" Width="40px" SelectedValue='<%# DataBinder.Eval(Container, "Paging.PageSize") %>'
                                runat="server" OnClientSelectedIndexChanged="RadComboBox1_SelectedIndexChanged">
                            </telerik:RadComboBox>
                        </div>
                        <div style="width:260px; margin: 0px; padding: 0px; float: left; margin-right: 10px; white-space: nowrap;">
                            <asp:Button ID="Button1" runat="server" OnClientClick="changePage('first'); return false;"
                            CommandName="Page" CommandArgument="First" Text=" " CssClass="PagerButton FirstPage" />
                            <asp:Button ID="Button2" runat="server" OnClientClick="changePage('prev'); return false;"
                            CommandName="Page" CommandArgument="Prev" Text="" CssClass="PagerButton PrevPage" />
                                                        <span style="vertical-align: middle;">Trang:</span>
                                                        <telerik:RadNumericTextBox ID="RadNumericTextBox1" Width="25px" Value='<%# (int)DataBinder.Eval(Container, "Paging.CurrentPageIndex") + 1 %>'
                                                            runat="server">
                                                            <ClientEvents OnValueChanged="RadNumericTextBox1_ValueChanged" />
                                                            <NumberFormat DecimalDigits="0" />
                                                        </telerik:RadNumericTextBox>
                                                        <span style="vertical-align: middle;">/
                                                            <%# DataBinder.Eval(Container, "Paging.PageCount")%>
                                                        </span>
                            <asp:Button ID="Button3" runat="server" OnClientClick="changePage('next'); return false;"
                            CommandName="Page" CommandArgument="Next" Text=" " CssClass="PagerButton NextPage" />
                            <asp:Button ID="Button4" runat="server" OnClientClick="changePage('last'); return false;"
                            CommandName="Page" CommandArgument="Last" Text=" " CssClass="PagerButton LastPage" />
                        </div>
                        <asp:Panel runat="server" ID="NumericPagerPlaceHolder" />
                         
                    </asp:Panel>
                </PagerTemplate>
        <PagerStyle Mode="NumericPages" PageButtonCount="15" AlwaysVisible="true"/>
        <NoRecordsTemplate>Không có dữ liệu.</NoRecordsTemplate>
        <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

           <RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
                <HeaderStyle Width="20px"></HeaderStyle>
                </RowIndicatorColumn>

           <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
    <HeaderStyle Width="20px"></HeaderStyle>
    </ExpandCollapseColumn>
            <Columns>
            <telerik:GridBoundColumn DataField="IDNhanVien"
                FilterControlAltText="Filter column column" HeaderText="ID" 
                UniqueName="IDNhanVien" CurrentFilterFunction="Custom" 
                AutoPostBackOnFilter=false Visible="False">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="MaNV" FilterControlWidth="50%"
                FilterControlAltText="Filter column column" HeaderText="Mã NV" 
                UniqueName="MaNV" CurrentFilterFunction="Custom" AutoPostBackOnFilter=false>
                <HeaderStyle Width="60px" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="TenNV" FilterControlWidth="50%"
                FilterControlAltText="Filter column1 column" HeaderText="Tên NV" 
                UniqueName="TenNV" AutoPostBackOnFilter="false" >
                <HeaderStyle Width="150px" />
            </telerik:GridBoundColumn>
            <telerik:GridDateTimeColumn  DataField="NgaySinh" DataFormatString="{0:dd/MM/yyyy}" FilterDateFormat="dd/MM/yyyy"
                PickerType="DatePicker" FilterControlAltText="Filter2" HeaderText="Ngày sinh" FilterListOptions=AllowAllFilters
                UniqueName="NgaySinh" >
                <HeaderStyle Width="220px" />
            </telerik:GridDateTimeColumn>
            <telerik:GridBoundColumn  DataField="NoiSinh" FilterControlWidth="50%"
                FilterControlAltText="Filter column3 column" HeaderText="Nơi sinh" 
                UniqueName="NoiSinh" >
                <HeaderStyle Width="150px" />
            </telerik:GridBoundColumn>
            <telerik:GridTemplateColumn DataField="GioiTinh" FilterControlWidth="50%"
                FilterControlAltText="Filter column4 column" HeaderText="Giới Tính" 
                UniqueName="GioiTinh">
                <EditItemTemplate>
                    <asp:TextBox ID="GioiTinhTextBox" runat="server" Text='<%# Bind("GioiTinh") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="GioiTinhLabel" runat="server"><%# bool.Parse(Eval("GioiTinh").ToString())==true?"Nam":"Nữ"%></asp:Label>
                </ItemTemplate>
                    <HeaderStyle Width="100px" />
            </telerik:GridTemplateColumn>
            <telerik:GridBoundColumn DataField="DanToc" FilterControlWidth="50%"
                FilterControlAltText="Filter column5 column" HeaderText="Dân tộc" 
                UniqueName="DanToc">
                <HeaderStyle Width="100px" />
            </telerik:GridBoundColumn>
            
            <telerik:GridBoundColumn DataField="TonGiao" FilterControlWidth="50%"
                FilterControlAltText="Filter column6 column" HeaderText="Tôn giáo" 
                UniqueName="TonGiao">
                <HeaderStyle Width="100px" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="QuocTich" FilterControlWidth="50%"
                FilterControlAltText="Filter column7 column" HeaderText="Quốc tịch" 
                UniqueName="QuocTich">
                <HeaderStyle Width="100px" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="SoDiDong" FilterControlWidth="50%"
                FilterControlAltText="Filter SoDiDong column" HeaderText="Điện Thoại di động" 
                UniqueName="SoDiDong">
                <HeaderStyle Width="150px" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="SoMayBan" FilterControlWidth="50%"
                FilterControlAltText="Filter column2 column" HeaderText="Máy bàn" 
                UniqueName="SoMayBan">
                <HeaderStyle Width="160px" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Email" FilterControlWidth="50%"
                FilterControlAltText="Filter Email column" HeaderText="Email" 
                UniqueName="Email">
                <HeaderStyle Width="200px" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="DuocDangNhap" FilterControlWidth="50%"
                FilterControlAltText="Filter DuocDangNhap column" HeaderText="Đăng nhập" 
                UniqueName="DuocDangNhap">
                <HeaderStyle Width="160px" />
            </telerik:GridBoundColumn>
             <telerik:GridBoundColumn DataField="DuocChon" FilterControlWidth="50%"
                FilterControlAltText="Filter DuocDangNhap column" HeaderText="Được chọn" 
                UniqueName="DuocChon">
                <HeaderStyle Width="160px" />
            </telerik:GridBoundColumn>
             <telerik:GridBoundColumn DataField="GhiChu" FilterControlWidth="50%"
                FilterControlAltText="Filter DuocDangNhap column" HeaderText="Ghi chú" 
                UniqueName="GhiChu">
                <HeaderStyle Width="160px" />
            </telerik:GridBoundColumn>
        </Columns>

           <EditFormSettings>
    <EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
    </EditFormSettings>
        </MasterTableView>
        <FilterMenu EnableImageSprites="False"></FilterMenu>
  </telerik:RadGrid>
    </asp:Panel>
    
</asp:Content>


<%-- bottom right--%>
<asp:Content ID="Content2" ContentPlaceHolderID="BottomRight" runat="server">

    <telerik:RadFormDecorator ID="FormDecorator1" runat="server" DecoratedControls="all"></telerik:RadFormDecorator>
    <telerik:RadTabStrip ID="RadTabStrip1" runat="server" SelectedIndex="5" 
    MultiPageID="RadMultiPage1" ScrollChildren="True" PerTabScrolling="True" 
        ReorderTabsOnSelect="True" ScrollButtonsPosition="Middle" Width="100%">
        <Tabs>
            <telerik:RadTab runat="server" Text="Thông tin chung" PerTabScrolling="True"
                ScrollButtonsPosition="Left" ScrollChildren="True">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Thông tin liên hệ">
            <TabTemplate>Thông tin liên hệ</TabTemplate>
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Nhân thân">
            <TabTemplate>Nhân thân</TabTemplate>
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Đào tạo">
            <TabTemplate>Đào tạo</TabTemplate>
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Quá trình công tác">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Lịch sử thay đổi" Selected="True">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>


    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="5" CssClass="pageView"
                Width="100%">
                <telerik:RadPageView ID="RadPageView2" runat="server" Selected="true">
                        <table width="100%">
                            <tr>
                                <td rowspan="10" style="width:15%;">
                                    <telerik:RadBinaryImage ID="ImageEmp" runat="server" ResizeMode=Fit Height="150px" ImageAlign="Middle" Width="100px" />
                                </td>
                            </tr>
                             <tr>
                                <td style="width:15%;"><asp:Label ID="MaNV" AssociatedControlID="lbMaNV" runat="server" Text="Mã nhân viên: " /></td>
                                <td><asp:Label ID="lbMaNV" CssClass="rfdAspLabel" runat="server" Font-Bold="true" Text="" /></td>
                                <td style="width:15%;"><asp:Label ID="CMND" AssociatedControlID="lbCMND" runat="server" Text="Số CMND: " /></td>
                                <td><asp:Label ID="lbCMND" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                            </tr>
                            <tr>
                                <td><asp:Label ID="TenNV" AssociatedControlID="lbTenNV" runat="server" Text="Tên nhân viên: " /></td>
                                <td><asp:Label ID="lbTenNV" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                                <td><asp:Label ID="NgayCapCMND" AssociatedControlID="lbNgayCapCMND" runat="server" Text="Ngày cấp CMND: " /></td>
                                <td><asp:Label ID="lbNgayCapCMND" CssClass="rfdAspLabel" runat="server" Text="" /></td>                                                          
                            </tr>
                            <tr>
                                <td><asp:Label ID="GioiTinh" AssociatedControlID="lbGioitinh" runat="server" Text="Giới tính: " /></td>
                                <td><asp:Label ID="lbGioitinh" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                                <td><asp:Label ID="NoiCapCMND" AssociatedControlID="lbNoiCapCMND" runat="server" Text="Nơi cấp CMND: " /></td>
                                <td><asp:Label ID="lbNoiCapCMND" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                            </tr>
                            <tr>
                                <td><asp:Label ID="DateOfBirth" AssociatedControlID="lbDateOfBirth" runat="server" Text="Ngày sinh: " /></td>
                                <td><asp:Label ID="lbDateOfBirth" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                                <td><asp:Label ID="QuocTich" AssociatedControlID="lbQuocTich" runat="server" Text="Quốc tịch: " /></td>
                                <td><asp:Label ID="lbQuocTich" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                            </tr>
                            <tr>
                                <td><asp:Label ID="NoiSinh" AssociatedControlID="lbNoiSinh" runat="server" Text="Nơi sinh: " /></td>
                                <td><asp:Label ID="lbNoiSinh" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                                <td><asp:Label ID="NgayVaoHK" AssociatedControlID="txtNgayVaoHK" runat="server" Text="Ngày vào HK: " /></td>
                                <td><asp:Label ID="txtNgayVaoHK" CssClass="rfdAspLabel" runat="server" Text="" /></td> 
                            </tr>
                            <tr>
                                <td><asp:Label ID="TonGiao" AssociatedControlID="lbTonGiao" runat="server" Text="Tôn giáo: " /></td>
                                <td><asp:Label ID="lbTonGiao" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                                <td><asp:Label ID="DonVi" AssociatedControlID="lbDonVi" runat="server" Text="Đơn vị công tác hiện tại: " /></td>
                                <td><asp:Label ID="lbDonVi" CssClass="rfdAspLabel" runat="server" Text="" /></td>    
                            </tr>
                            <tr>
                                <td><asp:Label ID="DanToc" AssociatedControlID="lbDanToc" runat="server" Text="Dân tộc: " /></td>
                                <td><asp:Label ID="lbDanToc" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                                <td><asp:Label ID="ChucDanh" AssociatedControlID="lbChucDanh" runat="server" Text="Chức danh hiện tại: " /></td>
                                <td><asp:Label ID="lbChucDanh" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                            </tr>
                            
                        </table>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView3" runat="server">
                   <table style="width:100%">
                        <tr>
                            <td><label>ĐTDĐ:</label></td>
                            <td>
                                 <asp:TextBox ID="lbDTDĐ" runat="server" BorderStyle="None" BorderWidth="0px" 
                                    ReadOnly="true"></asp:TextBox></td>
                                
                            <td><label>Email cá nhân:</label></td>
                            <td>
                             <asp:TextBox ID="lbEmail" runat="server" BorderStyle="None" BorderWidth="0px" 
                                    ReadOnly="true"></asp:TextBox></td>
                               
                        </tr>
                         <tr>
                            <td><label>Điện thoại cơ quan:</label></td>
                             <td>
                                <asp:TextBox ID="lbDTCQ" runat="server" BorderStyle="None" BorderWidth="0px" 
                                     ReadOnly="true"></asp:TextBox></td>
                             
                        </tr>
                        <tr>
                            <td><label>Địa chỉ liên hệ:</label></td>
                            <td>
                             <asp:TextBox ID="lbDiaChi" runat="server" BorderStyle="None" BorderWidth="0px" 
                                    ReadOnly="true"></asp:TextBox></td>
                        
                            
                        </tr>
                         <tr>
                            <td><label>Số Tài khoản:</label></td>
                             <td>
                                 <asp:TextBox ID="lbSoTK" runat="server" BorderStyle="None" BorderWidth="0px" 
                                     ReadOnly="true"></asp:TextBox></td>
                        </tr>
                   </table>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView4" runat="server" Width=100%>
                     <telerik:RadContextMenu ID="RadContextMenuNhanThan" runat="server" OnClientItemClicked="RadContextMenuNhanThan_Itemclick">
                        <Targets>
                            <telerik:ContextMenuControlTarget ControlID="RadGridNhanThan"/>
                        </Targets>
                        <Items>
                            <telerik:RadMenuItem runat="server" Text="Xem chi tiết và chỉnh sửa..." Value="sua">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Đóng">
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadContextMenu>
                    <telerik:RadGrid ID="RadGridNhanThan" runat="server" 
                        AutoGenerateColumns="False" CellSpacing="0" GridLines="None">
                        <MasterTableView AutoGenerateColumns="False">
                            <NoRecordsTemplate>không có dữ liệu</NoRecordsTemplate>
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

                <telerik:RadPageView ID="RadPageView6" runat="server">
                        <telerik:RadContextMenu ID="RadContextMenuDaoTao" runat="server" OnClientItemClicked="ContextMenuDT_Click">
                        <Targets>
                            <telerik:ContextMenuControlTarget ControlID="GridDT"/>
                        </Targets>
                        <Items>
                            <telerik:RadMenuItem runat="server" Text="Quản lý ĐT nhân viên..." Value="sua">
                            </telerik:RadMenuItem>
                             <telerik:RadMenuItem runat="server" Text="Đóng">
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadContextMenu>
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
                    <telerik:RadContextMenu ID="RadContextMenuQTCT" runat="server" OnClientItemClicked="RadContextMenuQTDT_Itemclick">
                        <Targets>
                            <telerik:ContextMenuControlTarget ControlID="GridQTCT"/>
                        </Targets>
                        <Items>
                            <telerik:RadMenuItem runat="server" Text="Quản lý QTCT nhân viên..." Value="sua">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Đóng">
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadContextMenu>
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
                                <telerik:GridNumericColumn DataField="MucLuong" DataFormatString="{0:#.#} VND" 
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
                <telerik:RadPageView ID="RadPageView12" runat="server">
                   Lịch sử thay đổi
                </telerik:RadPageView>
     </telerik:RadMultiPage>

</asp:Content>

<%-- footer --%>
<asp:Content ID = "Content5" ContentPlaceHolderID =footer runat=server>

    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="AjaxManager_Request">
     <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="PanelSplitter">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="PanelSplitter" LoadingPanelID="RadAjaxLoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="PanelSplitter" LoadingPanelID="RadAjaxLoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
      </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" InitialDelayTime="0" Width="100%" Height="100%">
    </telerik:RadAjaxLoadingPanel>

    <telerik:RadWindowManager ID="Singleton" runat="server">
            <Windows>
                <telerik:RadWindow ID="DialogWindow" ReloadOnShow="true" OnClientClose="OnClientclose"
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
    
    <script type="text/javascript">
    //<![CDATA[
        //show the window
        function showDialog(sender, args, args2) {
            if (args2 == "false") {
                var oWnd = window.radopen("", "RadWindow1");
                oWnd.setUrl(args);
            } else {

                var oWnd2 = window.radopen("", "DialogWindow");
                oWnd2.setUrl(args);
            }

        }
        function OnClientclose(sender, args) {
            //window.location.href = "Hoso.aspx";
            //             var masterTable = $find("<%= RadGrid1.ClientID %>").get_masterTableView();
            //             masterTable.rebind();
            $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("RebindGrid")
        }

        /*
        *   Context menu 
        */
        function ContextMenuItemClick(sender, args) {
            var menuItemValue = args.get_item().get_value();
            switch (menuItemValue) {
                case "them":
                    showDialog(sender, "ThemNhanVien.aspx", "true");
                    break;
                case "sua":
                    showDialog(sender, "Suanhanvien.aspx", "true");
                    break;
                case "xoa":
                    radconfirm("Nhân viên được chọn sẽ bị xóa, bạn chắc chứ?", xoaNhanvien);

                    break;

            }

        }

        function xoaNhanvien(arg) {
            if (arg) {
                $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("XoaNV")
            }
        }

        function RadContextMenuQTDT_Itemclick(sender, args) {
            var menuItemValue = args.get_item().get_value();
            if (menuItemValue == "sua") {
                showDialog(sender, "ThemQTLamViec.aspx", "true");
            }
        }

        function ContextMenuDT_Click(sender, args) {
            var menuItemValue = args.get_item().get_value();
            if (menuItemValue == "sua") {
                showDialog(sender, "ThemDaoTao.aspx", "true");
            }
        }

        function RadContextMenuNhanThan_Itemclick(sender, args) {
            var menuItemValue = args.get_item().get_value();
            if (menuItemValue == "sua") {
                showDialog(sender, "ThemNhanThan.aspx", "true");
            }
        }

        function RadContextMenuHD_Itemclick(sender, args) {
            var menuItemValue = args.get_item().get_value();
            if (menuItemValue == "sua") {
                showDialog(sender, "ThemHopDong.aspx", "true");
            }
        }

        /**
        // function of pager template
        **/
        function pageLoad(sender, args) {
            tableView = $find("<%= RadGrid1.ClientID %>").get_masterTableView();
        }

        function RadComboBox1_SelectedIndexChanged(sender, args) {
            tableView.set_pageSize(sender.get_value());
        }

        function changePage(argument) {

            tableView.page(argument);
        }

        function RadNumericTextBox1_ValueChanged(sender, args) {
            tableView.page(sender.get_value());
        }
    //]]>            
    </script>
</asp:Content>
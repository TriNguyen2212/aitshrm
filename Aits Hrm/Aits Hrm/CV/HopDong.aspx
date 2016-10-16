<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="HopDong.aspx.cs" Inherits="Aits_Hrm.CV.HopDong" %>

<%-- top left--%>
<asp:Content ID="left" ContentPlaceHolderID="TopLeft"  runat="server">
    <telerik:RadTreeView ID="RadTreeView1" runat="server" 
        OnNodeClick="RadTreeView1_Nodeclick" DataValueField="IDCoCauToChuc">
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
        </Targets>
        <Items>
            <telerik:RadMenuItem Text="Thêm hợp đồng..." 
                Value="Them">
            </telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" Text=" Sửa thông tin..." 
                 Value="sua" Enabled="false">
            </telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" Text="Xóa" Value="xoa" Enabled="false">
            </telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" Text="In..." Visible="false">
            </telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" Text="Đóng">
            </telerik:RadMenuItem>
        </Items>
    </telerik:RadContextMenu>
        <telerik:RadGrid ID="RadGrid1" runat="server" Height="94%" Width="100%"
        AllowFilteringByColumn="True" AllowPaging="True" PageSize="7"
        AllowSorting="True" CellSpacing="0" GridLines="None" Culture="vi-VN" EnableLinqExpressions="False" 
        AutoGenerateColumns="False" OnItemCommand="Grid_ItemCommand" onneeddatasource="Grid_NeedDataSource" >
        <GroupingSettings CaseSensitive="false" />
        <ClientSettings EnablePostBackOnRowClick="true" Scrolling-AllowScroll="true" EnableRowHoverStyle="true" AllowKeyboardNavigation="true">
            <KeyboardNavigationSettings EnableKeyboardShortcuts="false" AllowActiveRowCycle="true" />
            <ClientEvents  OnActiveRowChanged="ActiveRowChanged" />
            <Selecting AllowRowSelect="True" />
            <Resizing AllowColumnResize="True" />
            <Scrolling AllowScroll="true" UseStaticHeaders="true" />
        </ClientSettings>
        <MasterTableView ShowHeadersWhenNoRecords="true" AllowFilteringByColumn="True" DataKeyNames="IDHopDongLD">
        <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>
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
                <telerik:GridBoundColumn DataField="IDHopDongLD" UniqueName="IDHopDongLD"
                    FilterControlAltText="Filter column column" HeaderText="ID" Visible="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SoHD" FilterControlWidth="100%"
                    FilterControlAltText="Filter SoHD column" HeaderText="Số HĐ" UniqueName="SoHD"
                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false" >
                    <HeaderStyle Width="140px" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="NguoiLaoDong" FilterControlWidth="100%"
                    FilterControlAltText="Filter NguoiLaoDong column" HeaderText="Người Lao động" UniqueName="NguoiLaoDong"
                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false" >
                   <HeaderStyle Width="140px" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="LoaiHD" FilterControlWidth="100%" SortExpression="LoaiHD" 
                    FilterControlAltText="Filter LoaiHD column" HeaderText="Loại HĐ" UniqueName="LoaiHD"
                    CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true" ShowFilterIcon="false">
                    <HeaderStyle Width="125px" />
                    <FilterTemplate>
                        <telerik:RadComboBox runat="server" ID="filterCboLoaiHD" DataSourceID="EntitiesLoaiHD" ShowToggleImage="true"
                          DataValueField="LoaiHopDong1" DataTextField="LoaiHopDong1" AppendDataBoundItems="true" Width="100%"
                          SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("LoaiHD").CurrentFilterValue %>'                          
                          OnClientSelectedIndexChanged ="function(sender,args){filterCboChange1(sender, args, 'LoaiHD')}">
                            <Items>
                                <telerik:RadComboBoxItem Value="" Text=""/>
                            </Items>
                        </telerik:RadComboBox>
                    </FilterTemplate>
                </telerik:GridBoundColumn>
                <telerik:GridDateTimeColumn DataField="NgayKyHD" DataFormatString="{0:d}" FilterDateFormat="dd/MM/yyyy"
                    PickerType="DatePicker" FilterControlAltText="Filter NgayKyHD column" HeaderText="Ngày Kí HĐ"
                    UniqueName="NgayKyHD" AutoPostBackOnFilter="True" CurrentFilterFunction="EqualTo">
                    <FilterTemplate>
                        <telerik:RadDatePicker ID="NgayKyHDPicker" runat="server"
                            ClientEvents-OnDateSelected="DateSelected1"
                            DbSelectedDate='<%# SetNgay(Container,"NgayKyHD") %>' />
                        <telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">
                            <script type="text/javascript">
                                function DateSelected1(sender, args) {
                                    var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                    var date = FormatSelectedDate(sender);
                                    tableView.filter("NgayKyHD", date, "EqualTo");
                                }
                                function FormatSelectedDate(picker) {
                                    var date = picker.get_selectedDate();
                                    var dateInput = picker.get_dateInput();
                                    var formattedDate = dateInput.get_dateFormatInfo().FormatDate(date, dateInput.get_displayDateFormat());
                                    return formattedDate;
                                }
                            </script>
                        </telerik:RadScriptBlock>
                    </FilterTemplate>
                    <HeaderStyle Width="80px" />
                </telerik:GridDateTimeColumn>
                <telerik:GridDateTimeColumn DataField="TuNgay" DataFormatString="{0:d}" FilterDateFormat="dd/MM/yyyy"
                    FilterControlAltText="Filter TuNgay column" HeaderText="Từ ngày" PickerType="DatePicker"
                    UniqueName="TuNgay" AutoPostBackOnFilter="True" CurrentFilterFunction="EqualTo">
                    <FilterTemplate>
                        <telerik:RadDatePicker ID="TuNgayPicker" runat="server"
                            ClientEvents-OnDateSelected="DateSelected2"
                            DbSelectedDate='<%# SetNgay(Container,"TuNgay") %>' />
                        <telerik:RadScriptBlock ID="RadScriptBlock3" runat="server">
                            <script type="text/javascript">
                                function DateSelected2(sender, args) {
                                    var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                    var date = FormatSelectedDate(sender);
                                    tableView.filter("TuNgay", date, "EqualTo");
                                }
                            </script>
                        </telerik:RadScriptBlock>
                    </FilterTemplate>
                     <HeaderStyle Width="80px" />
                </telerik:GridDateTimeColumn>
                <telerik:GridDateTimeColumn DataField="Denngay" DataFormatString="{0:d}" FilterDateFormat="dd/MM/yyyy"
                    FilterControlAltText="Filter Denngay column" HeaderText="Đến ngày" PickerType="DatePicker"
                    UniqueName="DenNgay" AutoPostBackOnFilter="True" CurrentFilterFunction="EqualTo">
                    <FilterTemplate>
                        <telerik:RadDatePicker ID="DenNgayPicker" runat="server"
                            ClientEvents-OnDateSelected="DateSelected3"
                            DbSelectedDate='<%# SetNgay(Container,"DenNgay") %>' />
                        <telerik:RadScriptBlock ID="RadScriptBlock4" runat="server">
                            <script type="text/javascript">
                                function DateSelected3(sender, args) {
                                    var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                    var date = FormatSelectedDate(sender);
                                    tableView.filter("DenNgay", date, "EqualTo");
                                }
                            </script>
                        </telerik:RadScriptBlock>
                    </FilterTemplate>
                     <HeaderStyle Width="80px" />
                </telerik:GridDateTimeColumn>
                <telerik:GridBoundColumn DataField="TrinhDoChuyenMon" FilterControlWidth="100%"
                    FilterControlAltText="Filter TrinhDoChuyenMon column" HeaderText="Trình độ chuyên môn" 
                    UniqueName="TrinhDoChuyenMon">
                    <HeaderStyle Width="160px" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="ChucDanh" FilterControlWidth="100%" SortExpression="ChucDanh"
                    FilterControlAltText="Filter ChucDanh column" HeaderText="Chức Danh" UniqueName="ChucDanh"                    
                    CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true" ShowFilterIcon="false">
                    <FilterTemplate>
                        <telerik:RadComboBox runat="server" ID="filterCboChucDanh" DataSourceID="EntitiesChucDanh" ShowToggleImage="true"
                          DataValueField="TenChucDanh" DataTextField="TenChucDanh" AppendDataBoundItems="true" Width="100%"
                          SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("ChucDanh").CurrentFilterValue %>'
                          OnClientSelectedIndexChanged="function(sender,args){filterCboChange1(sender, args, 'ChucDanh')}" >
                            <Items>
                                <telerik:RadComboBoxItem Value="" Text="" />
                            </Items>
                        </telerik:RadComboBox>
                        <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
                            <script type="text/javascript">
                                function filterCboChange1(sender, args, column) {
                                    var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                    var selVal = args.get_item().get_value();
                                    tableView.filter(column, selVal, "EqualTo");
                                }
                            </script>
                        </telerik:RadScriptBlock>
                    </FilterTemplate>
                    <HeaderStyle Width="120px" />
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="PhuCapCV" HeaderStyle-Width="75px" 
                    FilterControlAltText="Filter PhuCapCV column" FilterControlWidth="100%" 
                    HeaderText="Phụ cấp" UniqueName="PhuCapCV">
                    <ItemTemplate>
                        <asp:Label ID="PhuCapCVLabel" runat="server"><%# Eval("PhuCapCV", "{0:#,#}")%>₫</asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="MucHuong"
                    FilterControlAltText="Filter MucHuong column"
                    HeaderText="Mức hưởng" UniqueName="MucHuong">
                    <FilterTemplate>
                        <telerik:RadComboBox runat="server" ID="filterCboMucHuong" ShowToggleImage="true"
                          AppendDataBoundItems="true" Width="100%"
                          SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("MucHuong").CurrentFilterValue %>'
                          OnClientSelectedIndexChanged="function(sender,args){filterCboChange1(sender, args, 'MucHuong')}" >
                            <Items>
                                <telerik:RadComboBoxItem Value="" Text="" />
                                <telerik:RadComboBoxItem Value="85" Text="85%" />
                                <telerik:RadComboBoxItem Value="100" Text="100%" />
                            </Items>
                        </telerik:RadComboBox>
                    </FilterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="MucHuongLabel" runat="server"><%# Eval("MucHuong") %>%</asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Width="55px"></HeaderStyle>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="MucLuongToiThieu" HeaderStyle-Width="75px"
                    FilterControlAltText="Filter MucLuongToiThieu column" FilterControlWidth="100%" 
                    HeaderText="Mức lương tối thiểu" UniqueName="MucLuongToiThieu">
                    <ItemTemplate>
                        <asp:Label ID="MucLuongToiThieuLabel" runat="server"><%# Eval("MucLuongToiThieu", "{0:#,#}") %>₫</asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
            </Columns>
        <EditFormSettings>
        <EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
        </EditFormSettings>
            <PagerStyle AlwaysVisible="True" />
        </MasterTableView>
        <FilterMenu EnableImageSprites="False"></FilterMenu>
  </telerik:RadGrid>
  
  <asp:EntityDataSource runat="server" ConnectionString="name=QuanLyNhanSuEntities" 
        DefaultContainerName="QuanLyNhanSuEntities" EnableFlattening="False" 
        EntitySetName="LoaiHopDongs" ContextTypeName="Aits_Hrm.Model.QuanLyNhanSuEntities"
        Select="it.[LoaiHopDong1]" ID="EntitiesLoaiHD">
    </asp:EntityDataSource>
    <asp:EntityDataSource runat="server" ID="EntitiesChucDanh" 
        ConnectionString="name=QuanLyNhanSuEntities" ContextTypeName="Aits_Hrm.Model.QuanLyNhanSuEntities"
        DefaultContainerName="QuanLyNhanSuEntities" EnableFlattening="False" 
        EntitySetName="ChucDanhs" Select="it.[TenChucDanh]">
    </asp:EntityDataSource>
</asp:Content>

<%-- bottom right--%>
<asp:Content ID="Content2" ContentPlaceHolderID="BottomRight" runat="server">

    <telerik:RadFormDecorator ID="FormDecorator1" runat="server" DecoratedControls="all"></telerik:RadFormDecorator>
    <telerik:RadTabStrip ID="RadTabStrip1" runat="server" SelectedIndex="0" 
    MultiPageID="RadMultiPage1" ScrollChildren="True" PerTabScrolling="True" 
        ReorderTabsOnSelect="True" ScrollButtonsPosition="Middle">
        <Tabs>
            <telerik:RadTab runat="server" Text="Thông tin hợp đồng" PerTabScrolling="True" 
                ScrollButtonsPosition="Left" ScrollChildren="True">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Phụ lục hợp đồng" PerTabScrolling="True" 
                ScrollButtonsPosition="Left" ScrollChildren="True">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>

    <telerik:RadContextMenu ID="RadContextMenu3" runat="server" OnClientItemClicked="ContextMenuItemClick">
                        <Targets>
                            <telerik:ContextMenuControlTarget ControlID="RadPageView2"/>
                        </Targets>
                        <Items>
                            <telerik:RadMenuItem runat="server" Text="Xem chi tiết..." Value="sua">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Đóng">
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadContextMenu>

    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" CssClass="pageView"
                Width="100%">
                <telerik:RadPageView ID="RadPageView2" runat="server">
                        <table width="100%">
                            <tr>
                                <td rowspan="10" style="width:15%;">
                                    <telerik:RadBinaryImage ID="ImageEmp" runat="server" ResizeMode="Fit" Height="150px" ImageAlign="Middle" Width="100px" />
                                </td>
                            </tr>
                             <tr>
                                <td><asp:Label ID="SoHD" AssociatedControlID="lbSoHD" runat="server" Text="Số hợp đồng: " /></td>
                                <td><asp:Label ID="lbSoHD" CssClass="rfdAspLabel" runat="server" Font-Bold="true" Text="" /></td>
                            </tr>
                            <tr>
                                <td style="width:15%;"><asp:Label ID="NguoiDaiDien" AssociatedControlID="lbNguoiDaiDien" runat="server" Text="Người sử dụng LĐ: " /></td>
                                <td style="width:22%;"><asp:Label ID="lbNguoiDaiDien" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                                <td style="width:15%;"><asp:Label ID="DonVi" AssociatedControlID="lbDonVi" runat="server" Text="Đơn vị: " /></td>
                                <td style="width:23%;"><asp:Label ID="lbDonVi" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                            </tr>
                            <tr>
                                <td><asp:Label ID="NguoiLaoDong" AssociatedControlID="lbNguoiLD" runat="server" Text="Người lao động: " /></td>
                                <td><asp:Label ID="lbNguoiLD" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                                <td><asp:Label ID="TrinhDoChuyenMon" AssociatedControlID="lbTrinhDo" runat="server" Text="Trình độ chuyên môn: " /></td>
                                <td colspan="3"><asp:Label ID="lbTrinhDo" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                            </tr>
                            <tr>
                                <td><asp:Label ID="LoaiHD" AssociatedControlID="lbLoaiHD" runat="server" Text="Loại hợp đồng: " /></td>
                                <td><asp:Label ID="lbLoaiHD" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                                <td><asp:Label ID="NgayKy" AssociatedControlID="lbNgayKy" runat="server" Text="Ngày ký: " /></td>
                                <td><asp:Label ID="lbNgayKy" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                            </tr>
                            <tr>
                                <td><asp:Label ID="NgayHieuLuc" AssociatedControlID="lbNgaycoHieuLuc" runat="server" Text="Ngày có hiệu lực: " /></td>
                                <td><asp:Label ID="lbNgaycoHieuLuc" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                                <td><asp:Label ID="NgayHetHieuLuc" AssociatedControlID="lbNgayHetHieuLuc" runat="server" Text="Ngày hết hiệu lực: " /></td>
                                <td><asp:Label ID="lbNgayHetHieuLuc" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                                                               
                            </tr>
                            <tr>
                                <td><asp:Label ID="ChucDanhChuyenMon" AssociatedControlID="lbChucDanhChuyenMon" runat="server" Text="Chức danh chuyên môn: " /></td>
                                <td><asp:Label ID="lbChucDanhChuyenMon" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                                <td><asp:Label ID="ChucDanhCongViec" AssociatedControlID="lbChucDanhCongViec" runat="server" Text="Chức danh công việc: " /></td>
                                <td><asp:Label ID="lbChucDanhCongViec" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                            </tr>
                            <tr>
                                <td><asp:Label ID="Ngach" AssociatedControlID="lbNgach" runat="server" Text="Ngạch: " /></td>
                                <td><asp:Label ID="lbNgach" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                                <td><asp:Label ID="Bac" AssociatedControlID="lbBac" runat="server" Text="Bậc: " /></td>
                                <td><asp:Label ID="lbBac" CssClass="rfdAspLabel" runat="server" Text="" /></td>                                
                            </tr>
                            <tr>
                                <td><asp:Label ID="MucHuong" AssociatedControlID="txtMucHuong" runat="server" Text="Mức hưởng: " /></td>
                                <td><asp:Label ID="txtMucHuong" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                                <td><asp:Label ID="LuongBHXH" AssociatedControlID="lbLuongBHXH" runat="server" Text="Mức lương BHXH: " /></td>
                                <td><asp:Label ID="lbLuongBHXH" CssClass="rfdAspLabel" runat="server" Text="" /></td>
                            </tr>
                            
                        </table>
                </telerik:RadPageView>
               
                <telerik:RadPageView ID="RadPageView4" runat="server">
                     <telerik:RadContextMenu ID="RadContextMenuPhuLucHD" runat="server" OnClientItemClicked="RadContextMenuPhuLucHD_Itemclick">
                        <Targets>
                            <telerik:ContextMenuControlTarget ControlID="RadGridPhuLucHD"/>
                        </Targets>
                        <Items>
                            <telerik:RadMenuItem runat="server" Text="Xem chi tiết..." Value="sua">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Đóng">
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadContextMenu>
                    <telerik:RadGrid ID="RadGridPhuLucHD" runat="server" OnItemCommand="RadGridPhuLucHD_OnItemCommand"
                        AutoGenerateColumns="False" CellSpacing="0" GridLines="None">
                        <MasterTableView AutoGenerateColumns="False">
                            <NoRecordsTemplate><center><Strong>Không có dữ liệu</Strong></center></NoRecordsTemplate>
                            <CommandItemSettings ExportToPdfText="Export to PDF" />
                            <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" 
                                Visible="True">
                            </RowIndicatorColumn>
                            <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" 
                                Visible="True">
                            </ExpandCollapseColumn>
                            <Columns>
                                <telerik:GridBoundColumn DataField="SoPhuLuc" 
                                    FilterControlAltText="Filter  column" HeaderText="Số phụ lục" 
                                    UniqueName="SoPhuLuc">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="SoHD" 
                                    FilterControlAltText="Filter NamSinh column" HeaderText="Số hợp đồng" 
                                    UniqueName="SoHD">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TenPhuLuc" 
                                    FilterControlAltText="Filter NgheNghiep column" HeaderText="Tên phụ lục" 
                                    UniqueName="TenPhuLuc">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="NgayHieuLuc" 
                                    FilterControlAltText="Filter Quanhe column" HeaderText="Ngày hiệu lực"
                                     DataFormatString="{0:dd/MM/yyyy}" UniqueName="NgayHieuLuc">
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
                ShowContentDuringLoad="false" Opacity="80"
                    BackColor="Gray" Modal="true" runat="server" 
                     Width="1062px" Height="486px" 
                    Behavior="Close, Maximize, Move, Reload" 
                    Behaviors="Close, Maximize, Move, Reload" >
                </telerik:RadWindow>
                  <telerik:RadWindow ID="RadWindow1" ReloadOnShow="true" ShowContentDuringLoad="false" 
                    Opacity="80"
                    BackColor="Gray" Modal="true" runat="server" 
                     Width="1062px" Height="486px" 
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
                case "Them":
                    showDialog(sender, "ThemHopDong.aspx", "true");
                    break;
                case "sua":
                    showDialog(sender, "SuaHopDong.aspx", "true");
                    break;
                case "xoa":
                    radconfirm("Hợp đồng được chọn sẽ bị xóa, bạn chắc chứ?", xoaHopDong);
                    break;
            }

        }

        function xoaHopDong(arg) {
            if (arg) {
                $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("XoaHD")
            }
        }

        function RadContextMenuQTDT_Itemclick(sender, args) {
            var menuItemValue = args.get_item().get_value();
            if (menuItemValue == "sua") {
                showDialog(sender, "SuaQTLamViec.aspx", "false");
            }
        }

        function ContextMenuDT_Click(sender, args) {
            var menuItemValue = args.get_item().get_value();
            if (menuItemValue == "sua") {
                showDialog(sender, "SuaDaoTao.aspx", "false");
            }
        }

        function RadContextMenuNhanThan_Itemclick(sender, args) {
            var menuItemValue = args.get_item().get_value();
            if (menuItemValue == "sua") {
                showDialog(sender, "SuaNhanThan.aspx", "false");
            }
        }

        function RadContextMenuHD_Itemclick(sender, args) {
            var menuItemValue = args.get_item().get_value();
            if (menuItemValue == "sua") {
                showDialog(sender, "SuaHopDong.aspx", "false");
            }
        }

        function RadContextMenuPhuLucHD_Itemclick(sender, args) {
            var menuItemValue = args.get_item().get_value();
            if (menuItemValue == "sua") {
                showDialog(sender, "ThemPhuLucHD.aspx", "true");
            }
        }

        var tmout;
        var selitm;
        function ActiveRowChanged(sender, args) {
            var a = args;
            var e = a.get_domEvent();
            if (e == null || !e.keyCode || selitm == a.get_id()) return true;
            selitm = a.get_id();
            clearTimeout(tmout);
            tmout = setTimeout(function () {
                $get(a.get_id()).click();
            }, 800);
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


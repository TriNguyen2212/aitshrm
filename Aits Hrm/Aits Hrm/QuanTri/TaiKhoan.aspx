<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="TaiKhoan.aspx.cs" Inherits="Aits_Hrm.QuanTri.TaiKhoan" %>
<%-- top left--%>
<asp:Content ID="left" ContentPlaceHolderID="TopLeft"  runat="server">
   <asp:Panel ID="MenuPanel" runat="server" >
         <telerik:RadMenu ID="RadMenu1" runat="server" CssClass="Menu" Width="100%" Height="100%"
                 ClickToOpen="True" OnClientItemClicked="RadMenu2_ClientItemClicked" Flow="Vertical"
                 Skin="Transparent" style="z-index:1; top: 0px; left: 0px;">
           <Items>
                <telerik:RadMenuItem runat="server" Text="Dân tộc" Value="dantoc" PostBack="false" />
                <telerik:RadMenuItem runat="server" Text="Tôn giáo" Value="tongiao" PostBack="false" />
                <telerik:RadMenuItem runat="server" Text="Quốc Tịch" Value="quoctich" PostBack="false" />
                <telerik:RadMenuItem runat="server" Text="Tình trạng hôn nhân" Value="honnhan" PostBack="false" />
                <telerik:RadMenuItem runat="server" Text="Quan hệ nhân thân" Value="nhanthan" PostBack="false" />
                <telerik:RadMenuItem runat="server" Text="Loại hình đào tạo" Value="loaihinh" PostBack="false" />
                <telerik:RadMenuItem runat="server" Text="Trình độ đào tạo" Value="trinhdo" PostBack="false" />
                <telerik:RadMenuItem runat="server" Text="Loại chứng chỉ" Value="chungchi" PostBack="false" />
                <telerik:RadMenuItem runat="server" Text="Chuyên ngành đào tạo" Value="chuyennganh" PostBack="false" />
                <telerik:RadMenuItem runat="server" Text="Đơn vị đào tạo" Value="donvi" PostBack="false" />
                <telerik:RadMenuItem runat="server" Text="Loại bằng đào tạo" Value="loaibang" PostBack="false" />
                <telerik:RadMenuItem runat="server" Text="Loại hợp đồng" Value="loaihopdong" PostBack="false" />
                <telerik:RadMenuItem runat="server" Text="Bậc ngạch" Value="bacngach" PostBack="false" />
                <telerik:RadMenuItem runat="server" Text="Chức danh chuyên môn" Value="chucdanhchuyenmon" PostBack="false" />
                <telerik:RadMenuItem runat="server" Text="Chức danh công việc" Value="chucdanhcongviec" PostBack="false" />
                <telerik:RadMenuItem runat="server" Text="Cấp tổ chức" Value="captochuc" PostBack="false" />
                <telerik:RadMenuItem runat="server" Text="Loại nghỉ" Value="loainghi" PostBack="false" />
                <telerik:RadMenuItem runat="server" Text="Đơn giá XLCT" Value="dongiaxlct" PostBack="false" Visible="false" />
             </Items>     
        </telerik:RadMenu>
    </asp:Panel>
</asp:Content>
<%-- botttom left--%>
<asp:Content ID="Content3" ContentPlaceHolderID="BottomLeft" runat="server">
</asp:Content>

<%-- top right (grid view)--%>
<asp:Content ID="Content1" ContentPlaceHolderID="TopRight" runat="server">
    <telerik:RadContextMenu ID="RadContextMenu1" runat="server"
     OnClientItemClicked="ContextMenuItemClick">
        <Targets>
            <telerik:ContextMenuControlTarget ControlID="RadGrid1" />
            <telerik:ContextMenuControlTarget ControlID="RadPageView2"/>
            <telerik:ContextMenuControlTarget ControlID="RadPageView3"/>
        </Targets>
        <Items>
            <telerik:RadMenuItem Text="Thêm tài khoản..." 
                Value="Them" ImageUrl="../Images/them.png">
            </telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" Text=" Sửa thông tin..." 
                 Value="sua"  ImageUrl="../Images/sua.png">
            </telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" Text="Xóa" Value="xoa"  ImageUrl="../Images/xoa2.png">
            </telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" Text="Đóng">
            </telerik:RadMenuItem>
        </Items>
    </telerik:RadContextMenu>
    <asp:Panel ID="Panel1" runat="server" Height="100%">
        <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="True" 
            Height="94%" Width="100%" onneeddatasource="Grid_NeedDataSource"
            AllowSorting="True" CellSpacing="0" AllowPaging="True" GridLines="None" Culture="vi-VN"
            EnableLinqExpressions="False" AutoGenerateColumns="False" OnItemCommand="Grid_ItemCommand">
            <GroupingSettings CaseSensitive="false" />
            <ClientSettings EnablePostBackOnRowClick="true" EnableRowHoverStyle="true" AllowKeyboardNavigation="true">
                <KeyboardNavigationSettings EnableKeyboardShortcuts="false" AllowActiveRowCycle="true" />
                <ClientEvents  OnActiveRowChanged="ActiveRowChanged" />
                <Selecting AllowRowSelect="True" />
                <Resizing AllowColumnResize="True" />
                <Scrolling AllowScroll="true" UseStaticHeaders="true" />
            </ClientSettings>
            <MasterTableView ShowHeadersWhenNoRecords="true" AllowFilteringByColumn="True" DataKeyNames="IDDangNhap">
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
                <telerik:GridBoundColumn DataField="IDDangNhap" HeaderText="ID"
                    FilterControlAltText="Filter IDDangNhap column" Visible="false"
                    UniqueName="IDDangNhap">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="IDNhanVien" Visible="false"
                    FilterControlAltText="Filter IDNhanVien column" HeaderText="ID" 
                    UniqueName="IDNhanVien">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="MaNV" UniqueName="MaNV" FilterControlWidth="100%"
                    FilterControlAltText="Filter MaNV column" HeaderText="Mã NV" 
                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false">
                    <HeaderStyle Width="60px" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Username" FilterControlWidth="100%"
                    FilterControlAltText="Filter Username column" HeaderText="Tên đăng nhập" UniqueName="Username"
                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false">
                    <HeaderStyle Width="160px" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="TenNV" FilterControlWidth="100%"
                    FilterControlAltText="Filter TenNV column" HeaderText="Tên nhân viên" UniqueName="TenNV"
                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false">
                    <HeaderStyle Width="160px" />
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="DuocDangNhap" HeaderStyle-Width="60px" ShowFilterIcon="false"
                    FilterControlAltText="Filter DuocDangNhap column" HeaderText="Đăng nhập" UniqueName="DuocDangNhap">
                    <FilterTemplate>
                        <telerik:RadComboBox runat="server" ID="filterCboDangNhap" ShowToggleImage="true"
                          AppendDataBoundItems="true" Width="100%"
                          SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("DuocDangNhap").CurrentFilterValue %>'                          
                          OnClientSelectedIndexChanged ="function(sender,args){filterCboChange(sender, args, 'DuocDangNhap')}">
                            <Items>
                                <telerik:RadComboBoxItem Value="" Text=""/>
                                <telerik:RadComboBoxItem Value="True" Text="Có"/>
                                <telerik:RadComboBoxItem Value="False" Text="Không"/>
                            </Items>
                        </telerik:RadComboBox>
                        <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
                              <script type="text/javascript">
                                  function filterCboChange(sender, args, column) {
                                      var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                      var selVal = args.get_item().get_value();
                                      tableView.filter(column, selVal, "EqualTo");
                                  }
                              </script>
                        </telerik:RadScriptBlock>
                    </FilterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="DuocDangNhapLabel" runat="server"><%# Eval("DuocDangNhap").ToString()=="True"?"Có":"Không"%></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Width="60px" />
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="LaNhanVien" Visible="false"
                    FilterControlAltText="Filter LaNhanVien column" HeaderText="Là nhân viên" 
                    UniqueName="LaNhanVien">
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
    <telerik:RadTabStrip ID="RadTabStrip1" runat="server" SelectedIndex="9" 
        MultiPageID="RadMultiPage1" ScrollChildren="True" PerTabScrolling="True" 
        ReorderTabsOnSelect="True" ScrollButtonsPosition="Middle">
        <Tabs>
            <telerik:RadTab runat="server" Text="Thông tin chung" PerTabScrolling="True" Selected="true"
                ScrollButtonsPosition="Left" ScrollChildren="True">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage ID="RadMultiPage2" runat="server" SelectedIndex="0" CssClass="pageView"
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
                    <td><asp:Label ID="lbNoiCapCMND" AssociatedControlID="lbNoiCapCMND" runat="server" Text="Nơi cấp CMND: " /></td>
                    <td><asp:Label ID="Label7" CssClass="rfdAspLabel" runat="server" Text="" /></td>                                
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
    </telerik:RadMultiPage>
</asp:Content>

<%-- footer --%>
<asp:Content ID = "Content5" ContentPlaceHolderID="footer" runat="server">
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
                <telerik:RadWindow ID="DialogWindow" ReloadOnShow="true" 
                     VisibleTitlebar="false" VisibleStatusbar="false"
                    OnClientClose="OnClientclose"
                    BackColor="Gray" Modal="true" runat="server" 
                     Width="1062px" Height="586px"
                    Behavior="Close, Maximize, Move, Reload" 
                    Behaviors="Close, Maximize, Move, Reload" >
                </telerik:RadWindow>
                  <telerik:RadWindow ID="RadWindow1" ReloadOnShow="true"
                  VisibleTitlebar="false" VisibleStatusbar="false"
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
            $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("RebindGrid")
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

        /*Context menu*/
        function ContextMenuItemClick(sender, args) {
            var menuItemValue = args.get_item().get_value();
            switch (menuItemValue) {
                case "Them":
                    showDialog(sender, "ThemTaiKhoan.aspx", "true");
                    break;
                case "sua":
                    showDialog(sender, "SuaTaiKhoan.aspx", "true");
                    break;
                case "xoa":
                    radconfirm("Tài khoản được chọn sẽ bị xóa, bạn chắc chứ?", xoaNhanvien);
                    break;
            }
        }

        function xoaNhanvien(arg) {
            if (arg) {
                $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("XoaNV");
            }
        }

        function RadMenu2_ClientItemClicked(sender, eventArgs) {
            var item = eventArgs.get_item();
            switch (item.get_value()) {
                case "doimk":
                    showDialogDanhMuc("~/QuanTri/DoiMK.aspx");
                    break;
                case "dantoc":
                    showDialogDanhMuc("../Category/QLDanToc.aspx");
                    break;
                case "tongiao":
                    showDialogDanhMuc("../Category/QLTonGiao.aspx");
                    break;
                case "quoctich":
                    showDialogDanhMuc("../Category/QLQuocTich.aspx");
                    break;
                case "honnhan":
                    showDialogDanhMuc("../Category/QLTTHonNhan.aspx");
                    break;
                case "nhanthan":
                    showDialogDanhMuc("../Category/QLQHNhanThan.aspx");
                    break;
                case "loaihinh":
                    showDialogDanhMuc("../Category/QLLoaiHinhDT.aspx");
                    break;
                case "trinhdo":
                    showDialogDanhMuc("../Category/QLTrinhDoDT.aspx");
                    break;
                case "chungchi":
                    showDialogDanhMuc("../Category/QLChungChi.aspx");
                    break;
                case "chuyennganh":
                    showDialogDanhMuc("../Category/QLChuyenNganhDT.aspx");
                    break;
                case "donvi":
                    showDialogDanhMuc("../Category/QLDonViDT.aspx");
                    break;
                case "loaibang":
                    showDialogDanhMuc("../Category/QLLoaiBangDT.aspx");
                    break;
                case "loaihopdong":
                    showDialogDanhMuc("../Category/QLLoaiHopDong.aspx");
                    break;
                case "bacngach":
                    showDialogDanhMuc("../Category/QLBacNgach.aspx");
                    break;
                case "chucdanhchuyenmon":
                    showDialogDanhMuc("../Category/QLChucDanhChuyenMon.aspx");
                    break;
                case "chucdanhcongviec":
                    showDialogDanhMuc("../Category/QLChucDanhCongViec.aspx");
                    break;
                case "captochuc":
                    showDialogDanhMuc("../Category/QLCapToChuc.aspx");
                    break;
                case "loainghi":
                    showDialogDanhMuc("../Category/QLLoaiNghi.aspx");
                    break;
            }
        }
    //]]>            
    </script>
</asp:Content>



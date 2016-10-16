<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PhanQuyen.aspx.cs" Inherits="Aits_Hrm.QuanTri.PhanQuyen" %>
<%-- top left --%>
<asp:Content ID="Content1" ContentPlaceHolderID="TopLeft" runat="server">
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
</asp:Content>
<%-- bottom left --%>
<asp:Content ID="Content2" ContentPlaceHolderID="BottomLeft" runat="server" >

</asp:Content>

<%-- top right --%>
<asp:Content ID="Content3" ContentPlaceHolderID="TopRight" runat="server"> 
<telerik:RadFormDecorator ID="RadFormDecorator1" runat="server" DecoratedControls="all" />

         <telerik:RadSplitter ID="RadSplitterLeft" runat="server">
            <telerik:RadPane ID="RadPane1" runat="server">
                <asp:Label ID="lbNhomQuyen" CssClass="rfdAspLabel" runat="server" Font-Bold="true" Text="Nhóm quyền" />
                <telerik:RadTreeView ID="RadTreeViewNhomQuyen" runat="server" DataValueField="IDNhomQuyen" DataTextField="TenNhomQuyen"
                    OnNodeClick="RadTreeViewNhomQuyen_Nodeclick">
                    <DataBindings>
                        <telerik:RadTreeNodeBinding Expanded ="True" SelectedImageUrl="../Images/icon_hostusers_16px.gif"
                            ExpandedImageUrl="../Images/icon_hostusers_16px.gif"/>
                    </DataBindings>
                </telerik:RadTreeView>
                <telerik:RadContextMenu ID="RadContextMenu2" runat="server" OnClientItemClicked="RadContextMenu2_ClientClicked">
                    <Targets>
                        <telerik:ContextMenuControlTarget ControlID="RadTreeViewNhomQuyen" />
                    </Targets>
                    <Items>
                        <telerik:RadMenuItem runat="server" Text="Quản lý danh mục nhóm" Value="danhmuc">
                        </telerik:RadMenuItem>
                        <telerik:RadMenuItem runat="server" Text="Đóng">
                        </telerik:RadMenuItem>
                    </Items>
                </telerik:RadContextMenu>
            </telerik:RadPane>

            <telerik:RadSplitBar ID="RadSplitbar1" runat="server" CollapseMode="None" Width="5px"></telerik:RadSplitBar>

            <telerik:RadPane ID="LeftPane1" runat="server">
                <asp:Label ID="Label1" CssClass="rfdAspLabel" runat="server" Font-Bold="true" Text="Chức năng" />
                <telerik:RadTreeView ID="RadTreeViewChucNang" runat="server" 
                    OnNodeClick="RadTreeViewChucNang_Nodeclick">
                    <DataBindings>
                        <telerik:RadTreeNodeBinding Expanded ="True" SelectedImageUrl="../Images/icon_hostusers_16px.gif"
                            ExpandedImageUrl="../Images/icon_hostusers_16px.gif"/>
                    </DataBindings>
                </telerik:RadTreeView>
            </telerik:RadPane>

            <telerik:RadSplitBar ID="RadSplitbar2" runat="server" CollapseMode="None" Width="5px"></telerik:RadSplitBar>

            <telerik:RadPane ID="LeftPane2" runat="server">
            <asp:Label ID="Label2" CssClass="rfdAspLabel" runat="server" Font-Bold="true" Text="Quyền" />
            <table>
                <tr>
                    <td>
                        <asp:CheckBoxList ID="cblQuyen" runat="server" DataTextField="TenQuyen" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadButton ID="btnSaveQuyen" runat="server" Text="Lưu lại" onclick="btnSaveQuyen_Click" />
                    </td>
                </tr>
            </table>
        </telerik:RadPane>
    </telerik:RadSplitter>
</asp:Content>

<%-- bottom right --%>
<asp:Content ID="Content4" ContentPlaceHolderID="BottomRight" runat="server">
    <asp:Label ID="lbDSTaiKhoan" CssClass="rfdAspLabel" runat="server" Font-Bold="true" Text="Danh sách tài khoản trong nhóm quyền" />
    <telerik:RadGrid ID="GridUserQuyen" runat="server" CellSpacing="0" Height="91%"
        AllowPaging="True" PagerStyle-Mode="NumericPages" AllowSorting="True" Culture="vi-VN" AutoGenerateColumns="False" 
        onneeddatasource="Grid_NeedDataSource" OnItemCommand="Grid_ItemCommand" >
        <ClientSettings AllowColumnsReorder="true" EnableRowHoverStyle="true"
            ReorderColumnsOnClient="true" EnablePostBackOnRowClick="true" Resizing-AllowColumnResize="true">
            <Selecting AllowRowSelect="True" />
            <Resizing AllowColumnResize="True" />
        </ClientSettings>
        <MasterTableView GridLines="None" ShowFooter="false">
        <HeaderStyle/>
        <NoRecordsTemplate>
            <div><center><strong>Không có dữ liệu</strong></center></div>
        </NoRecordsTemplate>
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
                UniqueName="IDNhanVien" Visible="False">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="MaNV"
                FilterControlAltText="Filter MaNV column" HeaderText="Mã NV" UniqueName="MaNV">
                <HeaderStyle Width="160px" />
            </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Username" 
                    FilterControlAltText="Filter Username column" HeaderText="Tên đăng nhập" 
                    UniqueName="Username">
                 <HeaderStyle Width="150px" />
            </telerik:GridBoundColumn>            
            <telerik:GridBoundColumn DataField="TenNV"
                FilterControlAltText="Filter TenNV column" HeaderText="Tên nhân viên" UniqueName="TenNV">
                <HeaderStyle Width="150px" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="NhomQuyen"
                FilterControlAltText="Filter NhomQuyen column" HeaderText="Nhóm Quyền" UniqueName="NhomQuyen">
                <HeaderStyle Width="150px" />
            </telerik:GridBoundColumn>
            <telerik:GridTemplateColumn DataField="DuocDangNhap" HeaderStyle-Width="60px"
                FilterControlAltText="Filter DuocDangNhap column" HeaderText="Đăng nhập" UniqueName="DuocDangNhap">                    
                <ItemTemplate>
                    <asp:Label ID="DuocDangNhapLabel" runat="server"><%# Eval("DuocDangNhap").ToString()=="True"?"Có":"Không"%></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="60px" />
            </telerik:GridTemplateColumn>
            <telerik:GridBoundColumn DataField="LaNhanVien" Visible="false"
                FilterControlAltText="Filter LaNhanVien column" HeaderText="Là nhân viên" UniqueName="LaNhanVien">
                <HeaderStyle Width="160px" />
            </telerik:GridBoundColumn>            
        </Columns>
           <EditFormSettings>
    <EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
    </EditFormSettings>
        </MasterTableView>
        <FilterMenu EnableImageSprites="False"></FilterMenu>
  </telerik:RadGrid>
     <telerik:RadContextMenu ID="RadContextMenuUserQuyen" runat="server" OnClientItemClicked="RadContextMenuUserQuyen_Click">
        <Targets>
            <telerik:ContextMenuControlTarget ControlID="GridUserQuyen" />
        </Targets>
        <Items>
            <telerik:RadMenuItem runat="server" Text="Thêm user vào nhóm..." Value="them" ImageUrl="../Images/them.png">
            </telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" Text="Chuyển user được chọn..." Value="chuyen" ImageUrl="../Images/sua.png">
            </telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" Text="Gỡ user được chọn..." Value="xoa" ImageUrl="../Images/xoa2.png">
            </telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" Text="Đóng">
            </telerik:RadMenuItem>
        </Items>
    </telerik:RadContextMenu> 
</asp:Content>

<%-- footer --%>
<asp:Content ID = "Content5" ContentPlaceHolderID ="footer" runat="server">
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
            
            $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("RebindGrid")
        }
        /*
        * function of context menu
        */
        function RadContextMenu2_ClientClicked(sender, args) {
            var menuItemValue = args.get_item().get_value();
            switch (menuItemValue) {
                case "danhmuc":
                    showDialog(sender, "../Category/QLNhomQuyen.aspx", "true");
                    break;
                default:
                    break;
            }
        }

        function RadContextMenuUserQuyen_Click(sender, args) {
            var menuItemValue = args.get_item().get_value();
            switch (menuItemValue) 
            {
                case "them":
                    showDialog(sender, "User_NhomQuyen.aspx", "true");
            	break;
                case "chuyen":
                    showDialog(sender, "User_NhomQuyen.aspx?mode=edit", "true");
                    break;
                case "xoa":
                    radconfirm("Tài khoản được gỡ khỏi nhóm, bạn chắc chứ?", xoaNhanvien);
                    
                    break;
                default:
                    break;
            }
        }

        function xoaNhanvien(arg) {
            if (arg) {
                $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("removeUser");
            }
        }
        /**
        // function of pager template
        **/
      
        function RadComboBox1_SelectedIndexChanged(sender, args) {
            tableView.set_pageSize(sender.get_value());
        }

        function changePage(argument) {

            tableView.page(argument);
        }

        function RadNumericTextBox1_ValueChanged(sender, args) {
            tableView.page(sender.get_value());
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

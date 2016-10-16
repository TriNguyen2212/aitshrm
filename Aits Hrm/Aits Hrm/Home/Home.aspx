<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Aits_Hrm.Home.Home" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Charting" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TopLeft" runat="server">
    <style type="text/css">
        .Tintuc{ overflow:inherit;}
        .RSSTitle{font-size:16px;line-height:26px;padding-top:5px;padding-bottom:5px;}
        .RSSTitle a{color:#3B5998;text-decoration:none;}
        .RSSTitle a:hover{color:Red;}
        .RSSSubtitle{line-height:20px;padding-bottom:5px;text-align:justify;text-justify:newspaper;}
        .RSSInfo{color:#666;font-size:13px;padding-top:2px;}
    </style>
    <telerik:RadFormDecorator ID="FormDecorator1" runat="server" DecoratedControls="all" />
    <telerik:RadMenu ID="RadMenuVe" runat="server" Flow="Vertical" 
        Skin="Transparent" Width="100%"
        style="z-index:1; top: 0px; left: 0px;" 
        OnClientItemClicked="RadMenuVe_ClientItemClicked" CssClass="MenuVe" 
        onitemclick="RadMenuVe_ItemClick">
        <Items>
            <telerik:RadMenuItem runat="server" Text="Tổng quan" Value="tongquan" />
            <telerik:RadMenuItem runat="server" Text="Hồ sơ" Value="hoso" />
            <telerik:RadMenuItem runat="server" Text="Xin nghỉ" Value="xinnghi" PostBack="false"/>
            <telerik:RadMenuItem runat="server" Text="Lương" Value="luong" />
            <telerik:RadMenuItem runat="server" Text="Thuế thu nhập cá nhân" />
            <telerik:RadMenuItem runat="server" Text="Mẫu tài liệu" />
        </Items>
    </telerik:RadMenu>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BottomLeft" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TopRight" runat="server">
    <asp:PlaceHolder runat="server" ID="plTopRight">
    </asp:PlaceHolder>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BottomRight" runat="server">
<telerik:RadFormDecorator ID="RadFormDecorator1" runat="server" DecoratedControls="all" />
    <telerik:RadSplitter ID="RadSplitter1" runat="server" > <%--CssClass="Tintuc">--%>
        <telerik:RadPane ID="bottomRight1" runat="Server" Width="60%" >
            <asp:Label ID="lbHanHD" CssClass="rfdAspLabel" runat="server" Font-Bold="true" Text="Hết hạn hợp đồng" />
            <telerik:RadGrid ID="RadGridHanHD" Culture="vi-VN" 
                OnNeedDataSource="RadGridHanHD_NeedDataSource" runat="server" 
                AllowPaging="True" AutoGenerateColumns="False" CellSpacing="0" 
                GridLines="None" PagerStyle-Mode="NumericPages" Height="91%" PageSize="4">
                <ClientSettings>
                    <Scrolling AllowScroll="true" />
                </ClientSettings>
                <MasterTableView PageSize="4">
                    <NoRecordsTemplate>
                        <div><center>Không có dữ liệu.</center></div>
                    </NoRecordsTemplate>
                    <CommandItemSettings ExportToPdfText="Export to PDF" />
                    <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" Visible="True">
                        <HeaderStyle Width="20px" />
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" Visible="True">
                        <HeaderStyle Width="20px" />
                    </ExpandCollapseColumn>
                    <Columns>
                        <telerik:GridBoundColumn DataField="SoHD" HeaderStyle-Width="20%" 
                            FilterControlAltText="Filter SoHD column" HeaderText="Số HĐ" UniqueName="SoHD">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="NgayKyHD" HeaderStyle-Width="15%" 
                            FilterControlAltText="Filter NgayKyHD column" HeaderText="Ngày ký HĐ" 
                            UniqueName="NgayKyHD" DataFormatString="{0:dd/MM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="LoaiHD" 
                            FilterControlAltText="Filter LoaiHD column" HeaderText="Loại HĐ" 
                            UniqueName="LoaiHD">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="NguoiLaoDong" 
                            FilterControlAltText="Filter NguoiLaoDong column" HeaderText="Người lao động" 
                            UniqueName="NguoiLaoDong">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ChucDanhCongViec" 
                            FilterControlAltText="Filter ChucDanhCongViec column" HeaderText="Chức danh CV" 
                            UniqueName="ChucDanhCongViec">
                        </telerik:GridBoundColumn>
                    </Columns>
                    <EditFormSettings>
                        <EditColumn FilterControlAltText="Filter EditCommandColumn column" />
                    </EditFormSettings>
                </MasterTableView>
                <FilterMenu EnableImageSprites="False" />
            </telerik:RadGrid>
            <%--<asp:DataList ID="dlRSS" runat="server" Width="100%">
                <ItemTemplate>
                    <div class="RSSTitle"><asp:HyperLink ID="TitleLink" runat="server" Text='<%# Eval("title") %>' NavigateUrl='<%# Eval("link") %>'/></div>
                    <div class="RSSSubtitle"><asp:Label CssClass="rfdAspLabel" ID="SubtitleLabel" runat="server" Text='<%# Eval("description").ToString().Length > 200?Eval("description").ToString().Substring(0,200)+"...":Eval("description") %>' /></div>--%>
                    <%--<div class="RSSInfo">posted on <asp:Label ID="DateRSSedLabel" runat="server" Text='<%# Eval("pubDate", "{0:d} @ {0:t}") %>' /></div>--%>
                <%--</ItemTemplate>
            </asp:DataList>--%>
        </telerik:RadPane>
        <telerik:RadSplitBar ID="RadSplitBar1" runat="Server" CollapseMode="None"></telerik:RadSplitBar>
        <telerik:RadPane ID="bottomRight2" runat="Server" Scrolling="None" Width="40%" >
        <asp:Label ID="lbSinhNhat" CssClass="rfdAspLabel" runat="server" Font-Bold="true" Text="Sinh nhật" />
            <telerik:RadGrid ID="RadGridNhacViec" Culture="vi-VN" PagerStyle-Mode="NumericPages"
                OnNeedDataSource="RadGridNhacViec_NeedDataSource" runat="server" 
                AllowPaging="True" AutoGenerateColumns="False" CellSpacing="0" 
                GridLines="None" Height="91%" PageSize="4">
                <ClientSettings>
                    <Scrolling AllowScroll="true" />
                </ClientSettings>
                <MasterTableView>
                    <NoRecordsTemplate>
                        <div><center>Không có dữ liệu.</center></div>
                    </NoRecordsTemplate>
                    <CommandItemSettings ExportToPdfText="Export to PDF" />
                    <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" 
                        Visible="True">
                        <HeaderStyle Width="20px" />
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" 
                        Visible="True">
                        <HeaderStyle Width="20px" />
                    </ExpandCollapseColumn>
                    <Columns>
                        <telerik:GridBoundColumn DataField="MaNV" HeaderStyle-Width="15%" 
                            FilterControlAltText="Filter MaNV column" HeaderText="Mã NV" UniqueName="MaNV">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="TenNV" 
                            FilterControlAltText="Filter TenNV column" HeaderText="Nhân viên" 
                            UniqueName="TenNV">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="NgaySinh" HeaderStyle-Width="20%"
                            FilterControlAltText="Filter NgaySinh column" HeaderText="Ngày sinh" 
                            UniqueName="NgaySinh" DataFormatString="{0:dd/MM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="NgayVaoHK" HeaderStyle-Width="20%"
                            FilterControlAltText="Filter NgayVaoHK column" HeaderText="Ngày vào HK" 
                            UniqueName="NgayVaoHK" DataFormatString="{0:dd/MM/yyyy}">
                        </telerik:GridBoundColumn>
                    </Columns>
                    <EditFormSettings>
                        <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                        </EditColumn>
                    </EditFormSettings>
                </MasterTableView>
                <FilterMenu EnableImageSprites="False" />
            </telerik:RadGrid>
        </telerik:RadPane>
    </telerik:RadSplitter>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="footer" runat="server">
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
    <script type="text/javascript">
        function RadMenuVe_ClientItemClicked(sender, eventArgs) {
            var item = eventArgs.get_item();
            switch (item.get_value()) {
                case "xinnghi":
                    var oWnd = window.radopen("", "DialogWindowHome");
                    oWnd.setUrl("../Salary/QLNghi.aspx");
                    ownd.center();
                    ownd.set_height(450);
                     ownd.set_width(900);
                    break;
            }
        }
    </script>
</asp:Content>

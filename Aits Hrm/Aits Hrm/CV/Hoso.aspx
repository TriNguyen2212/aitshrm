<%@ Page Title="" Language="C#" MasterPageFile="../MasterPage.Master" Culture="vi-VN" AutoEventWireup="true" CodeBehind="Hoso.aspx.cs" Inherits="Aits_Hrm.Hoso" %>
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
            <telerik:RadMenuItem runat="server" Text="Xóa" Value="xoa" Enabled="false" ImageUrl="../Images/xoa2.png">
            </telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" Text="In..." Value="in" Visible="false"
                ImageUrl="../Images/action_print.gif">
            </telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" Text="Đóng">
            </telerik:RadMenuItem>
        </Items>
    </telerik:RadContextMenu>
    <asp:Panel  style="position:none;" ID="Panel1" runat="server" Height="100%">
        <telerik:RadGrid ID="RadGrid1" runat="server" Height="94%" Width="100%"
        AllowSorting="True" CellSpacing="0" GridLines="None" Culture="vi-VN" EnableLinqExpressions="False"  
        AutoGenerateColumns="False" OnItemCommand="Grid_ItemCommand" AllowFilteringByColumn="True" 
        onneeddatasource="Grid_NeedDataSource" AllowPaging="True">
        <GroupingSettings CaseSensitive="false" />
        <ClientSettings EnablePostBackOnRowClick="true" EnableRowHoverStyle="true" AllowKeyboardNavigation="true">
            <KeyboardNavigationSettings EnableKeyboardShortcuts="false" AllowActiveRowCycle="true"/>
            <Selecting AllowRowSelect="True" />
            <Resizing AllowColumnResize="True" />
            <ClientEvents  OnActiveRowChanged="ActiveRowChanged"  />
            <Scrolling AllowScroll="true" UseStaticHeaders="true" />
            
        </ClientSettings>
        <MasterTableView ShowHeadersWhenNoRecords="true" AllowFilteringByColumn="True" DataKeyNames="IDNhanVien">
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
                <telerik:GridBoundColumn DataField="IDNhanVien" 
                    FilterControlAltText="Filter column column" HeaderText="ID Nhân viên" 
                    UniqueName="IDNhanVien" Visible="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="MaNV" FilterControlWidth="100%"
                    FilterControlAltText="Filter MaNV column" HeaderText="Mã NV" UniqueName="MaNV"
                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false" >
                    <HeaderStyle Width="60px" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="TenNV" FilterControlWidth="100%"
                    FilterControlAltText="Filter TenNV column" HeaderText="Tên nhân viên" UniqueName="TenNV" 
                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false" >
                    <HeaderStyle Width="160px" />
                </telerik:GridBoundColumn>
                <telerik:GridDateTimeColumn DataField="NgaySinh" DataFormatString="{0:d}" 
                    FilterControlAltText="Filter NgaySinh column" HeaderText="Ngày sinh" ShowFilterIcon="false"
                    UniqueName="NgaySinh" AutoPostBackOnFilter="True"  
                    CurrentFilterFunction="Contains" SortExpression="NgaySinh">
                    <HeaderStyle Width="80px" />
                    <FilterTemplate>
                        <telerik:RadDatePicker ID="NgaySinhPicker" runat="server" Width="100%"
                            ClientEvents-OnDateSelected="DateSelected"  
                            DbSelectedDate='<%# SetNgaySinh(Container) %>' />
                        <telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">

                            <script type="text/javascript">
                                function DateSelected(sender, args) {
                                    var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                    var date = FormatSelectedDate(sender);
                                    tableView.filter("NgaySinh", date, "EqualTo");
                                }
                                function FormatSelectedDate(picker) {
                                    var date = picker.get_selectedDate();
                                    var dateInput = picker.get_dateInput();
                                    formattedDate = dateInput.get_dateFormatInfo().FormatDate(date, dateInput.get_displayDateFormat());
                                    return formattedDate;
                                }
                            </script>

                        </telerik:RadScriptBlock>
                    </FilterTemplate>
                </telerik:GridDateTimeColumn>
                
                <telerik:GridBoundColumn DataField="NoiSinh" FilterControlWidth="100%"
                    FilterControlAltText="Filter NoiSinh column" HeaderText="Nơi sinh" 
                    UniqueName="NoiSinh" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="GioiTinh"
                    FilterControlAltText="Filter GioiTinh column" HeaderText="Giới Tính" 
                    UniqueName="GioiTinh" ShowFilterIcon="false">
                    <FilterTemplate>
                        <telerik:RadComboBox runat="server" ID="filterCboGioiTinh" ShowToggleImage="true"
                          AppendDataBoundItems="true" Width="100%"
                          SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("GioiTinh").CurrentFilterValue %>'                          
                          OnClientSelectedIndexChanged ="function(sender,args){filterCboChange(sender, args, 'GioiTinh')}">
                            <Items>
                                <telerik:RadComboBoxItem Value="" Text=""/>
                                <telerik:RadComboBoxItem Value="True" Text="Nam"/>
                                <telerik:RadComboBoxItem Value="False" Text="Nữ"/>
                            </Items>
                        </telerik:RadComboBox>
                    </FilterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="GioiTinhLabel" runat="server"><%# bool.Parse(Eval("GioiTinh").ToString())==true?"Nam":"Nữ"%></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Width="80px" />
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="DanToc" SortExpression="DanToc"
                    FilterControlAltText="Filter DanToc column" HeaderText="Dân tộc"
                    UniqueName="DanToc">
                    <FilterTemplate>
                        <telerik:RadComboBox runat="server" ID="filterCboDanToc" DataSourceID="EntitiesDanToc" ShowToggleImage="true"
                          DataValueField="DanToc1" DataTextField="DanToc1" AppendDataBoundItems="true" Width="100%"
                          SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("DanToc").CurrentFilterValue %>'                          
                          OnClientSelectedIndexChanged ="function(sender,args){filterCboChange(sender, args, 'DanToc')}">
                            <Items>
                                <telerik:RadComboBoxItem Value="" Text=""/>
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
                    <HeaderStyle Width="80px" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="TonGiao" SortExpression="TonGiao"
                    FilterControlAltText="Filter TonGiao column" HeaderText="Tôn giáo" 
                    UniqueName="TonGiao" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true" ShowFilterIcon="false">
                    <FilterTemplate>
                        <telerik:RadComboBox runat="server" ID="filterCboTonGiao" DataSourceID="EntitiesTonGiao" ShowToggleImage="true"
                          DataValueField="TonGiao1" DataTextField="TonGiao1" AppendDataBoundItems="true" Width="100%"
                          SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("TonGiao").CurrentFilterValue %>'
                          OnClientSelectedIndexChanged="function(sender,args){filterCboChange(sender, args, 'TonGiao')}" >
                            <Items>
                                <telerik:RadComboBoxItem Value="" Text="" />
                            </Items>
                        </telerik:RadComboBox>
                    </FilterTemplate>
                    <HeaderStyle Width="80px" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SoDiDong"
                    FilterControlAltText="Filter SoDiDong column" HeaderText="Di động" FilterControlWidth="100%"
                    UniqueName="SoDiDong" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false">
                    <HeaderStyle Width="100px" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SoMayBan"
                    FilterControlAltText="Filter column2 column" HeaderText="Máy bàn" FilterControlWidth="100%" 
                    UniqueName="SoMayBan" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false">
                    <HeaderStyle Width="80px" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Email"
                    FilterControlAltText="Filter Email column" HeaderText="Email" FilterControlWidth="100%" 
                    UniqueName="Email" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false">
                </telerik:GridBoundColumn>     
                <telerik:GridTemplateColumn DataField="DuocDangNhap" HeaderStyle-Width="60px" ShowFilterIcon="false" Visible="false"
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
                    </FilterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="DuocDangNhapLabel" runat="server"><%# Eval("DuocDangNhap").ToString()=="True"?"Có":"Không"%></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Width="60px" />
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
        EntitySetName="DanTocs" EntityTypeFilter="DanToc" ContextTypeName="Aits_Hrm.Model.QuanLyNhanSuEntities"
        Select="it.[DanToc1]" ID="EntitiesDanToc">
    </asp:EntityDataSource>
    <asp:EntityDataSource runat="server" ID="EntitiesTonGiao" 
        ConnectionString="name=QuanLyNhanSuEntities" ContextTypeName="Aits_Hrm.Model.QuanLyNhanSuEntities"
        DefaultContainerName="QuanLyNhanSuEntities" EnableFlattening="False" 
        EntitySetName="TonGiaos" Select="it.[TonGiao1]">
    </asp:EntityDataSource>
    <%--open calendar filter when click--%>
    <%--<telerik:RadScriptBlock ID="RadScriptBlock256546" runat="server">
        <script type="text/javascript">
            document.getElementById('ctl00_TopRight_RadGrid1_ctl00_ctl02_ctl02_RDIPFNgaySinh_dateInput').onfocus = function () {
                document.getElementById('ctl00_TopRight_RadGrid1_ctl00_ctl02_ctl02_RDIPFNgaySinh_popupButton').click();
            }
        </script>
    </telerik:RadScriptBlock>--%>
    <%-- --%>
    </asp:Panel>
    
</asp:Content>


<%-- bottom right--%>
<asp:Content ID="Content2" ContentPlaceHolderID="BottomRight" runat="server">

    <telerik:RadFormDecorator ID="FormDecorator1" runat="server" DecoratedControls="all"></telerik:RadFormDecorator>
    <telerik:RadTabStrip ID="RadTabStrip1" runat="server" SelectedIndex="0" 
    MultiPageID="RadMultiPage1" ScrollChildren="True" PerTabScrolling="True" 
        ReorderTabsOnSelect="True" ScrollButtonsPosition="Middle">
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
            <telerik:RadTab runat="server" Text="Hợp đồng lao động">
            <TabTemplate>Hợp đồng lao động</TabTemplate>
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Bằng cấp">
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

    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="7" CssClass="pageView" Width="100%">
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
                            <td><label>ĐTDĐ:</label></td>
                            <td><asp:TextBox ID="lbDTDĐ" runat="server" BorderStyle="None" BorderWidth="0px" 
                                    ReadOnly="true" />
                            </td>
                            <td><label>Email cá nhân:</label></td>
                            <td><asp:TextBox ID="lbEmail" runat="server" BorderStyle="None" BorderWidth="0px" 
                                    ReadOnly="true" />
                            </td>
                        </tr>
                         <tr>
                            <td><label>Điện thoại cơ quan:</label></td>
                             <td><asp:TextBox ID="lbDTCQ" runat="server" BorderStyle="None" BorderWidth="0px" 
                                     ReadOnly="true" />
                             </td>
                        </tr>
                        <tr>
                            <td><label>Địa chỉ liên hệ:</label></td>
                            <td><asp:TextBox ID="lbDiaChi" runat="server" BorderStyle="None" BorderWidth="0px" 
                                    ReadOnly="true" />
                            </td>
                        </tr>
                         <tr>
                            <td><label>Số Tài khoản:</label></td>
                            <td><asp:TextBox ID="lbSoTK" runat="server" BorderStyle="None" BorderWidth="0px" 
                                     ReadOnly="true" />
                            </td>
                        </tr>
                   </table>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView4" runat="server" Width="100%">
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
                  <telerik:RadContextMenu ID="RadContextMenuHD" runat="server" OnClientItemClicked="RadContextMenuHD_Itemclick">
                        <Targets>
                            <telerik:ContextMenuControlTarget ControlID="GridHD"/>
                        </Targets>
                        <Items>
                            <telerik:RadMenuItem runat="server" Text="Quản lý HĐ nhân viên..." Value="sua">
                            </telerik:RadMenuItem>
                             <telerik:RadMenuItem runat="server" Text="Đóng">
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadContextMenu>
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
                    UniqueName="IDHopDongLD" Visible="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SoHD" 
                    FilterControlAltText="Filter SoHD column" HeaderText="Số HĐ" 
                    UniqueName="SoHD">
                    <HeaderStyle Width="100px" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="NguoiLaoDong" FilterControlAltText="Filter NguoiLaoDong column" HeaderText="Người Lao động" 
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
                    FilterControlAltText="Filter DenNgay column" HeaderText="Đến ngày" PickerType="DatePicker"
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
                <FilterMenu EnableImageSprites="False" />
        </telerik:RadGrid>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView6" runat="server">
                    <telerik:RadContextMenu ID="RadContextMenuDaoTao" runat="server" OnClientItemClicked="ContextMenuDT_Click">
                        <Targets>
                            <telerik:ContextMenuControlTarget ControlID="GridDT"/>
                        </Targets>
                        <Items>
                            <telerik:RadMenuItem runat="server" Text="Quản lý bằng cấp..." Value="sua">
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
                            </Columns>
                            <EditFormSettings>
                                <EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
                            </EditFormSettings>
                        </MasterTableView>
                        <FilterMenu EnableImageSprites="False"></FilterMenu>
                    </telerik:RadGrid>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView14" runat="server">
                    <telerik:RadContextMenu ID="ContextMenuCC" runat="server" OnClientItemClicked="ContextMenuCC_Click">
                        <Targets>
                            <telerik:ContextMenuControlTarget ControlID="GridChungChi"/>
                        </Targets>
                        <Items>
                            <telerik:RadMenuItem runat="server" Text="Quản lý chứng chỉ..." Value="sua">
                            </telerik:RadMenuItem>
                             <telerik:RadMenuItem runat="server" Text="Đóng">
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadContextMenu>
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
                    <telerik:RadContextMenu ID="RadContextMenuQTCT" runat="server" OnClientItemClicked="RadContextMenuQTDT_Itemclick">
                        <Targets>
                            <telerik:ContextMenuControlTarget ControlID="GridQTCT"/>
                        </Targets>
                        <Items>
                            <telerik:RadMenuItem runat="server" Text="Quản lý quá trình công tác..." Value="sua">
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
                    <telerik:RadContextMenu ID="RadContextMenuNghi" runat="server" OnClientItemClicked="RadContextMenuNghi_Itemclick">
                        <Targets>
                            <telerik:ContextMenuControlTarget ControlID="grvNghi"/>
                        </Targets>
                        <Items>
                            <telerik:RadMenuItem runat="server" Text="Quản lý quá trình nghỉ..." Value="sua">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Đóng">
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadContextMenu>
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
                   Module đang trong quá trình phát triển
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView1" runat="server">
                   Module đang trong quá trình phát triển
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView8" runat="server">
                   Module đang trong quá trình phát triển
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView9" runat="server">
                   Module đang trong quá trình phát triển
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView10" runat="server">
                   Module đang trong quá trình phát triển
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView12" runat="server">
                   Module đang trong quá trình phát triển
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

    <telerik:RadWindowManager DestroyOnClose="true" ID="Singleton" runat="server">
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
        function showDialog(sender, args,args2) {
            if (args2 == "false") {
                var oWnd = window.radopen("", "RadWindow1");
                oWnd.setUrl(args);
            } else {

                var oWnd2 = window.radopen("", "DialogWindow");
                oWnd2.setUrl(args);
            }

        }
        function OnClientclose(sender,args) {
            //window.location.href = "Hoso.aspx";
            //var masterTable = $find("<%= RadGrid1.ClientID %>").get_masterTableView();
            //masterTable.rebind();
            $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("RebindGrid")
        }
        /*var s;
        function KeyPressed(sender, eventArgs) {
            s = sender;
            if (eventArgs.get_keyCode() == 13) {
                //eventArgs.click();
            }
        }*/
        /*function RowSelected(sender, args) {
            var grid = $find(sender.get_id());
            {
                grid.set_activeRow($get(args.get_id()));
            }
        }*/
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

        /*
        *   Context menu 
        */
        function ContextMenuItemClick(sender, args) {
            var menuItemValue = args.get_item().get_value();
            switch(menuItemValue){
                case "them":
                    showDialog(sender, "ThemNhanVien.aspx","true");
                    break;
                case "sua":
                    showDialog(sender, "Suanhanvien.aspx","true");
                    break;
                case "xoa":
                    radconfirm("Nhân viên đang chọn sẽ bị xóa mọi thông tin trên hệ thống. Bạn có chắc chắn xóa nhân viên này không?", xoaNhanvien);
                    break;

            }
            
        }

        function xoaNhanvien(arg) {
            if (arg) {
                $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("XoaNV")
            }
        }

        function RadContextMenuNghi_Itemclick(sender, args) {
            var menuItemValue = args.get_item().get_value();
            if (menuItemValue == "sua") {
                showDialog(sender, "ThemNghiPhep.aspx", "true");
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

        function ContextMenuCC_Click(sender, args) {
            var menuItemValue = args.get_item().get_value();
            if (menuItemValue == "sua") {
                showDialog(sender, "ThemChungChi.aspx", "true");
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






<%@ Page Title="" Language="C#" MasterPageFile="/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Aits_Hrm.Home.Default" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Charting" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TopLeft" runat="server">
        <style type="text/css">
            .Tintuc{ overflow:inherit;}
        </style>
        <telerik:RadMenu ID="RadMenuVe" runat="server" Flow="Vertical" Skin="Windows7" 
            style=" margin-top:20px; margin-left:6px; z-index:1;">
            <Items>
                <telerik:RadMenuItem runat="server" Text="Bảng tin">
                </telerik:RadMenuItem>
                <telerik:RadMenuItem runat="server" Text="Hồ sơ">
                </telerik:RadMenuItem>
                <telerik:RadMenuItem runat="server" Text="Đơn xin nghỉ">
                </telerik:RadMenuItem>
                <telerik:RadMenuItem runat="server" Text="Lương">
                </telerik:RadMenuItem>
                <telerik:RadMenuItem runat="server" Text="Thuế thu nhập cá nhân">
                </telerik:RadMenuItem>
                <telerik:RadMenuItem runat="server" Text="Đăng kí đào tạo">
                </telerik:RadMenuItem>
                <telerik:RadMenuItem runat="server" Text="Tài sản">
                </telerik:RadMenuItem>
                <telerik:RadMenuItem runat="server" Text="Đăng kí chương trình phúc lợi">
                </telerik:RadMenuItem>
                <telerik:RadMenuItem runat="server" Text="Đánh giá">
                </telerik:RadMenuItem>
                <telerik:RadMenuItem runat="server" Text="Nhân viên đi công tác">
                </telerik:RadMenuItem>
                <telerik:RadMenuItem runat="server" Text="Bản mô tả công việc">
                </telerik:RadMenuItem>
                <telerik:RadMenuItem runat="server" Text="Mẫu tài liệu">
                </telerik:RadMenuItem>
            </Items>
        </telerik:RadMenu>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BottomLeft" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TopRight" runat="server">
    <table border="0" width="100%">
    	<tr>
         <td>
                    <telerik:RadChart ID="RadChart3" runat="server" Skin="Telerik">
                        <Series>
                            <telerik:ChartSeries  Type="Pie" DataYColumn2="Nu" DataYColumn3="Nam">
                                 <Appearance LegendDisplayMode="ItemLabels">
                                </Appearance>
                            </telerik:ChartSeries>
                        
                        </Series>

                        <ChartTitle>
                            <Appearance>
                                <FillStyle MainColor=""></FillStyle>
                            </Appearance>
                            <TextBlock Text="Biểu đồ tỷ lệ nhân viên">
                            <Appearance TextProperties-Font="Arial, 18pt" TextProperties-Color="72, 174, 40"></Appearance>
                            </TextBlock>
                        </ChartTitle>
                    </telerik:RadChart>
                    
         </td>
        
    	<td><telerik:RadChart ID="RadChart1" runat="server" Width="550px"
                        SkinsOverrideStyles="true" Skin="Telerik">
                         <ChartTitle>
                            <Appearance>
                                <FillStyle MainColor=""></FillStyle>
                            </Appearance>
                            <TextBlock Text="Biểu đồ tăng trưởng nhân sự">
                            <Appearance TextProperties-Font="Arial, 18pt" TextProperties-Color="72, 174, 40"></Appearance>
                            </TextBlock>
                        </ChartTitle>     
                        <Series>
                            <telerik:ChartSeries Name="Nhân lực" Type="Line">                 
                            </telerik:ChartSeries>      
                        </Series>
                 </telerik:RadChart>
                 </td>
    	    </tr>
    </table>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="BottomRight" runat="server">
    <telerik:RadSplitter ID="RadSplitter1" runat="server" CssClass="Tintuc">
        <telerik:RadPane ID="bottomRight1" runat="Server" Width="60%" >
        Tin tức
        </telerik:RadPane>
        <telerik:RadSplitBar runat="Server" CollapseMode="Both"></telerik:RadSplitBar>
        <telerik:RadPane ID="bottomRight2" runat="Server" Width="40%" >
        Nhắc việc
        </telerik:RadPane>
    </telerik:RadSplitter>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="footer" runat="server">
</asp:Content>

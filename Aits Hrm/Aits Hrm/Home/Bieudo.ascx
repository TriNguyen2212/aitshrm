<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Bieudo.ascx.cs" Inherits="Aits_Hrm.Home.Bieudo" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Charting" Assembly="Telerik.Web.UI" %>
<table width="100%">
    <tr>
    	<td>
            <telerik:RadChart ID="RadChart1" runat="server" SkinsOverrideStyles="true" Skin="Telerik">
                <ChartTitle>
                    <Appearance><FillStyle MainColor="" /></Appearance>                        
                    <TextBlock Text="Biểu đồ tăng trưởng nhân sự">
                        <Appearance TextProperties-Font="Arial, 18pt" TextProperties-Color="72, 174, 40" />
                    </TextBlock>
                </ChartTitle>     
                <Series>
                    <telerik:ChartSeries Name="Nhân lực" Type="Bar" />     
                </Series>
            </telerik:RadChart>
        </td>
        <td>
            <telerik:RadChart ID="RadChart2" DefaultType="Pie" runat="server" SkinsOverrideStyles="true" Skin="Telerik">
                <ChartTitle>
                    <Appearance><FillStyle MainColor="" /></Appearance>
                    <TextBlock Text="Biểu đồ tỷ lệ giới tính">
                    <Appearance TextProperties-Font="Arial, 18pt" TextProperties-Color="72, 174, 40"></Appearance>
                </TextBlock>
                </ChartTitle>
            </telerik:RadChart>
    	</td>
    </tr>
</table>
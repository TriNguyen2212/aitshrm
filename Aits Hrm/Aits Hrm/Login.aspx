<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Dangnhap" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<title>Đăng nhập hệ thống</title>
	<telerik:RadStyleSheetManager id="RadStyleSheetManager1" runat="server" />
</head>
<link href="../Images/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<body>
    <form id="form1" runat="server">
	<telerik:RadScriptManager ID="RadScriptManager1" runat="server">
		<Scripts>
			<%--Needed for JavaScript IntelliSense in VS2010--%>
			<%--For VS2008 replace RadScriptManager with ScriptManager--%>
			<asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
			<asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
			<asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
		</Scripts>
	</telerik:RadScriptManager>
	<script type="text/javascript">
	    //Put your JavaScript code here.
    </script>
	<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" />
	<center>
        <img src="./Images/LoginPage.jpg" style="height:300px; width:500px" alt="" />
        <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/Home"
            UserNameLabelText="Tên đăng nhập" PasswordLabelText="Mật khẩu" RememberMeText="Đăng nhập tự động"
            FailureText="Đăng nhập thất bại" LoginButtonText="Đăng nhập" LoginButtonType="Link" onauthenticate="Login_Authenticate" 
            PasswordRequiredErrorMessage="Chưa nhập mật khẩu" TitleText="Đăng nhập" 
            UserNameRequiredErrorMessage="Chưa nhập tên đăng nhập" BackColor="#EFF3FB" 
            BorderColor="#B5C7DE" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" 
            Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" Width="500px">
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <LayoutTemplate>
                <asp:Panel ID="Panel1" DefaultButton="LoginLinkButton" RunAt="server">
                <table width="500px">
                    <tr>
                        <td align="center">
                            <table>
                                <tr>
                                    <td align="center" colspan="3"><span style="color:Red;"><asp:Literal ID="FailureText" runat="server" EnableViewState="False" /></span></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Tên đăng nhập</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="UserName" runat="server" TabIndex="1" Width="180px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="None"
                                             ControlToValidate="UserName" Text="*" ErrorMessage="Chưa nhập tên đăng nhập" SetFocusOnError="true">
                                        </asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" TargetControlID="RequiredFieldValidator1"
                                             HighlightCssClass="highlight" PopupPosition="Right" runat="server">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Mật khẩu</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Password" runat="server" TextMode="Password" TabIndex="2" Width="180px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="None"
                                             ControlToValidate="Password" Text="*" ErrorMessage="Chưa nhập mật khẩu" SetFocusOnError="true">
                                        </asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" TargetControlID="RequiredFieldValidator2"
                                             HighlightCssClass="highlight" PopupPosition="Right" runat="server">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <telerik:RadButton ID="LoginLinkButton" runat="server" 
                                        CommandName="Login" ValidationGroup="Login1" Text="Đăng nhập" TabIndex="3">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                </asp:Panel>
            </LayoutTemplate>
            <LoginButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" 
                BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" />
            <TextBoxStyle Font-Size="0.8em" />
            <TitleTextStyle BackColor="#507CD1" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
        </asp:Login>
	</center>
	</form>
</body>
</html>

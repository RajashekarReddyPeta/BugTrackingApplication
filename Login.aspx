<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Index" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Bug Tracking System</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .modalBackground 
        {
	background-color:Gray;
	filter:alpha(opacity=70);
	opacity:0.7;
}

.modalPopup {
	background-color:#ffffdd;
	border-width:3px;
	border-style:solid;
	border-color:Gray;
	padding:3px;
	width:250px;
}

.modalPopup p {
    padding: 5px;
}

.sampleStyleA {
	background-color:#FFF;
}

.sampleStyleB {
	background-color:#FFF;
	font-family:monospace;
	font-size:10pt;
	font-weight:bold;
}

.sampleStyleC {
	background-color:#ddffdd;
	font-family:sans-serif;
	font-size:10pt;
	font-style:italic;
}

.sampleStyleD {
	background-color:Blue;
	color:White;
	font-family:Arial;
	font-size:10pt;
}
        </style>
</head>
<body>
    <form id="form2" runat="server">
    <div id="wrapper">

	<div id="top">
		<h1><a href="#">Bug Tracker</a></h1>
		
	</div>
	
	<div id="body" class="clear">
		<div id="sidebar" class="column-left">
		<br />
		<br />
		</div>
		<div id="content" class="column-right">     
			<h1>Bug Tracking System</h1>
                    <p>
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/canstock0096298.png" 
                            Height="200px" Width="350px" />
                    </p>
                    <center>
                    <p>
                    <asp:LinkButton ID="lbtnLogin" runat="server">Login</asp:LinkButton>
                    </p>	
                    </center>
            <asp:Panel ID="Panel1" runat="server">
            <p>
                <asp:Login ID="Login1" runat="server" BackColor="#F7F7DE" BorderColor="#CCCC99" 
                    BorderStyle="Solid" BorderWidth="1px" DestinationPageUrl="~/Default.aspx" 
                    Font-Names="Verdana" Font-Size="10pt" 
                    MembershipProvider="BugTrackProvider" onloginerror="Login1_LoginError">
                    <LayoutTemplate>
                        <table border="0" cellpadding="1" cellspacing="0" 
                            style="border-collapse:collapse;">
                            <tr>
                                <td>
                                    <table border="0" cellpadding="0">
                                        <tr>
                                            <td align="center" colspan="2" 
                                                style="color:White;background-color:#6B696B;font-weight:bold;">
                                                Log In</td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User 
                                                Name:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                    ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                                    ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                                    ControlToValidate="Password" ErrorMessage="Password is required." 
                                                    ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2" style="color:Red;">
                                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" colspan="2">
                                                <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" 
                                                    ValidationGroup="Login1" />
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:Button ID="btnCancel" runat="server" 
                                                    Text="Cancel" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" />
                </asp:Login>
            </p>

            
            <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="lbtnLogin"
    PopupControlID="Panel1"
    BackgroundCssClass="modalBackground" 
    DropShadow="true" ></cc1:ModalPopupExtender>
            </asp:Panel>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>	
		</div>
        
	</div>	
	<div id="footer-links">
		<p>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Aboutus.aspx">About Us</asp:HyperLink> | 
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="Help.aspx">Help</asp:HyperLink>
		</p>
	</div>
</div>
    </form>
</body>
</html>
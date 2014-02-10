<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Account.aspx.cs" Inherits="Account" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Bug Tracking System</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 76%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="wrapper">

	<div id="top" class="clear">
		<h1><a href="#">Bug Tracker</a></h1>
		
		<ul>
			<li><a href="Default.aspx">Home</a></li>
			<li class="selected"><a href="Account.aspx">Account</a></li>
		</ul>
	</div>
	
	<div id="body" class="clear">
		<div id="sidebar" class="column-left">
			<ul>	
				<li>
					<h4>Links</h4>
	
					<ul>
						<li>
                            <img src="images/add.png" />&nbsp; <a href="AddBugs.aspx" title="Add New Bugs">Add New Bugs</a></li>
						<li>
                            <img src="images/search_16x16.gif" />&nbsp; <a href="search.aspx" title="Search">Search</a></li>						
                        <li>
                            <img src="images/eject_16x16.gif" />&nbsp; <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect" 
                                LogoutPageUrl="~/Index.aspx" /></li>
                        <li><asp:HyperLink ID="HypAdmin" runat="server" Text="Admin" Visible="False" 
                                NavigateUrl="Administrator/Default.aspx"></asp:HyperLink></li>
					</ul>
				</li>
				
			</ul>
		</div>
		<div id="content" class="column-right">
		<p>
            <table class="style1">
                <tr>
                    <td>
    <asp:ChangePassword ID="ChangePassword1" runat="server" 
        MembershipProvider="BugTrackProvider" BackColor="#F7F7DE" 
            BorderColor="#CCCC99" BorderStyle="Solid" BorderWidth="1px" 
            Font-Names="Verdana" Font-Size="10pt" Height="184px" Width="470px">
        <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" />
    </asp:ChangePassword>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
</p>
  
			<br /><br />
		</div>
	</div>
	

	
	<div id="footer-links">
		<p>
			&copy; Copyright 2010. About Us | Help
		</p>
	</div>
</div>
    </form>
</body>
</html>

<%@ Page Language="C#" MasterPageFile="~/MasterBug.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Administrator_Default" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<br />
    <br />
    <table class="style1">
        <tr>
            <td>
    <ul>
                <li><a href="CreateUser.aspx" title="Create User"><h4>Create User</h4></a></li>
                
            </ul>                       
            </td>
            <td>
    <ul>
                <li><a href="Projects.aspx" title="Projects"><h4>Projects</h4></a></li>
                
            </ul>                       
            </td>
        </tr>
        <tr>
            <td>
    <ul>
                <li><a href="ManageUsers.aspx" title="ManageUsers"><h4>ManageUsers</h4></a></li>
                
            </ul>                       
            </td>
            <td>
    <ul>
                <li><a href="Priorities.aspx" title="Priorities"><h4>Priorities</h4></a></li>
                
            </ul>                       
            </td>
        </tr>
        <tr>
            <td>
    <ul>
                <li><a href="Roles.aspx" title="Roles"><h4>Roles</h4></a></li>
                
            </ul>                       
            </td>
            <td>
    <ul>
                <li><a href="Status.aspx" title="Status"><h4>Status</h4></a></li>
                
            </ul>                       
            </td>
        </tr>
    </table>
</asp:Content>


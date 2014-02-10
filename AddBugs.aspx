<%@ Page Language="C#" MasterPageFile="~/MasterBug.master" AutoEventWireup="true" CodeFile="AddBugs.aspx.cs" Inherits="Default3" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            border: 2px solid tan;
            margin: 1px;
            width: 100%;
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <br />
    <table class="style1" bgcolor="LightGoldenrodYellow" cellpadding="2" 
        frame="border" title="Add New Bug">
        <tr>
            <td>
                BugName</td>
            <td>
                <asp:TextBox ID="txtBugName" runat="server" Width="417px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvBugName" runat="server" 
                    ControlToValidate="txtBugName" Display="Dynamic" 
                    ErrorMessage="Please enter Bug Name">*</asp:RequiredFieldValidator>
           </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblBugdesc" runat="server" Text="Bugdesc"></asp:Label>
    
            </td>
            <td>
        <asp:TextBox ID="txtBugdesc" runat="server" Rows="3" 
            TextMode="MultiLine" Width="425px"></asp:TextBox>
           </td>
        </tr>
        <tr>
            <td>
    
        <asp:Label ID="lblProject" runat="server" Text="Project"></asp:Label>
    
            </td>
            <td>
      <asp:DropDownList ID="ddlProject" runat="server" Width="157px" 
            DataSourceID="SqlDataSource1" DataTextField="project_name" 
            DataValueField="project_id" AppendDataBoundItems="True">
          <asp:ListItem Value="0">Select</asp:ListItem>
        </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvProject" runat="server" 
                    ControlToValidate="ddlProject" Display="Dynamic" 
                    ErrorMessage="Please select a value" InitialValue="0">*</asp:RequiredFieldValidator>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:bugtracConnectionString1 %>" 
            SelectCommand="SELECT [project_name], [project_id] FROM [projects]">
        </asp:SqlDataSource>
        </td>
        </tr>
        <tr>
            <td>
    
        <asp:Label ID="lblPriority" runat="server" Text="Priority"></asp:Label>
    
            </td>
            <td>
    <asp:DropDownList ID="ddlPriority" runat="server" Width="157px" 
            DataSourceID="SqlDataSource3" DataTextField="priority_desc" 
            DataValueField="priority_id" AppendDataBoundItems="True">
        <asp:ListItem Value="0">Select</asp:ListItem>
        </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvPriority" runat="server" 
                    ControlToValidate="ddlPriority" Display="Dynamic" 
                    ErrorMessage="Please select a value" InitialValue="0">*</asp:RequiredFieldValidator>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:bugtracConnectionString1 %>" 
            SelectCommand="SELECT [priority_desc], [priority_id] FROM [priorities]">
        </asp:SqlDataSource>

            </td>
        </tr>
        <tr>
            <td>
    
        <asp:Label ID="lblassg" runat="server" Text="Assigned to"></asp:Label>
    
            </td>
            <td>

      <asp:DropDownList ID="ddlAssgto" runat="server" Width="157px" 
            DataSourceID="SqlDataSource4" DataTextField="employee_name" 
            DataValueField="employee_id" AppendDataBoundItems="True">
          <asp:ListItem Value="0">Select</asp:ListItem>
        </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvAssignedTo" runat="server" 
                    ControlToValidate="ddlAssgto" Display="Dynamic" 
                    ErrorMessage="Please select a value" InitialValue="0">*</asp:RequiredFieldValidator>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:bugtracConnectionString1 %>" 
            SelectCommand="SELECT [employee_name], [employee_id] FROM [employees]">
        </asp:SqlDataSource>

            </td>
        </tr>
        <tr>
            <td>
    
        <asp:Label ID="lblStatus" runat="server" Text="Status"></asp:Label>
    
            </td>
            <td>
    
 <asp:DropDownList ID="ddlStatus" runat="server" Width="157px" 
            DataSourceID="SqlDataSource5" DataTextField="status" DataValueField="status_id" 
                    AppendDataBoundItems="True">
     <asp:ListItem Value="0">Select</asp:ListItem>
        </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvStatus" runat="server" 
                    ControlToValidate="ddlStatus" Display="Dynamic" 
                    ErrorMessage="Please select a value" InitialValue="0">*</asp:RequiredFieldValidator>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:bugtracConnectionString1 %>" 
            SelectCommand="SELECT [status], [status_id] FROM [statuses]">
        </asp:SqlDataSource>

            </td>
        </tr>
        <tr>
            <td>
    
        <asp:Label ID="lblDtassg" runat="server" Text="Date Assigned"></asp:Label>
    
            </td>
            <td>

        <asp:TextBox ID="txtDate" runat="server" AutoPostBack="True" 
            Width="157px">
            </asp:TextBox>

    
            </td>
        </tr>
        <tr>
            <td align="right" >
                &nbsp;</td>
            <td align="right" >
            <asp:Button 
            ID="btnCreate" runat="server" onclick="btnCreate_Click" 
            Text="Create" Visible="False" /> &nbsp&nbsp;&nbsp;
                <asp:Button 
            ID="btnUpdate" runat="server" onclick="btnUpdate_Click" Text="Update" 
            Visible="False" />&nbsp &nbsp;&nbsp;
        <asp:Button ID="btnDelete" runat="server" onclick="btnDelete_Click" 
            Text="Delete" Visible="False" Width="55px" />&nbsp;&nbsp; &nbsp;
        <asp:Button ID="btnCancel" runat="server" 
            onclick="btnCancel_Click" Text="Cancel" 
            CausesValidation="False" />
            </td>
        </tr>
    </table>
</asp:Content>


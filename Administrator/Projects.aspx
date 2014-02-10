<%@ Page Language="C#" MasterPageFile="~/MasterBug.master" AutoEventWireup="true" CodeFile="Projects.aspx.cs" Inherits="Administrator_Projects" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:Button ID="btnNewProject" runat="server" Text="Add New Project" 
        onclick="btnNewProject_Click" />
    &nbsp;<br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblProjectName" runat="server" Text="Enter Project Name" 
        Visible="False"></asp:Label>
        
    &nbsp;<asp:TextBox ID="txtProjectName" runat="server" Visible="False"></asp:TextBox>
        
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnCreate" runat="server" onclick="btnCreate_Click" 
        Text="Create" Visible="False" />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
        CellPadding="2" DataKeyNames="project_id" DataSourceID="SqlDataSource1" 
        EmptyDataText="There are no data records to display." ForeColor="Black" 
        GridLines="None" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="project_id" HeaderText="project_id" ReadOnly="True" 
                SortExpression="project_id" />
            <asp:BoundField DataField="project_name" HeaderText="project_name" 
                SortExpression="project_name" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
        <FooterStyle BackColor="Tan" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
            HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:bugtracConnectionString1 %>" 
        DeleteCommand="DELETE FROM [projects] WHERE [project_id] = @project_id" 
        InsertCommand="INSERT INTO [projects] ([project_name], [employee_id]) VALUES (@project_name, @employee_id)" 
        ProviderName="<%$ ConnectionStrings:bugtracConnectionString1.ProviderName %>" 
        SelectCommand="SELECT [project_id], [project_name], [employee_id] FROM [projects]" 
        UpdateCommand="UPDATE [projects] SET [project_name] = @project_name, [employee_id] = @employee_id WHERE [project_id] = @project_id">
        <DeleteParameters>
            <asp:Parameter Name="project_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="project_name" Type="String" />
            <asp:Parameter Name="employee_id" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="project_name" Type="String" />
            <asp:Parameter Name="employee_id" Type="Int32" />
            <asp:Parameter Name="project_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>


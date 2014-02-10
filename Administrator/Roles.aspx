<%@ Page Language="C#" MasterPageFile="~/MasterBug.master" AutoEventWireup="true" CodeFile="Roles.aspx.cs" Inherits="Administrator_Roles" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <p>
    <asp:Button ID="btnNewRole" runat="server" Text="Add New Role" 
            onclick="btnNewRole_Click" />
    &nbsp;<br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblRoleName" runat="server" Text="Enter Role" 
        Visible="False"></asp:Label>
        
    &nbsp;<asp:TextBox ID="txtRoleName" runat="server" Visible="False"></asp:TextBox>
        
    <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnCreate" runat="server" onclick="btnCreate_Click" 
            Text="Create" Visible="False" />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
            BorderWidth="1px" CellPadding="2" DataKeyNames="RoleId" 
            DataSourceID="SqlDataSource1" 
            EmptyDataText="There are no data records to display." ForeColor="Black" 
            GridLines="None">
            <Columns>
                <asp:BoundField DataField="RoleName" HeaderText="RoleName" 
                    SortExpression="RoleName" />
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
            DeleteCommand="DELETE FROM [aspnet_Roles] WHERE [RoleId] = @RoleId" 
            InsertCommand="INSERT INTO [aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (@ApplicationId, @RoleId, @RoleName, @LoweredRoleName, @Description)" 
            ProviderName="<%$ ConnectionStrings:bugtracConnectionString1.ProviderName %>" 
            SelectCommand="SELECT [ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description] FROM [aspnet_Roles]" 
            UpdateCommand="UPDATE [aspnet_Roles] SET [ApplicationId] = @ApplicationId, [RoleName] = @RoleName, [LoweredRoleName] = @LoweredRoleName, [Description] = @Description WHERE [RoleId] = @RoleId">
            <DeleteParameters>
                <asp:Parameter Name="RoleId" Type="Object" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ApplicationId" Type="Object" />
                <asp:Parameter Name="RoleId" Type="Object" />
                <asp:Parameter Name="RoleName" Type="String" />
                <asp:Parameter Name="LoweredRoleName" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ApplicationId" Type="Object" />
                <asp:Parameter Name="RoleName" Type="String" />
                <asp:Parameter Name="LoweredRoleName" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="RoleId" Type="Object" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>


<%@ Page Language="C#" MasterPageFile="~/MasterBug.master" AutoEventWireup="true" CodeFile="Priorities.aspx.cs" Inherits="Administrator_Priorities" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <p>
    <asp:Button ID="btnNewPriority" runat="server" Text="Add New Priority" 
            onclick="btnNewProject_Click" />
    &nbsp;<br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblPriorityName" runat="server" Text="Enter Priority" 
        Visible="False"></asp:Label>
        
    &nbsp;<asp:TextBox ID="txtPriorityName" runat="server" Visible="False"></asp:TextBox>
        
    <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnCreate" runat="server" onclick="btnCreate_Click" 
            Text="Create" Visible="False" />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
            BorderWidth="1px" CellPadding="2" DataKeyNames="priority_id" 
            DataSourceID="SqlDataSource1" 
            EmptyDataText="There are no data records to display." ForeColor="Black" 
            GridLines="None">
            <Columns>
                <asp:BoundField DataField="priority_id" HeaderText="priority_id" 
                    ReadOnly="True" SortExpression="priority_id" />
                <asp:BoundField DataField="priority_desc" HeaderText="priority_desc" 
                    SortExpression="priority_desc" />
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
            DeleteCommand="DELETE FROM [priorities] WHERE [priority_id] = @priority_id" 
            InsertCommand="INSERT INTO [priorities] ([priority_desc]) VALUES (@priority_desc)" 
            ProviderName="<%$ ConnectionStrings:bugtracConnectionString1.ProviderName %>" 
            SelectCommand="SELECT [priority_id], [priority_desc] FROM [priorities]" 
            UpdateCommand="UPDATE [priorities] SET [priority_desc] = @priority_desc WHERE [priority_id] = @priority_id">
            <DeleteParameters>
                <asp:Parameter Name="priority_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="priority_desc" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="priority_desc" Type="String" />
                <asp:Parameter Name="priority_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>


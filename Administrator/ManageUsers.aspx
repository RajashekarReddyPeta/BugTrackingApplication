<%@ Page Language="C#" MasterPageFile="~/MasterBug.master" AutoEventWireup="true" CodeFile="ManageUsers.aspx.cs" Inherits="Administrator_ManageUsers" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
            BorderWidth="1px" CellPadding="2" DataKeyNames="employee_id,employee_name" 
            EmptyDataText="There are no data records to display." ForeColor="Black" 
            GridLines="None" onrowdeleting="GridView1_RowDeleting" Width="330px">
            <Columns>
                <asp:BoundField DataField="employee_name" HeaderText="Employee Name" 
                    SortExpression="employee_name" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
            <FooterStyle BackColor="Tan" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
        </asp:GridView>
<br />
</p>
</asp:Content>


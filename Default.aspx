<%@ Page Language="C#" MasterPageFile="~/MasterBug.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <p><h3><asp:LoginName ID="LoginName1" runat="server" 
        FormatString="Welcome! {0}" />
        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                    </h3>
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" DataKeyNames="bug_id" DataSourceID="SqlDataSource1" 
        EmptyDataText="There are no data records to display." CellPadding="2" 
        ForeColor="Black" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
    BorderStyle="Solid" BorderWidth="2px" CellSpacing="1" 
        Visible="False" >
        <RowStyle HorizontalAlign="Left" />
        <Columns>
            <asp:BoundField DataField="bug_id" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="bug_id" />
            <asp:HyperLinkField DataTextField="bug_name" HeaderText="Bug Description" 
                DataNavigateUrlFields="bug_id" 
                DataNavigateUrlFormatString="~/AddBugs.aspx?bug_id={0}" 
                DataTextFormatString="{0}" />
                 <%--Hyperlink field
                     DataTextField-- specifies the field or coloum bound to the hyperlink
                     HeaderText-- specifies the name displayed in the table
                     DataNavigateUrlFields--Use the DataNavigateUrlFields property when the data source contains multiple fields that must be combined to create the 
                                            hyperlinks for the HyperLinkField object. The fields specified in the DataNavigateUrlFields property are combined with the 
                                            format string in the DataNavigateUrlFormatString property to construct the hyperlinks in the HyperLinkField object. 
                     DataNavigateUrlFormatString--Use the DataNavigateUrlFormatString property to specify a custom format for the URLs of the hyperlinks in a HyperLinkField object. If the DataNavigateUrlFormatString property is not set, the hyperlinks' URLs do not get any special formatting.
                     DataTextFormatString--The format string can be any literal string and usually includes a placeholder for the field's value. For example, in the format string "Item Value: {0}", the {0} placeholder is replaced with the field's value in the HyperLinkField object. The rest of the format string is displayed as literal text.
                 --%>
            <asp:BoundField DataField="priority_desc" HeaderText="Priority" 
                SortExpression="priority_desc" />
            <asp:BoundField DataField="project_name" HeaderText="Project" 
                SortExpression="project_name" />
            <asp:BoundField DataField="status" HeaderText="Status" 
                SortExpression="status" />
            <asp:BoundField DataField="employee_name" HeaderText="Assigned To" 
                SortExpression="employee_name" />
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
        DeleteCommand="DELETE FROM [bugs] WHERE [bug_id] = @bug_id" 
        InsertCommand="INSERT INTO [bugs] ([project_id], [priority_id], [status_id], [bug_name], [bug_desc], [resolution], [assigned_by], [assigned_to], [date_assigned], [date_resolved]) VALUES (@project_id, @priority_id, @status_id, @bug_name, @bug_desc, @resolution, @assigned_by, @assigned_to, @date_assigned, @date_resolved)" 
        ProviderName="<%$ ConnectionStrings:bugtracConnectionString1.ProviderName %>" 
        SelectCommand="SELECT bugs.bug_id, priorities.priority_desc, projects.project_name, statuses.status, bugs.bug_name, bugs.bug_desc, bugs.resolution, bugs.assigned_by, employees.employee_name, bugs.date_assigned, bugs.date_resolved FROM bugs INNER JOIN projects ON bugs.project_id = projects.project_id INNER JOIN priorities ON bugs.priority_id = priorities.priority_id INNER JOIN statuses ON bugs.status_id = statuses.status_id INNER JOIN employees ON bugs.assigned_to = employees.employee_id WHERE (employees.employee_name = @a)" 
        
    
        UpdateCommand="UPDATE [bugs] SET [project_id] = @project_id, [priority_id] = @priority_id, [status_id] = @status_id, [bug_name] = @bug_name, [bug_desc] = @bug_desc, [resolution] = @resolution, [assigned_by] = @assigned_by, [assigned_to] = @assigned_to, [date_assigned] = @date_assigned, [date_resolved] = @date_resolved WHERE [bug_id] = @bug_id">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label1" Name="a" PropertyName="Text" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="bug_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="project_id" Type="Int32" />
            <asp:Parameter Name="priority_id" Type="Int32" />
            <asp:Parameter Name="status_id" Type="Int32" />
            <asp:Parameter Name="bug_name" Type="String" />
            <asp:Parameter Name="bug_desc" Type="String" />
            <asp:Parameter Name="resolution" Type="String" />
            <asp:Parameter Name="assigned_by" Type="Int32" />
            <asp:Parameter Name="assigned_to" Type="Int32" />
            <asp:Parameter Name="date_assigned" Type="DateTime" />
            <asp:Parameter Name="date_resolved" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="project_id" Type="Int32" />
            <asp:Parameter Name="priority_id" Type="Int32" />
            <asp:Parameter Name="status_id" Type="Int32" />
            <asp:Parameter Name="bug_name" Type="String" />
            <asp:Parameter Name="bug_desc" Type="String" />
            <asp:Parameter Name="resolution" Type="String" />
            <asp:Parameter Name="assigned_by" Type="Int32" />
            <asp:Parameter Name="assigned_to" Type="Int32" />
            <asp:Parameter Name="date_assigned" Type="DateTime" />
            <asp:Parameter Name="date_resolved" Type="DateTime" />
            <asp:Parameter Name="bug_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView2" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" DataKeyNames="bug_id" DataSourceID="SqlDataSource2" 
        EmptyDataText="There are no data records to display." CellPadding="2" 
        ForeColor="Black" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
    BorderStyle="Solid" BorderWidth="2px" CellSpacing="1" Visible="False" >
        <RowStyle HorizontalAlign="Left" />
        <Columns>
            <asp:BoundField DataField="bug_id" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="bug_id" />
            <asp:HyperLinkField DataTextField="bug_name" HeaderText="Bug Description" 
                DataNavigateUrlFields="bug_id" 
                DataNavigateUrlFormatString="~/AddBugs.aspx?bug_id={0}" 
                DataTextFormatString="{0}" />
                 <%--Hyperlink field
                     DataTextField-- specifies the field or coloum bound to the hyperlink
                     HeaderText-- specifies the name displayed in the table
                     DataNavigateUrlFields--Use the DataNavigateUrlFields property when the data source contains multiple fields that must be combined to create the 
                                            hyperlinks for the HyperLinkField object. The fields specified in the DataNavigateUrlFields property are combined with the 
                                            format string in the DataNavigateUrlFormatString property to construct the hyperlinks in the HyperLinkField object. 
                     DataNavigateUrlFormatString--Use the DataNavigateUrlFormatString property to specify a custom format for the URLs of the hyperlinks in a HyperLinkField object. If the DataNavigateUrlFormatString property is not set, the hyperlinks' URLs do not get any special formatting.
                     DataTextFormatString--The format string can be any literal string and usually includes a placeholder for the field's value. For example, in the format string "Item Value: {0}", the {0} placeholder is replaced with the field's value in the HyperLinkField object. The rest of the format string is displayed as literal text.
                 --%>
            <asp:BoundField DataField="priority_desc" HeaderText="Priority" 
                SortExpression="priority_desc" />
            <asp:BoundField DataField="project_name" HeaderText="Project" 
                SortExpression="project_name" />
            <asp:BoundField DataField="status" HeaderText="Status" 
                SortExpression="status" />
            <asp:BoundField DataField="employee_name" HeaderText="Assigned To" 
                SortExpression="employee_name" />
        </Columns>
        <FooterStyle BackColor="Tan" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
            HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:bugtracConnectionString1 %>" 
        DeleteCommand="DELETE FROM [bugs] WHERE [bug_id] = @bug_id" 
        InsertCommand="INSERT INTO [bugs] ([project_id], [priority_id], [status_id], [bug_name], [bug_desc], [resolution], [assigned_by], [assigned_to], [date_assigned], [date_resolved]) VALUES (@project_id, @priority_id, @status_id, @bug_name, @bug_desc, @resolution, @assigned_by, @assigned_to, @date_assigned, @date_resolved)" 
        ProviderName="<%$ ConnectionStrings:bugtracConnectionString1.ProviderName %>" 
        SelectCommand="SELECT bugs.bug_id, priorities.priority_desc, projects.project_name, statuses.status, bugs.bug_name, bugs.bug_desc, bugs.resolution, bugs.assigned_by, employees.employee_name, bugs.date_assigned, bugs.date_resolved FROM bugs INNER JOIN projects ON bugs.project_id = projects.project_id INNER JOIN priorities ON bugs.priority_id = priorities.priority_id INNER JOIN statuses ON bugs.status_id = statuses.status_id INNER JOIN employees ON bugs.assigned_to = employees.employee_id" 
        
    
        
        UpdateCommand="UPDATE [bugs] SET [project_id] = @project_id, [priority_id] = @priority_id, [status_id] = @status_id, [bug_name] = @bug_name, [bug_desc] = @bug_desc, [resolution] = @resolution, [assigned_by] = @assigned_by, [assigned_to] = @assigned_to, [date_assigned] = @date_assigned, [date_resolved] = @date_resolved WHERE [bug_id] = @bug_id">
        <DeleteParameters>
            <asp:Parameter Name="bug_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="project_id" Type="Int32" />
            <asp:Parameter Name="priority_id" Type="Int32" />
            <asp:Parameter Name="status_id" Type="Int32" />
            <asp:Parameter Name="bug_name" Type="String" />
            <asp:Parameter Name="bug_desc" Type="String" />
            <asp:Parameter Name="resolution" Type="String" />
            <asp:Parameter Name="assigned_by" Type="Int32" />
            <asp:Parameter Name="assigned_to" Type="Int32" />
            <asp:Parameter Name="date_assigned" Type="DateTime" />
            <asp:Parameter Name="date_resolved" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="project_id" Type="Int32" />
            <asp:Parameter Name="priority_id" Type="Int32" />
            <asp:Parameter Name="status_id" Type="Int32" />
            <asp:Parameter Name="bug_name" Type="String" />
            <asp:Parameter Name="bug_desc" Type="String" />
            <asp:Parameter Name="resolution" Type="String" />
            <asp:Parameter Name="assigned_by" Type="Int32" />
            <asp:Parameter Name="assigned_to" Type="Int32" />
            <asp:Parameter Name="date_assigned" Type="DateTime" />
            <asp:Parameter Name="date_resolved" Type="DateTime" />
            <asp:Parameter Name="bug_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </asp:Content>


<%@ Page Language="C#" AutoEventWireup="true" CodeFile="search.aspx.cs" MasterPageFile="~/MasterBug.master" Inherits="search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            border: 2px solid tan;
            margin: 1px;
            width: 100%;
            color: #000000;
            
        }
        .style2
        {
            border: 2px solid tan;
            margin: 1px;
            width: 100%;
            margin-right: auto;
            margin-left: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div>

       <table class="style1" bgcolor="LightGoldenrodYellow" cellpadding="2" 
        frame="border" title="Search">
            <tr>
                <td>
        <asp:Label ID="lblid" runat="server" Text="Bug Name"></asp:Label>
                </td>
                <td>
        <asp:DropDownList ID="ddlbid" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="bug_name" 
            DataValueField="bug_id" AppendDataBoundItems="True">
            <asp:ListItem Selected="True" Value="0">Select</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:bugtracConnectionString1 %>" 
            SelectCommand="SELECT [bug_id], [bug_name] FROM [bugs] ORDER BY [bug_name]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
        <asp:Label ID="lblpid" runat="server" Text="Project"></asp:Label>
                </td>
                <td>
        <asp:DropDownList ID="ddlpid" runat="server" 
            DataSourceID="SqlDataSource2" DataTextField="project_name" 
            DataValueField="project_id" AppendDataBoundItems="True">
            <asp:ListItem Selected="True" Value="0">Select</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:bugtracConnectionString1 %>" 
            
                        SelectCommand="SELECT [project_id], [project_name] FROM [projects] ORDER BY [project_name]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
        <asp:Label ID="lblpriority" runat="server" Text="Priority"></asp:Label>
                </td>
                <td>
        
        <asp:DropDownList ID="ddlp" runat="server" 
            DataSourceID="SqlDataSource3" DataTextField="priority_desc" 
            DataValueField="priority_id" AppendDataBoundItems="True">
            <asp:ListItem Selected="True" Value="0">Select</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:bugtracConnectionString1 %>" 
            SelectCommand="SELECT [priority_desc], [priority_id] FROM [priorities]">
        </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
        <asp:Label ID="lblstatus" runat="server" Text="Status"></asp:Label>
                </td>
                <td>
        <asp:DropDownList ID="ddlstatus" runat="server" 
            DataSourceID="SqlDataSource4" DataTextField="status" 
            DataValueField="status_id" AppendDataBoundItems="True">
            <asp:ListItem Selected="True" Value="0">Select</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:bugtracConnectionString1 %>" 
            SelectCommand="SELECT [status_id], [status] FROM [statuses]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:RadioButton ID="rbnor" runat="server" GroupName="Logic" Text="Or Logic" />
                    <asp:RadioButton ID="rbnand"  runat="server" GroupName="Logic" 
                        Text="And Logic" />
                    </td>
                <td align=>
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Search" />
                </td>
            </tr>
            </table>
&nbsp;<br />
       <asp:GridView ID="GridView2" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" DataKeyNames="bug_id" DataSourceID="SqlDataSource6" 
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
       <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
           ConnectionString="<%$ ConnectionStrings:bugtracConnectionString1 %>" 
           SelectCommand="SELECT bugs.bug_id, priorities.priority_desc, priorities.priority_id, projects.project_name, projects.project_id, statuses.status,statuses.status_id, bugs.bug_name, bugs.bug_desc, bugs.resolution, bugs.assigned_by,  bugs.assigned_to,employees.employee_name, bugs.date_assigned, bugs.date_resolved FROM bugs INNER JOIN projects ON bugs.project_id = projects.project_id INNER JOIN priorities ON bugs.priority_id = priorities.priority_id INNER JOIN statuses ON bugs.status_id = statuses.status_id INNER JOIN employees ON bugs.assigned_to = employees.employee_id WHERE (bugs.bug_id = @a) or (projects.project_id = @b) or (priorities.priority_id = @c) or (statuses.status_id = @d )">
           <SelectParameters>
               <asp:ControlParameter ControlID="ddlbid" Name="a" 
                   PropertyName="SelectedValue" />
               <asp:ControlParameter ControlID="ddlpid" Name="b" 
                   PropertyName="SelectedValue" />
               <asp:ControlParameter ControlID="ddlp" Name="c" PropertyName="SelectedValue" />
               <asp:ControlParameter ControlID="ddlstatus" Name="d" 
                   PropertyName="SelectedValue" />
           </SelectParameters>
       </asp:SqlDataSource>
       <br />
       <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" DataKeyNames="bug_id" DataSourceID="SqlDataSource5" 
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
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:bugtracConnectionString1 %>" 
            DeleteCommand="DELETE FROM [bugs] WHERE [bug_id] = @bug_id" 
            InsertCommand="INSERT INTO [bugs] ([project_id], [priority_id], [status_id], [bug_name], [bug_desc], [resolution], [assigned_by], [assigned_to], [date_assigned], [date_resolved]) VALUES (@project_id, @priority_id, @status_id, @bug_name, @bug_desc, @resolution, @assigned_by, @assigned_to, @date_assigned, @date_resolved)" 
            ProviderName="<%$ ConnectionStrings:bugtracConnectionString1.ProviderName %>" 
            SelectCommand="SELECT bugs.bug_id, priorities.priority_desc, priorities.priority_id, projects.project_name, projects.project_id, statuses.status, statuses.status_id, bugs.bug_name, bugs.bug_desc, bugs.resolution, bugs.assigned_by, bugs.assigned_to, employees.employee_name, bugs.date_assigned, bugs.date_resolved FROM bugs INNER JOIN projects ON bugs.project_id = projects.project_id INNER JOIN priorities ON bugs.priority_id = priorities.priority_id INNER JOIN statuses ON bugs.status_id = statuses.status_id INNER JOIN employees ON bugs.assigned_to = employees.employee_id WHERE (bugs.bug_id = @a) AND (projects.project_id = @b) AND (priorities.priority_id = @c) AND (statuses.status_id = @d )" 
            
           UpdateCommand="UPDATE [bugs] SET [project_id] = @project_id, [priority_id] = @priority_id, [status_id] = @status_id, [bug_name] = @bug_name, [bug_desc] = @bug_desc, [resolution] = @resolution, [assigned_by] = @assigned_by, [assigned_to] = @assigned_to, [date_assigned] = @date_assigned, [date_resolved] = @date_resolved WHERE [bug_id] = @bug_id">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlbid" Name="a" 
                    PropertyName="SelectedValue" DefaultValue="0" />
                <asp:ControlParameter ControlID="ddlpid" Name="b" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="ddlp" Name="c" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="ddlstatus" Name="d" 
                    PropertyName="SelectedValue" />
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
       <p>
        
           <table class="style2" bgcolor="LightGoldenrodYellow" cellpadding="2" 
        frame="border" >
               <tr>
                   <td align=center>
                       <asp:TextBox ID="txtSearchInput" runat="server" Width="500px"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td align=center>
                    <asp:Button ID="btnBasicSearch" runat="server" onclick="btnBasicSearch_Click" 
                           Text="Search" />
                   </td>
               </tr>
           </table>
           
            <br />
       <asp:GridView ID="GridView3" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" DataKeyNames="bug_id" DataSourceID="SqlDataSource7" 
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
       
           <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
               ConnectionString="<%$ ConnectionStrings:bugtracConnectionString1 %>" 
               SelectCommand="SELECT bugs.bug_id, priorities.priority_desc, priorities.priority_id, projects.project_name, projects.project_id, statuses.status, statuses.status_id, bugs.bug_name, bugs.bug_desc, bugs.resolution, bugs.assigned_by, bugs.assigned_to, employees.employee_name, bugs.date_assigned, bugs.date_resolved FROM bugs INNER JOIN projects ON bugs.project_id = projects.project_id INNER JOIN priorities ON bugs.priority_id = priorities.priority_id INNER JOIN statuses ON bugs.status_id = statuses.status_id INNER JOIN employees ON bugs.assigned_to = employees.employee_id WHERE (UPPER(bugs.bug_name) LIKE '%' + @a + '%')">
               <SelectParameters>
                   <asp:ControlParameter ControlID="txtSearchInput" Name="a" PropertyName="Text" />
               </SelectParameters>
           </asp:SqlDataSource>
        
        <br />    
        <br />
        </div>
    </asp:Content>
   

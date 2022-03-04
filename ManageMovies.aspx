<%@ Page Title="" Language="C#" MasterPageFile="~/masterAdmin.Master" AutoEventWireup="true" CodeBehind="ManageMovies.aspx.cs" Inherits="Group_6_IT114L_MP.ManageMovies" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <center> <h1>Sales report</h1> 
            <hr />
        <div class="movcontainer">
            <asp:GridView ID="GridView3" runat="server" DataSourceID="TicketSold" BackColor="#FFFFCC" BorderColor="#CC0000" ForeColor="#660033" AutoGenerateColumns="False" DataKeyNames="PurchaseID">
                    <Columns>
                        <asp:BoundField DataField="PurchaseID" HeaderText="PurchaseID" InsertVisible="False" ReadOnly="True" SortExpression="PurchaseID" />
                        <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
                    </Columns>
                    <EditRowStyle BackColor="#FFFF66" BorderColor="#993366" BorderStyle="Inset" />
                    <EmptyDataRowStyle BorderColor="#993366" BorderStyle="Inset" ForeColor="#990000" />
                    <HeaderStyle BackColor="#ffcc00" Font-Bold="True" BorderStyle="Inset" />
                    <RowStyle BorderColor="#993366" BorderStyle="Inset" />
                </asp:GridView>

            <asp:GridView ID="GridView4" runat="server" DataSourceID="TotalRevenue" BackColor="#FFFFCC" BorderColor="Red" ForeColor="#660033" AutoGenerateColumns="False" >
                    <Columns>
                        <asp:BoundField DataField="TotalRevenue" HeaderText="TotalRevenue" SortExpression="TotalRevenue" />
                    </Columns>
                    <EditRowStyle BackColor="#FFFF66" BorderColor="#993366" BorderStyle="Inset" />
                    <EmptyDataRowStyle BorderColor="#993366" BorderStyle="Inset" />
                    <HeaderStyle BackColor="#ffcc00" Font-Bold="True" />
                    <RowStyle BorderColor="#993366" BorderStyle="Inset" />
                </asp:GridView>

            <asp:SqlDataSource ID="TicketSold" runat="server" ConnectionString="<%$ ConnectionStrings:CinemaConnectionString2 %>" 
                ProviderName="<%$ ConnectionStrings:CinemaConnectionString2.ProviderName %>" 
                SelectCommand="SELECT * FROM [Purchase]"></asp:SqlDataSource>

            <asp:SqlDataSource ID="TotalRevenue" runat="server" ConnectionString="<%$ ConnectionStrings:CinemaConnectionString3 %>" 
                ProviderName="<%$ ConnectionStrings:CinemaConnectionString3.ProviderName %>" 
                SelectCommand="SELECT SUM(Total) AS TotalRevenue FROM Purchase"></asp:SqlDataSource>
        <br />
        </div>
            </center>
    </div>
    <div class="container">
        <div class ="movcontainer">
            <h1 style="text-align: center;">Manage Movies</h1> 
            </div>
                <hr />
        <center>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MovID" DataSourceID="SqlDataSource1">
            <HeaderStyle BackColor="#ffcc00" Font-Bold="True" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="MovID" HeaderText="MovID" InsertVisible="False" ReadOnly="True" SortExpression="MovID" Visible="False" />
                <asp:BoundField DataField="Mov_name" HeaderText="Movie" SortExpression="Mov_name" />
                <asp:BoundField DataField="Mov_time" HeaderText="Time" SortExpression="Mov_time" />
                <asp:BoundField DataField="Mov_date" HeaderText="Date" SortExpression="Mov_date" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CinemaConnectionString %>" DeleteCommand="DELETE FROM [Movies] WHERE [MovID] = ?" InsertCommand="INSERT INTO [Movies] ([MovID], [Mov_name], [Mov_time], [Mov_date], [Price]) VALUES (?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:CinemaConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Movies]" UpdateCommand="UPDATE [Movies] SET [Mov_name] = ?, [Mov_time] = ?, [Mov_date] = ?, [Price] = ? WHERE [MovID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="MovID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MovID" Type="Int32" />
                <asp:Parameter Name="Mov_name" Type="String" />
                <asp:Parameter Name="Mov_time" Type="String" />
                <asp:Parameter Name="Mov_date" Type="DateTime" />
                <asp:Parameter Name="Price" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Mov_name" Type="String" />
                <asp:Parameter Name="Mov_time" Type="String" />
                <asp:Parameter Name="Mov_date" Type="DateTime" />
                <asp:Parameter Name="Price" Type="Int32" />
                <asp:Parameter Name="MovID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse">
            <tr>
                <td style="width: 140px">
                    Movie:<br />
                    <asp:TextBox ID="MovName" runat="server" Width="140" />
                </td>
                <td style="width: 140px">
                    Time:<br />
                    <asp:TextBox ID="MovTime" runat="server" Width="140" />
                </td>
                <td style="width: 140px">
                    Date:<br />
                    <asp:TextBox ID="MovDate" runat="server" Width="140" />
                </td>
                <td style="width: 140px">
                    Price:<br />
                    <asp:TextBox ID="Price" runat="server" Width="140" />

                </td>
                <td style="width: 140px">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="Insert" />
                </td>
            </tr>
        </table>
            </center>
    </div>
  <%--  Manage acc--%>
     <div class="container">
        <div class ="movcontainer">
            <h1 style="text-align: center;">Manage Accounts</h1> 
            </div>
                <hr />
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="True" UpdateMode="Always">
            <ContentTemplate>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="CustomerId" DataSourceID="SqlDataSource1">
            <HeaderStyle BackColor="#ffcc00" Font-Bold="True" />
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                <asp:BoundField DataField="CustomerId" HeaderText="CustomerId" InsertVisible="False" ReadOnly="True" SortExpression="CustomerId" Visible="False" />
                <asp:BoundField DataField="xLastname" HeaderText="Lastname" SortExpression="xLastname" />
                <asp:BoundField DataField="xFirstname" HeaderText="Firstname" SortExpression="xFirstname" />
                <asp:BoundField DataField="xEmail" HeaderText="Email" SortExpression="xEmail" />
                <asp:BoundField DataField="xPassword" HeaderText="Password" SortExpression="xPassword" />
                <asp:TemplateField HeaderText="Payment" SortExpression="Payment">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="xPayment" DataValueField="xPayment" SelectedValue='<%# Bind("xPayment") %>'>
                        <asp:ListItem>Cash</asp:ListItem>
                        <asp:ListItem>Credit Card</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CinemaConnectionString %>" ProviderName="<%$ ConnectionStrings:CinemaConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT [xPayment] FROM [Users]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("xPayment") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="xAddress" HeaderText="Address" SortExpression="xAddress" />
            </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CinemaConnectionString %>" ProviderName="<%$ ConnectionStrings:CinemaConnectionString.ProviderName %>" 
                DeleteCommand="DELETE FROM [Users] WHERE [CustomerId] = ?" 
                InsertCommand="INSERT INTO [Users] ([CustomerId], [xLastname], [xFirstname], [xEmail], [xPassword], [xPayment], [xAddress]) VALUES (?, ?, ?, ?, ?, ?, ?)" 
                SelectCommand="SELECT * FROM [Users]" 
                UpdateCommand="UPDATE [Users] SET [xLastname] = ?, [xFirstname] = ?, [xEmail] = ?, [xPassword] = ?, [xPayment] = ?, [xAddress] = ? WHERE [CustomerId] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="CustomerId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CustomerId" Type="Int32" />
                    <asp:Parameter Name="xLastname" Type="String" />
                    <asp:Parameter Name="xFirstname" Type="String" />
                    <asp:Parameter Name="xEmail" Type="String" />
                    <asp:Parameter Name="xPassword" Type="String" />
                    <asp:Parameter Name="xPayment" Type="String" />
                    <asp:Parameter Name="xAddress" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="xLastname" Type="String" />
                    <asp:Parameter Name="xFirstname" Type="String" />
                    <asp:Parameter Name="xEmail" Type="String" />
                    <asp:Parameter Name="xPassword" Type="String" />
                    <asp:Parameter Name="xPayment" Type="String" />
                    <asp:Parameter Name="xAddress" Type="String" />
                    <asp:Parameter Name="CustomerId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

                <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse">
            <tr>
                <td style="width: 140px">
                    Lastname:<br />
                    <asp:TextBox ID="LastTB" runat="server" Width="140" />
                </td>
                <td style="width: 140px">
                    Firstname:<br />
                    <asp:TextBox ID="FirstTB" runat="server" Width="140" />
                </td>
                <td style="width: 140px">
                    Email:<br />
                    <asp:TextBox ID="EmailTB" runat="server" Width="140" />
                </td>
                <td style="width: 140px">
                    Password:<br />
                    <asp:TextBox ID="PasswordTB" runat="server" Width="140" />
                </td>
                <td style="width: 140px">
                    Payment:<br />
                    <asp:DropDownList ID="PaymentDDL" runat="server" Width="140" AutoPostBack="True">
                        <asp:ListItem>Select payment method</asp:ListItem>
                        <asp:ListItem>Cash</asp:ListItem>
                        <asp:ListItem>Credit Card</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style="width: 140px">
                    Address:<br />
                    <asp:TextBox ID="AddressTB" runat="server" Width="140" />
                </td>
                <td style="width: 140px">
                    <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Insert" />
                </td>
            </tr>
        </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        
        </div>


</asp:Content>

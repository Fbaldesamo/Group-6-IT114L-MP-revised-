<%@ Page Title="" Language="C#" MasterPageFile="~/master2.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Group_6_IT114L_MP.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="cartform" runat="server" class="container">
        <center>
            <h1>My Cart</h1>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TicketID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="TicketID" HeaderText="Ticket ID" InsertVisible="False" ReadOnly="True" SortExpression="TicketID" />
                    <asp:BoundField DataField="Mov_name" HeaderText="Movie" SortExpression="Mov_name" />
                    <asp:BoundField DataField="Mov_time" HeaderText="Time" SortExpression="Mov_time" />
                    <asp:BoundField DataField="Mov_date" HeaderText="Date" SortExpression="Mov_date" />
                    <asp:BoundField DataField="Parkingspace" HeaderText="Parking Space" SortExpression="Parkingspace" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CinemaConnectionString2 %>" 
                ProviderName="<%$ ConnectionStrings:CinemaConnectionString2.ProviderName %>" 
                SelectCommand="SELECT [TicketID], [Mov_name], [Mov_time], [Mov_date], [Parkingspace], [Total] FROM [MovieChoice] WHERE ([User_email] = ?)">
                <SelectParameters>
                    <asp:SessionParameter Name="User_email" SessionField="usermail" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            </center>
            <asp:Label ID="Label2" runat="server" Text="Total" CssClass="labelz"></asp:Label>
            <asp:TextBox ID="Total" runat="server" CssClass="textbox" ReadOnly="true"></asp:TextBox>
        <br />
            <center>
        <asp:Button ID="Purchase" runat="server" Text="Purchase" class="button" OnClick="Purchase_Click"/>
        <asp:Button ID="Back" runat="server" Text="Back to Main" class="button" OnClick="Back_Click"/>
            </center>
        </form>
</asp:Content>

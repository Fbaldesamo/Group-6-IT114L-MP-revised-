<%@ Page Title="" Language="C#" MasterPageFile="~/master2.Master" AutoEventWireup="true" CodeBehind="Movies.aspx.cs" Inherits="Group_6_IT114L_MP.Categories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="movform" runat="server" class="bg-image2">
         <center>
        <h2 class="css-reflects">NOW SHOWING</h2>
         <div class="align">
             <asp:Image ID="Image1" runat="server" ImageUrl="~/img/batman.jpg" CssClass="shadow" /> 
             <br /><br />
             <asp:Label ID="Name1" runat="server" CssClass="label">
            The Batman</asp:Label><br />
            <asp:Label ID="Time1" runat="server" CssClass="label">
            Coming Soon</asp:Label><br />
            <asp:Label ID="Date1" runat="server" CssClass="label">
            MARCH 4 2022</asp:Label>
         </div>

         <div class="align">
             <asp:Image ID="Image2" runat="server" ImageUrl="~/img/turningred.jpg" CssClass="shadow" />
             <br /><br />
             <asp:Label ID="Name2" runat="server" CssClass="label">
            Turning Red</asp:Label><br />
            <asp:Label ID="Time2" runat="server" CssClass="label">
            Coming Soon</asp:Label><br />
            <asp:Label ID="Date2" runat="server" CssClass="label">
            MARCH 11 2022</asp:Label>
         </div>

         <div class="align">
             <asp:Image ID="Image3" runat="server" ImageUrl="~/img/lostcity.jpg" CssClass="shadow" />
             <br /><br />
             <asp:Label ID="Name3" runat="server" CssClass="label">
            The Lost City</asp:Label><br />
            <asp:Label ID="Time3" runat="server" CssClass="label">
            Coming Soon</asp:Label><br />
            <asp:Label ID="Date3" runat="server" CssClass="label">
            MARCH 25 2022</asp:Label>
         </div>
        <br />
        <br />
        <br />
        <br />
    
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2" ForeColor="White" AutoGenerateColumns="False" DataKeyNames="MovID">
            <HeaderStyle BackColor="#ffcc00" Font-Bold="True" ForeColor="Black"/>
            <Columns>
                <asp:BoundField DataField="MovID" HeaderText="MovID" InsertVisible="False" ReadOnly="True" SortExpression="MovID" Visible="False" />

                <asp:BoundField DataField="Mov_name" HeaderText="Movie" SortExpression="Mov_name" />
                <asp:BoundField DataField="Mov_time" HeaderText="Time" SortExpression="Mov_time" />
                <asp:BoundField DataField="Mov_date" HeaderText="Date" SortExpression="Mov_date" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CinemaConnectionString %>" ProviderName="<%$ ConnectionStrings:CinemaConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Movies]"></asp:SqlDataSource>

        <div>
            <h2 class="css-reflects">Buy Ticket</h2>
            </div>
            </center>
            <div class="container">
                
                <asp:Label ID="Label4" runat="server" Text="Movie" CssClass="labelz"></asp:Label>
                <asp:Label ID="MovieWarning" runat="server"><span style="color: red;">*</span></asp:Label>
                <asp:DropDownList ID="MovieDDL" runat="server" CssClass="dropdown" DataSourceID="SqlDataSource1" DataTextField="Mov_name" DataValueField="Mov_name">
                </asp:DropDownList>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CinemaConnectionString %>" ProviderName="<%$ ConnectionStrings:CinemaConnectionString.ProviderName %>" SelectCommand="SELECT [Mov_name] FROM [Movies]"></asp:SqlDataSource>
                <asp:Label ID="Label3" runat="server" Text="Quantity [1-20]" CssClass="labelz"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="QuantityTB"><span style="color: red;">*</span></asp:RequiredFieldValidator>
                <asp:TextBox ID="QuantityTB" runat="server" CssClass="textbox" OnTextChanged="QuantityTB_TextChanged"></asp:TextBox>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="QuantityTB" Type="Integer" MaximumValue="20" MinimumValue="1">
                    <span style="color: red;">Invalid value</span></asp:RangeValidator>
            <br />
                <asp:Label ID="Label5" runat="server" Text="Time:" CssClass="labelz"></asp:Label>
                <asp:Label ID="Time" runat="server" Text="00:00" CssClass="labelz"></asp:Label>
                <br />
                <asp:Label ID="Label6" runat="server" Text="Date:" CssClass="labelz"></asp:Label>
                <asp:Label ID="Date" runat="server" Text="1/1/2022" CssClass="labelz"></asp:Label>
                <br />
            <center>
                <div class="rectangle">
                    <asp:Label ID="Label1" runat="server" Text="PARKING RESERVATION"></asp:Label>
                </div>
            <asp:CheckBoxList ID="ParkingLotCBL" runat="server" AutoPostBack="True" 
                RepeatColumns="4" Width="554px" OnSelectedIndexChanged="ParkingLotCBL_SelectedIndexChanged">
                <asp:ListItem>Lot 1</asp:ListItem>
                <asp:ListItem>Lot 2</asp:ListItem>
                <asp:ListItem>Lot 3</asp:ListItem>
                <asp:ListItem>Lot 4</asp:ListItem>
                <asp:ListItem>Lot 5</asp:ListItem>
                <asp:ListItem>Lot 6</asp:ListItem>
                <asp:ListItem>Lot 7</asp:ListItem>
                <asp:ListItem>Lot 8</asp:ListItem>
                <asp:ListItem>Lot 9</asp:ListItem>
                <asp:ListItem>Lot 10</asp:ListItem>
                <asp:ListItem>Lot 11</asp:ListItem>
                <asp:ListItem>Lot 12</asp:ListItem>
                <asp:ListItem>Lot 13</asp:ListItem>
                <asp:ListItem>Lot 14</asp:ListItem>
                <asp:ListItem>Lot 15</asp:ListItem>
                <asp:ListItem>Lot 16</asp:ListItem>
                <asp:ListItem>Lot 17</asp:ListItem>
                <asp:ListItem>Lot 18</asp:ListItem>
                <asp:ListItem>Lot 19</asp:ListItem>
                <asp:ListItem>Lot 20</asp:ListItem>
                </asp:CheckBoxList>
        </center>
            <asp:Label ID="Label2" runat="server" Text="Total" CssClass="labelz"></asp:Label>
            <asp:TextBox ID="Total" runat="server" CssClass="textbox" ReadOnly="true"></asp:TextBox>
            <center>
                <asp:Button ID="Purchase" runat="server" Text="Purchase" class="button" OnClick="Purchase_Click"/>
                <asp:Button ID="Cancel" runat="server" Text="Cancel" class="button" OnClick="Cancel_Click"/>
            </center>
            </div>
      <%--  <div class="bg-text">
            <h2 class="css-reflects">CATEGORIES</h2>
            <h3>View movies</h3>
            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="link" OnClick="LinkButton1_Click">NOW SHOWING</asp:LinkButton>
            <br />
            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="link" OnClick="LinkButton2_Click">UPCOMING</asp:LinkButton>
         </div>--%>
    </form>
</asp:Content>

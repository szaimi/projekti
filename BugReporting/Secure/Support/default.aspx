<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" MasterPageFile="~/Secure/Support/Site2.Master" Inherits="BugReporting.Secure.Support._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <%--<asp:Label ID="lblPershendetje" Text="" runat="server"></asp:Label>--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="page-header">
                    <h3>
                        <span class="fa fa-bar-chart"></span>Ticket e ardhura
                    </h3>
                </div>
                <div class="container">
                    <div class="row">
                 
        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-condensed table-hover table-responsive" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="tid" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="tid" HeaderText="Kodi Ticket" InsertVisible="False" ReadOnly="True" SortExpression="tid" />
                <asp:BoundField DataField="kemertimi" HeaderText="Klienti" SortExpression="kemertimi" />
                <asp:BoundField DataField="tsub" HeaderText="Subjekti" SortExpression="tsub" />
                <asp:BoundField DataField="tper" HeaderText="Permbajtja" SortExpression="tper" />
                <asp:BoundField DataField="semrtimi" HeaderText="statusi" SortExpression="semrtimi" />
                <asp:BoundField DataField="pemertimi" HeaderText="prioriteti" SortExpression="pemertimi" />
                <asp:BoundField DataField="Emri" HeaderText="Softi" SortExpression="Emri" />
                <asp:BoundField DataField="data" HeaderText="data" SortExpression="data" DataFormatString="{0:dd-MM-yyyy hh:mm tt}" />
                <asp:TemplateField HeaderText="Atasho">
                    <ItemTemplate>
                        <asp:Button ID="btnAtasho" runat="server" Text="Atasho ticket" CssClass="btn-primary btn" OnClick="btnAtasho_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>


      
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BugSystemConnectionString %>" 
            SelectCommand="SELECT Ticket.ID AS tid , Klient.Emertimi AS kemertimi, 
Ticket.Subjekti tsub, Ticket.Permbajtja AS tper,
Statusi.Emertimi AS semrtimi, Prioritet.Emertimi AS pemertimi, 
Softe.Emri, Ticket.Data as data

FROM dbo.Ticket INNER JOIN dbo.Klient ON Klient.ID = Ticket.KlientID
INNER JOIN dbo.Softe ON Softe.ID = Ticket.SoftID 
INNER JOIN dbo.Prioritet ON Prioritet.ID = Ticket.PrioritetID
INNER JOIN dbo.Statusi ON Statusi.ID = Ticket.StatusID
WHERE dbo.Ticket.ID NOT IN 
(
 SELECT dbo.Atashim.TicketID FROM dbo.Atashim
)"></asp:SqlDataSource>


                    </div> <!-- end row -->
                </div>
            </div>
        </div>
    </div><!-- /.container -->
</asp:Content>



      

















        


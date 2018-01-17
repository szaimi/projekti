<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" MasterPageFile="~/Secure/Punonjes/Site1.Master" Inherits="BugReporting.Secure.Punonjes._default" %>


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
                 


             <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-condensed table-hover table-responsive" AutoGenerateColumns="False" DataKeyNames="tid" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="tid" HeaderText="Kodi i Ticket" InsertVisible="False" ReadOnly="True" SortExpression="tid" />
                <asp:BoundField DataField="kemertimi" HeaderText="Klienti" SortExpression="kemertimi" />
                <asp:BoundField DataField="tsub" HeaderText="Subjekti" SortExpression="tsub" />
                <asp:BoundField DataField="tper" HeaderText="Pershkrimi" SortExpression="tper" />
                <asp:BoundField DataField="semrtimi" HeaderText="Statusi" SortExpression="semrtimi" />
                <asp:BoundField DataField="pemertimi" HeaderText="Prioriteti" SortExpression="pemertimi" />
                <asp:BoundField DataField="Emri" HeaderText="Softi" SortExpression="Emri" />
                <asp:BoundField DataField="data" HeaderText="Data e publikimit" SortExpression="data" />
                <asp:TemplateField HeaderText="Dergo pergjigje">
                    <ItemTemplate>
                        <asp:Button ID="btnPergjigje" runat="server" Text="Dergo pergjigje per ticketin" CssClass="btn btn-primary" OnClick="btnPergjigje_Click" />

                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BugSystemConnectionString %>" 
            SelectCommand="SELECT Ticket.ID AS tid , Klient.Emertimi AS kemertimi, 
Ticket.Subjekti tsub, Ticket.Permbajtja AS tper,
Statusi.Emertimi AS semrtimi, Prioritet.Emertimi AS pemertimi, 
Softe.Emri, Ticket.Data as data 
FROM dbo.Ticket
INNER JOIN dbo.Klient ON Klient.ID = Ticket.KlientID
INNER JOIN dbo.Prioritet ON Prioritet.ID = Ticket.PrioritetID
INNER JOIN dbo.Statusi ON Statusi.ID = Ticket.StatusID
INNER JOIN dbo.Softe ON Softe.ID = Ticket.SoftID
INNER JOIN dbo.Atashim ON Atashim.TicketID = Ticket.ID
WHERE PunonjesID = @punonjesid AND dbo.Ticket.StatusID=2">
            <SelectParameters>
                <asp:Parameter Name="punonjesid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>



                    </div> <!-- end row -->
                </div>
            </div>
        </div>
    </div><!-- /.container -->
</asp:Content>



      
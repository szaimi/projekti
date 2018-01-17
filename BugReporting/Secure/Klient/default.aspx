<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" MasterPageFile="~/Secure/Klient/Site1.Master" Inherits="BugReporting.Secure.Klient._default" %>

     

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <%--<asp:Label ID="lblPershendetje" Text="" runat="server"></asp:Label>--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="page-header">
                    <h3>
                        <span class="fa fa-bar-chart"></span>Ticket e mia
                    </h3>
                </div>
                <div class="container">
                    <div class="row">      


        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover table-condensed" 
            AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" 
            >

            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="tid"         HeaderText="Kodi" />
                <asp:BoundField DataField="kemertimi"   HeaderText="Klienti" />
                <asp:BoundField DataField="semri"       HeaderText="Softi" />
                <asp:BoundField DataField="spershkrimi" HeaderText="Pershkrimi i softit" />
                <asp:BoundField DataField="tsub"        HeaderText="Subjekti i Ticket" />
                <asp:BoundField DataField="tper"        HeaderText="Pershkrimi" />
                <asp:BoundField DataField="pemertimi"   HeaderText="Prioriteti" />
                <asp:BoundField DataField="semertimi"   HeaderText ="Statusi" />
                <asp:BoundField DataField="tdata"       HeaderText="Data e postimit" />
                <asp:TemplateField HeaderText="Pergjigja">
                    <ItemTemplate>
                        <asp:HyperLink ID="hpl" runat="server" NavigateUrl='<%# string.Format("~/Secure/Klient/Kthe_Pergjigje.aspx?tid={0}",
                          HttpUtility.UrlEncode(Eval("tid").ToString())) %>' >Shiko pergjigje</asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>


                    </div> <!-- end row -->
                </div>
            </div>
        </div>
    </div><!-- /.container -->
</asp:Content>



      
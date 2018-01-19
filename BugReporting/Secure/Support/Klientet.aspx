<%@ Page Title="" Language="C#" MasterPageFile="~/Secure/Support/Site2.Master" AutoEventWireup="true" CodeBehind="Klientet.aspx.cs" Inherits="BugReporting.Secure.Support.Klientet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-header">
                    <h3>
                        <span class="fa fa-bar-chart"></span>Lista e klienteve
                    </h3>
                </div>
    //comentiii


    <div class="container">
        <div class="row">
            <br />
            <a href="NewKlient.aspx">Shto klient</a>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-responsive table-hover" AutoGenerateEditButton="True" DataKeyNames="ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Emertimi" HeaderText="Emertimi" SortExpression="Emertimi" />
                    <asp:BoundField DataField="Lloji" HeaderText="Lloji" SortExpression="Lloji" />
                    <asp:BoundField DataField="NIPT" HeaderText="NIPT" SortExpression="NIPT" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Adresa" HeaderText="Adresa" SortExpression="Adresa" />
                   
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BugSystemConnectionString %>" 
                SelectCommand=" SELECT * FROM Klient" 
                DeleteCommand="DELETE FROM [Klient] WHERE [ID] = @ID" 
                UpdateCommand="UPDATE [Klient] SET [Emertimi] = @Emertimi, [Lloji] = @Lloji, 
                [NIPT] = @NIPT, [Email] = @Email, [Adresa] = @Adresa WHERE [ID] = @ID">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                
                <UpdateParameters>
                    <asp:Parameter Name="Emertimi" Type="String" />
                    <asp:Parameter Name="Lloji" Type="String" />
                    <asp:Parameter Name="NIPT" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Adresa" Type="String" />
                    
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>

</asp:Content>

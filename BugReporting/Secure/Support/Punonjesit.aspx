<%@ Page Title="" Language="C#" MasterPageFile="~/Secure/Support/Site2.Master" AutoEventWireup="true" CodeBehind="Punonjesit.aspx.cs" Inherits="BugReporting.Secure.Support.Punonjesit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-header">
                    <h3>
                        <span class="fa fa-bar-chart"></span>Lista e punonjesve
                    </h3>
                </div>
    <div class="container">
        <div class="row">
            <br />
            <a href="NewPunonjes.aspx">Shto punonjes</a>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateEditButton="true" CssClass="table-bordered table-condensed table-condensed table-hover" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="Emri" HeaderText="Emri" SortExpression="Emri" />
            <asp:BoundField DataField="Mbiemri" HeaderText="Mbiemri" SortExpression="Mbiemri" />
            <asp:BoundField DataField="Departament" HeaderText="Departament" SortExpression="Departament" />
            </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BugSystemConnectionString %>" DeleteCommand="DELETE FROM [Punonjes] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Punonjes] ([Emri], [Mbiemri], [Departament], [Perdorues]) VALUES (@Emri, @Mbiemri, @Departament, @Perdorues)" SelectCommand="SELECT * FROM [Punonjes]" UpdateCommand="UPDATE [Punonjes] SET [Emri] = @Emri, [Mbiemri] = @Mbiemri, [Departament] = @Departament, [Perdorues] = @Perdorues WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Emri" Type="String" />
            <asp:Parameter Name="Mbiemri" Type="String" />
            <asp:Parameter Name="Departament" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Emri" Type="String" />
            <asp:Parameter Name="Mbiemri" Type="String" />
            <asp:Parameter Name="Departament" Type="Int32" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
                    </div>
    </div>
</asp:Content>

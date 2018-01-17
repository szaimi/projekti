<%@ Page Title="" Language="C#" MasterPageFile="~/Secure/Klient/Site1.Master" AutoEventWireup="true" CodeBehind="Kthe_Pergjigje.aspx.cs" Inherits="BugReporting.Secure.Klient.Kthe_Pergjigje" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="page-header">
                    <h3>
                        <span class="fa fa-bar-chart"></span>Pergjigja
                    </h3>
                </div>
                <div class="container">
                    <div class="row">      

      <h4>Subjekti</h4>
       <p runat="server" id="subjekti">

       </p>

         <h4>Permbajtja</h4>
        <p runat="server" id="permbajtja">

       </p>


        <h4>Pergjigja</h4>
        <p runat="server" id="pergjigja">

       </p>


                    </div> <!-- end row -->
                </div>
            </div>
        </div>
    </div><!-- /.container -->

</asp:Content>

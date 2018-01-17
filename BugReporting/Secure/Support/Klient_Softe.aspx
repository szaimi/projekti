<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Klient_Softe.aspx.cs"  MasterPageFile="~/Secure/Support/Site2.Master" Inherits="BugReporting.Secure.Support.Klient_Softe" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">
          <div class="row">
            
            <div class="col-lg-12">
                <div class="page-header">
                    <h3><span class="fa fa-plus"></span> Caktimi i Softeve</h3>
                </div>
<div class="col-xs-12 col-md-6 col-lg-6">
<div class="form-group">
<label class="col-lg-2 control-label">Cakto klientin</label>

<div class="col-lg-10">
    <asp:DropDownList ID="ddlKlient" runat="server" CssClass="form-control "></asp:DropDownList>
    <asp:RequiredFieldValidator ID="rfvKlient" runat="server" ErrorMessage="* Zgjidh klientin" ControlToValidate="ddlKlient" InitialValue="0" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>
<div class="form-group">
<label class="col-lg-2 control-label">Cakto softe</label>

<div class="col-lg-10">
   <asp:DropDownList ID="ddlSoft" CssClass="form-control" runat="server"></asp:DropDownList>
   <asp:RequiredFieldValidator ID="rfvSoft" runat="server" ErrorMessage="* Zgjidh Softin" ControlToValidate="ddlSoft" InitialValue="0" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>




<div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
     <asp:Button ID="btnKS" runat="server" Text="Ruaj" CssClass="btn btn-default" OnClick="btnKS_Click" />
 </div>

    <asp:Label runat="server" ID="lblMsg" Text=""></asp:Label>

     </div>

 </div>
            </div>
          </div>
        </div><!-- /.container -->  
</asp:Content>


              
   
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewKlient.aspx.cs" MasterPageFile="~/Secure/Support/Site2.Master" Inherits="BugReporting.Secure.Support.NewKlient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">
          <div class="row">
            
            <div class="col-lg-12">
                <div class="page-header">
                    <h3><span class="fa fa-plus"></span> Shto Ticket te ri</h3>
                </div>
<div class="col-xs-12 col-md-6 col-lg-6">
<div class="form-group">
<label class="col-lg-2 control-label">Username</label>

<div class="col-lg-10">
    <asp:TextBox ID="TxtUsername" CssClass="form-control" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage=" Jep username" ForeColor="Red" ControlToValidate="TxtUsername"></asp:RequiredFieldValidator>
</div>
</div>
<div class="form-group">
<label class="col-lg-2 control-label">Fjalekalimi</label>

<div class="col-lg-10">
   <asp:TextBox ID="TxtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvPwd" runat="server" ErrorMessage="Jep fjalekalimin" ControlToValidate="TxtPassword"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="revPwd" runat="server"    
ErrorMessage=" Fjalekalimi duhet te permbaje 7 deri 20 simbole"
ControlToValidate="TxtPassword"  ValidationExpression="^[a-zA-Z0-9'@&#.\s]{7,20}$" />

</div>
</div>

    <div class="form-group">
<label class="col-lg-2 control-label"> Konfirmo Fjalekalimin</label>

<div class="col-lg-10">
   <asp:TextBox ID="txtConfirmPass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvConfirmPwd" runat="server" ErrorMessage="Konfirmo fjalekalimin" ControlToValidate="txtConfirmPass"></asp:RequiredFieldValidator>
</div>

        <asp:CompareValidator ID="CompareValidator1" ForeColor="Red" runat="server" ControlToCompare="TxtPassword" ControlToValidate="txtConfirmPass" ErrorMessage="Fjalekalimet nuk jane twe njejte"></asp:CompareValidator>

</div>

<div class="form-group">
<label class="col-lg-2 control-label">Email</label>
<div class="col-lg-10">
    <asp:TextBox ID="TxtEmail" runat="server" CssClass="form-control"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server" ForeColor="Red" ControlToValidate="TxtEmail" ErrorMessage="* Jep nje adrese te sakte email"></asp:RegularExpressionValidator>
</div>
</div>
<div class="form-group">
    <label class="col-lg-2 control-label">Emri i klientit/biznesit</label>

    <div class="col-lg-10">
       <asp:TextBox ID="TxtEmk" runat="server" CssClass="form-control" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvemriklient" runat="server" ErrorMessage="Jep emrin e klientit" ControlToValidate="TxtEmk"  ForeColor="Red"></asp:RequiredFieldValidator>
   </div>
</div>

<div class="form-group">
    <label class="col-lg-2 control-label">Lloji i biznesit</label>

    <div class="col-lg-10">
       <asp:TextBox ID="Txtlloji" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvlloji" runat="server" ErrorMessage="Zgjidh llojin" ControlToValidate="Txtlloji" ForeColor="Red"></asp:RequiredFieldValidator>
   </div>
</div>


<div class="form-group">
    <label class="col-lg-2 control-label">NIPT</label>

    <div class="col-lg-10">
       <asp:TextBox ID="TxtNipt" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvnipt" runat="server" ErrorMessage="Zgjidh nipt"  ForeColor="Red" ControlToValidate="TxtNipt"></asp:RequiredFieldValidator>
   </div>
</div>


<div class="form-group">
    <label class="col-lg-2 control-label">Adresa</label>

    <div class="col-lg-10">
       <asp:TextBox ID="TxtAdresa" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvadresa" runat="server" ErrorMessage="Zgjidh adresen"  ForeColor="Red" ControlToValidate="TxtAdresa"></asp:RequiredFieldValidator>
   </div>
</div>



<div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
     <asp:Button ID="Butruaje" runat="server" Text="Ruaj ne sistem" CssClass="btn btn-primary" OnClick="Button1_Click" CausesValidation="true"  />
 </div>
     </div>

    <asp:Label ID="lblmesazh" runat="server" ForeColor="Green"></asp:Label>

 </div>
            </div>
          </div>
        </div><!-- /.container -->  
</asp:Content>

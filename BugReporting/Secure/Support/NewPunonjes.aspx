<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewPunonjes.aspx.cs" MasterPageFile="~/Secure/Support/Site2.Master" Inherits="BugReporting.Secure.Support.NewPunonjes" %>

              
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">
          <div class="row">
            
            <div class="col-lg-12">
                <div class="page-header">
                    <h3><span class="fa fa-plus"></span> Shto Punonjes te ri</h3>
                </div>
<div class="col-xs-12 col-md-6 col-lg-6">
<div class="form-group">
<label class="col-lg-2 control-label">Username</label>

<div class="col-lg-10">
    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" ForeColor="Red" ErrorMessage="* Jep username"></asp:RequiredFieldValidator>
</div>
</div>
<div class="form-group">
<label class="col-lg-2 control-label">Fjalekalimi</label>

<div class="col-lg-10">
    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="* Jep fjalekalimin" ForeColor="Red" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
     <asp:RegularExpressionValidator ID="revPwd" runat="server"    
ErrorMessage=" Fjalekalimi duhet te permbaje 7 deri 20 simbole"
ControlToValidate="txtPassword"  ValidationExpression="^[a-zA-Z0-9'@&#.\s]{7,20}$" />
</div>
</div>


<div class="form-group">
<label class="col-lg-2 control-label">Konfirmo fjalekalimin</label>

<div class="col-lg-10">
    <asp:TextBox ID="txtPasswordConf" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvPasswordConf" runat="server" ErrorMessage="* Konfirmo fjalekalimin" ForeColor="Red" ControlToValidate="txtPasswordConf"></asp:RequiredFieldValidator>
</div>
    <asp:CompareValidator ID="CompareValidator1" ForeColor="Red" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtPasswordConf" ErrorMessage="Fjalekalimet nuk jane te njejte"></asp:CompareValidator>
</div>


<div class="form-group">
<label class="col-lg-2 control-label">Emaili</label>
<div class="col-lg-10">
   <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server" ForeColor="Red" ControlToValidate="txtEmail" ErrorMessage="* Jep nje adrese te sakte email"></asp:RegularExpressionValidator>
</div>
</div>
<div class="form-group">
   <label class="col-lg-2 control-label">Emri</label>

    <div class="col-lg-10">
     <asp:TextBox ID="Txtemri" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvEmri" runat="server" ErrorMessage="* Jep emrin" ForeColor="Red" ControlToValidate="Txtemri"></asp:RequiredFieldValidator>
   </div>
</div>


    <div class="form-group">
   <label class="col-lg-2 control-label">Mbiemri</label>

    <div class="col-lg-10">
     <asp:TextBox ID="Txtmbiemri" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvMbiemri" runat="server" ErrorMessage="* Jep Mbiemrin" ForeColor="Red" ControlToValidate="Txtmbiemri"></asp:RequiredFieldValidator>
   </div>
</div>


    <div class="form-group">
   <label class="col-lg-2 control-label">Departamenti</label>

    <div class="col-lg-10">
       <asp:DropDownList ID="DropDownListDep" runat="server" CssClass="form-control"></asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvDep" runat="server" ErrorMessage="* Zgjidh departamentin" ForeColor="Red" ControlToValidate="DropDownListDep" InitialValue="0"></asp:RequiredFieldValidator>
   </div>
</div>

<div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
        <asp:Button ID="btnPunonjes" runat="server" Text="Ruaj ne sistem" CssClass="btn btn-primary" OnClick="btn_Punonjes_Click" />
 </div>
     </div>
     <asp:Label ID="lblMesazh" runat="server" Text=""></asp:Label>


 </div>
            </div>
          </div>
        </div><!-- /.container -->  
</asp:Content>


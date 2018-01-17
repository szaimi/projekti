<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DergoPergjigje.aspx.cs" MasterPageFile="~/Secure/Punonjes/Site1.Master" Inherits="BugReporting.Secure.Punonjes.DergoPergjigje" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">
          <div class="row">
            
            <div class="col-lg-12">
                <div class="page-header">
                    <h3><span class="fa fa-plus"></span> Kthimi i pergjigjes</h3>
                </div>
<div class="col-xs-12 col-md-6 col-lg-6">
<div class="form-group">
<label class="col-lg-2 control-label">Subjekti</label>

<div class="col-lg-10">
    <asp:TextBox ID="TxtPergjigje" CssClass="form-control" runat="server" TextMode="MultiLine" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvPergjigje" ForeColor="Red" runat="server" ErrorMessage="* Jep pergjigjen e ticketit" ControlToValidate="TxtPergjigje"></asp:RequiredFieldValidator>
</div>
</div>


    <div class="form-group">
<label class="col-lg-2 control-label">Statusi perfundimtar</label>

<div class="col-lg-10">
    <asp:DropDownList runat="server" ID="ddlStatus" CssClass ="form-control"></asp:DropDownList>
    <asp:RequiredFieldValidator ID="rfvStatusi" runat="server" ForeColor="Red" ErrorMessage="* Zgjidh statusin perfundimtar" ControlToValidate="ddlStatus" InitialValue="0"></asp:RequiredFieldValidator>
</div>
</d


<div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
             <asp:Button ID="Button" runat="server" Text="Dergo" CssClass="btn btn-primary"  OnClick="Button_Click" />
      </div>
     </div>

 </div>
            </div>
          </div>
        </div><!-- /.container -->  
</asp:Content>







                    
             
                   
           
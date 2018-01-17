<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Atasho.aspx.cs" MasterPageFile="~/Secure/Support/Site2.Master" Inherits="BugReporting.Secure.Support.Atasho" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">
          <div class="row">
            
            <div class="col-lg-12">
                <div class="page-header">
                    <h3><span class="fa fa-plus"></span> Atasho Ticket</h3>
                </div>
<div class="col-xs-12 col-md-6 col-lg-6">
<div class="form-group">
<label class="col-lg-2 control-label">Departamenti</label>

<div class="col-lg-10">
    <asp:DropDownList ID="ddlDep" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlDep_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
    <asp:RequiredFieldValidator ID="rfvDep" runat="server" ErrorMessage="* Zgjidh departamentin" ForeColor="Red" ControlToValidate="ddlDep" InitialValue="0"></asp:RequiredFieldValidator>
</div>
</div>
<div class="form-group">
<label class="col-lg-2 control-label">Punonjesi</label>

<div class="col-lg-10">
    <asp:DropDownList ID="ddlPun" CssClass="form-control" runat="server"></asp:DropDownList>
    <asp:RequiredFieldValidator ID="rfvPun" runat="server" ErrorMessage="* Zgjidh punonjesin" ControlToValidate="ddlPun" InitialValue="0" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
</div>



<div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
        <asp:Button ID="buton1" runat="server" Text="Atasho" CssClass="btn btn-danger" OnClick="buton1_Click" />
 </div>
     </div>
     
 </div>
            </div>
          </div>
        </div><!-- /.container -->  
</asp:Content>


<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Secure/Klient/Site1.Master" CodeBehind="NewTicket.aspx.cs" Inherits="BugReporting.Secure.Klient.NewTicket" %>

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
<label class="col-lg-2 control-label">Subjekti</label>

<div class="col-lg-10">
    <asp:TextBox ID="txtSubjekti" runat="server" CssClass="form-control"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvsubjekti" runat="server" ErrorMessage="* Jep subjektin e ticket" ForeColor="Red" ControlToValidate="txtSubjekti"></asp:RequiredFieldValidator>
</div>
</div>
<div class="form-group">
<label class="col-lg-2 control-label">Prioriteti</label>

<div class="col-lg-10">
<asp:DropDownList ID="ddlPrioriteti" runat="server" CssClass="form-control"></asp:DropDownList>
    <asp:RequiredFieldValidator ID="rfvprioriteti" runat="server" ErrorMessage="* Zgjidh prioitetin e ticket" ForeColor="Red" ControlToValidate="ddlPrioriteti" InitialValue="0"></asp:RequiredFieldValidator>
</div>
</div>

<div class="form-group">
<label class="col-lg-2 control-label">Software</label>
<div class="col-lg-10">
   <asp:DropDownList ID="ddlSofti" runat="server" CssClass="form-control"></asp:DropDownList>
    <asp:RequiredFieldValidator ID="rfvsofti" runat="server" ErrorMessage="* Zgjidh softin" ForeColor="Red" ControlToValidate="ddlSofti" InitialValue="0"></asp:RequiredFieldValidator>
</div>
</div>
<div class="form-group">
<label class="col-lg-2 control-label">Permbajtja e Ticket</label>

<div class="col-lg-10">
  <asp:TextBox ID="txtPermbajtja" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvPermbajtja" runat="server" ErrorMessage="* Jep permbajtjen e ticket" ForeColor="Red" ControlToValidate="txtPermbajtja"></asp:RequiredFieldValidator>
</div>
</div>



<div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
     <asp:Button ID="btnAddTicket" runat="server" Text="Ruaj ticket" CssClass="btn btn-primary" OnClick="btnAddTicket_Click" />
 </div>
     </div>

 </div>
            </div>
          </div>
        </div><!-- /.container -->  
</asp:Content>












                    
                    
                    
                    
                    

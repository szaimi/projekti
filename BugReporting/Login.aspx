<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BugReporting.Login" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <title>Sign In</title>
    <script type="text/javascript" src="/Style/jquery.min.js"></script>
    <link rel="stylesheet" href="/Style/bootstrap.min.css" />
    <script type="text/javascript" src="/Style/bootstrap.min.js"></script>
   <style>
     body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f4f4f4;
    }

    .form-signin {
        max-width: 330px;
        padding: 15px;
        margin: 0 auto;
    }

    .form-signin .form-signin-heading,
    .form-signin .checkbox {
        margin-bottom: 10px;
    }

    .form-signin .checkbox {
        font-weight: normal;
    }

    .form-signin .form-control {
        position: relative;
        height: auto;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        padding: 10px;
        font-size: 16px;
    }

    .form-signin .form-control:focus {
        z-index: 2;
    }

    .form-signin input[type="text"] {
        margin-bottom: -1px;
    }

    .form-signin input[type="password"] {
        margin-bottom: 10px;
    }
    
     </style>
</head>
<body>

<div class="container">
    <form id="form1" class="form-signin" runat="server">
        
        <h2 class="form-signin-heading" style="float:none">
            <span>Paneli i Aksesit</span> <span style="text-align:center"></span> 
           
        </h2>
        <div>
            <p class="alert-link"><asp:Label ID="lblError" runat="server" Text="" ForeColor="Red"></asp:Label></p>
        </div>
				                    <asp:TextBox ID="txtUsr" runat="server" CssClass="form-control" Placeholder="Jepni username..."></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvUsr" runat="server" ErrorMessage="* Jep username" ForeColor="Red" ControlToValidate="txtUsr"></asp:RequiredFieldValidator>
                                    <br>
                                    <asp:TextBox ID="txtPwd" runat="server" CssClass="form-control" TextMode="Password" Placeholder ="Jepni fjalekalimin..."></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvPwd" runat="server" ErrorMessage="* Jep fjalekalimin" ForeColor="Red" ControlToValidate="txtPwd"></asp:RequiredFieldValidator>                         
                                  
                                    <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-lg btn-primary btn-block" OnClick="btnLogin_Click" Text="Identifikohu" />
                                    <br/> 
          </form>
                </div>
    </body>
</html>
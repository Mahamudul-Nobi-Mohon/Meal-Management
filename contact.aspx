<%@ Page Language="C#" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
	<title>Meal Management System</title>
    <link href="bootstrap/css/bootstrap-theme.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />

    <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Lobster+Two' rel='stylesheet' type='text/css'>

    <script src="bootstrap/js/bootstrap.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="css/style.css" type="text/css">

<%--<SCRIPT>
    function JSFX_StartEffects() {
        JSFX.Fire(500, 0);
    }
</SCRIPT>--%>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
    </style>
</head>

 <body id="indexBody">
     <div class="container">
       <div class="row">
           <div class="col-md-12">
                  
                <nav class="navbar navbar-default navbar-fixed-top">
		            <div class="container-fluid">
			            <!-- Brand and toggle get grouped for better mobile display -->
			            <div class="navbar-header">
			                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				            <span class="sr-only">Toggle navigation</span>
				            <span class="icon-bar"></span>
				            <span class="icon-bar"></span>
				            <span class="icon-bar"></span>
			                </button>
			                <a class="navbar-brand" href="#">Meal Management<span>&nbsp;System</span></a>
			            </div>

			            <!-- Collect the nav links, forms, and other content for toggling -->
			            <div class="collapse navbar-collapse custom_nav" id="bs-example-navbar-collapse-1">
			                <ul class="nav navbar-nav navbar-right">
				                <li><a href="index.aspx">Home</a></li>
                                <li><a href="about.aspx">About</a></li>
                                <li><a href="answer.aspx">FAQ</a></li>
                               <li class = "active"><a href="contact.aspx">Contact</a></li>
			                </ul>
			            </div><!-- /.navbar-collapse -->
		            </div><!-- /.container-fluid -->
	            </nav>

                <form id="form1" runat="server">

                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 col-xs-12">
                        <div id="" class="common_page" style="background-color: rgba(255, 255, 255, 0.84);">
                            <p class="auto-style1 text-center" style="color:green; font-family: 'Lobster Two', cursive;"><strong>your valueable comments</strong></p>
                            <p class="bold">Your name:<br />
                            <asp:TextBox ID="YourName" runat="server" class="form-control" name="username" value="" placeholder="Input username" /><br />
                            Your email address:<br />
                            <asp:TextBox ID="YourEmail" runat="server" class="form-control" name="username" value="" placeholder="Input your email Adress" OnTextChanged="YourEmail_TextChanged" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="YourEmail" EnableClientScript="False" ErrorMessage="Email is Required." ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="YourEmail" EnableClientScript="False" ErrorMessage="Invalid Email Adress.." ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                <br />
                                Subject:<br />
                            <asp:TextBox ID="YourSubject" runat="server" Rows="10"  class="form-control" name="username"  placeholder="Input a Subject" />
                            </p>
                                    <p class="bold">Your comments:<br />
                            <asp:TextBox ID="Comments" runat="server" TextMode="MultiLine" Rows="5" class="form-control" name="username" value="" placeholder="Your Comments"/>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Comments" EnableClientScript="False" ErrorMessage="Comment is Required." ForeColor="Red"></asp:RequiredFieldValidator>
                            </p>

                            <asp:Button ID="Button1" runat="server" class="btn btn-success" style="width:20%"  Text="Send" OnClick="Button1_Click" />
                            <asp:Label ID="DisplayMessage" runat="server" ForeColor="Green"></asp:Label>
                            </div>
                         </div>
                     </div>
                </form>

             </div>
         </div>
     </div>
</body>
</html>

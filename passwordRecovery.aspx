<%@ Page Language="C#" AutoEventWireup="true" CodeFile="passwordRecovery.aspx.cs" Inherits="passwordRecovery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link href="bootstrap/css/bootstrap-theme.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <script src="bootstrap/js/bootstrap.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script> 

     <link href='https://fonts.googleapis.com/css?family=Lobster+Two' rel='stylesheet' type='text/css'>
    
    <link rel="stylesheet" href="css/style.css" type="text/css">           
</head>

<body id="indexBody">
    <form id="form1" runat="server">

     
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
				                        <li class = "active"><a href="index.aspx">Home</a></li>
                                       <li><a href="about.aspx">About</a></li>
                                       <li><a href="answer.aspx">FAQ</a></li>
                                       <li><a href="blog.aspx">Blog</a></li>
                                       <li><a href="contact.aspx">Contact</a></li>
			                        </ul>
			                    </div><!-- /.navbar-collapse -->
		                    </div><!-- /.container-fluid -->
	                    </nav>


                          <div id="" class="common_page col-sm-6 col-sm-offset-3" style="background-color: rgba(255, 255, 255, 0.84); margin-top: 10%; ">
                            <table style="width: 100%;">
                                <tr>
                                    <td>
                                           <p class="auto-style1" style="color:green; font-family: 'Lobster Two', cursive; font-size: 22px;"><strong>Password Recovery</strong></p>
                                       
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;<b>Hostel Name:</b>

                                    </td>
                                    <td>

                                        <asp:TextBox ID="TextBoxId" class="form-control" placeholder="Hostel Name" runat="server" />

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxId" EnableClientScript="False" ErrorMessage="Id Is Required" ForeColor="Red"></asp:RequiredFieldValidator>

                                    </td>
                                </tr>
                                <tr>
                                    <td><b>Email Address: </b></td>
                                    <td>

                                        <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Hostel Name" />

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" EnableClientScript="False" ErrorMessage="Email Is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server" ValidationExpression="\w+([-+.&#39;]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" ControlToValidate="txtEmail" ErrorMessage="Email is Not Correct" EnableClientScript="False" ID="RegularExpressionValidator1"></asp:RegularExpressionValidator>

                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>

                                        <asp:Label ID="lblMessage" runat="server" />

                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>

                                        <asp:Button Text="Send" runat="server" OnClick="SendEmail" ID="Button1" class="btn btn-info pull-right" BackColor="Green" ForeColor="white" Height="30px" Width="100px" />

                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <br /><br /><br /><br /><br /><br /><br /><br />
                <div id="footer">
                    <p class="nav nav-pills" style="font-size: 150%; background: #F5F6CE; text-align: center">Thanks for using our Application.</p>
                    <br />



                </div>
    </form>

</body>
</html>

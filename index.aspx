<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <meta charset="UTF-8">
	<title>Meal Management System</title>
    <link href="bootstrap/css/bootstrap-theme.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />

    <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>

    <script src="bootstrap/js/bootstrap.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="css/style.css" type="text/css">

     <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
   
    
</head>

    <body id="indexBody">
            <form id="form1" runat="server">
       

   <div class="container-fluid">
       <div class="row">
           <div class="col-md-12">
                  
<!--ul class = "nav nav-pills" style="font-size:300%; background:#00FF80">
   <li class = "active"><a href="index.aspx">Home</a></li>
   <li><a href="about.aspx">About</a></li>
   <li><a href="answer.aspx">FAQ</a></li>
   <li><a href="blog.aspx">Blog</a></li>
   <li><a href="contact.aspx">Contact</a></li>
   
</!--ul-->
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
                                <li><a href="contact.aspx">Contact</a></li>
			                </ul>
			            </div><!-- /.navbar-collapse -->
		            </div><!-- /.container-fluid -->
	            </nav>

<%-- </div>
    </div>--%>
               

    <div class="container">
        <div class="col-sm-7 col-xs-12">
        </div> 
        
        <div class="col-sm-5 col-xs-12">   
        <div id="loginbox" class="mainbox" style="margin-top:30%;">                    
            <div class="panel panel-info" style="background-color: rgba(255, 255, 255, 0.84); ">
                    <div class="panel-heading white_bg">
                        <div class="panel-title" style="font-size:20px;">Sign In</div>
                    
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                            
                    
                                    
                            <div style="margin-bottom: 25px;color: red" class="input-group">
                                            <asp:Label runat="server" ID="messageLebel"></asp:Label>
                                        </div>
                         <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                         <asp:TextBox ID="textboxName" runat="server" class="form-control" name="username" value="" placeholder="Enter username"></asp:TextBox>                                       
                                    </div>
                                
                            <div style="margin-bottom: 15px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                           <asp:TextBox ID="textboxPassword" runat="server"  class="form-control" name="password" placeholder="Enter password" TextMode="Password"></asp:TextBox>
                                    </div>
                                    

                                
                            <div class="input-group">
                                      <div class="checkbox">
                                        <label>
                                          <input id="login-remember" type="checkbox" name="remember" value="1"> Remember me
                                        </label>
                                      </div>
                                    </div>


                                <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->

                                    <div class="col-sm-12 controls no-padding">
                                      <asp:Button ID="Login" Text="Login" runat="server" OnClick="Login_Click" class="btn btn-success btn-block" />
                                    </div>
                                </div>

                                
                                <div class="form-group">
                                    <div class="col-md-12 control no-padding">
                                         <div style="font-size: 80%; padding-top:15px; "><a href="passwordRecovery.aspx">Forgot password?</a></div>
                                        <div style="padding-top:5px; font-size:85%" >
                                            Don't have an account! 
                                        <a href="#" onClick="$('#loginbox').hide(); $('#signupbox').show()">
                                            Sign Up Here
                                        </a>
                                        </div>
                                    </div>
                                </div>  
                        </div>                     
                    </div>  
        </div>
          <div id="signupbox" style="display:none; margin-top:30%" class="mainbox">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <div class="panel-title">Sign Up</div>
                            <div style="float:right; font-size: 85%; position: relative; top:-10px">
                                <a id="signinlink" href="#" onclick="$('#signupbox').hide(); $('#loginbox').show()">Sign In</a></div>
                        </div>  
                        <div class="panel-body" >
                           <%-- <form id="signupform" class="form-horizontal" role="form">--%>



                                



                                
                                <div id="signupalert" style="display:none" class="alert alert-danger">
                                    <p>Error:</p>
                                    <span></span>
                                </div>
                                    
                                
                                  
                                <div class="form-group">
                                    <label for="email" class="col-md-3 control-label">Email</label>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="TextContactMail" class="form-control" name="email" placeholder="Email Address" runat="server"  ></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextContactMail" EnableClientScript="False" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextContactMail" EnableClientScript="False" ErrorMessage="Select a valid Mail Adress" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
               
                                         </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label for="firstname" class="col-md-3 control-label">Hostel Name</label>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="TextboxName2"  runat="server" class="form-control" placeholder="Hostel Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextboxName2" EnableClientScript="False" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
             
                                         </div>
                                </div>
                                <div class="form-group">
                                    <label for="lastname" class="col-md-3 control-label">Password :</label>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="TextPassword" runat="server" class="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextPassword" EnableClientScript="False" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
               
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-md-3 control-label">Confirm Password</label>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="TextBoxConfirmPassword" TextMode="Password" runat="server" class="form-control" name="Confirm passwd" placeholder="Confirm Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBoxConfirmPassword" EnableClientScript="False" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="TextPassword" ControlToValidate="TextBoxConfirmPassword" EnableClientScript="False" ErrorMessage="Password not match" ForeColor="Red"></asp:CompareValidator>
               
                                    </div>
                                </div>
                                    
                               

                                <div class="form-group">
                                    <!-- Button -->                                        
                                    <div class="col-md-offset-3 col-md-9">
                                        <%--<button id="btn-signup" type="button" class="btn btn-info" onclick="ButtonSave_Click" ><i class="icon-hand-right"></i> &nbsp Sign Up</button>--%>
                                       <asp:Button ID="signupButton" Text="Sign Up" runat="server" class="btn btn-info" onclick="ButtonSave_Click" />
                                  
                                          </div>
                                </div>
                                
                               
                                
                                
                            
                         </div>
                    </div>

               
               
                
         </div> 
    </div>
     

        </div>
    </div>
    
		<div id="footer">
            

           
                   
        </div>
              </div>
       </div>
   
            </div></div></div>
	
         </form>     
  
</body>
</html>

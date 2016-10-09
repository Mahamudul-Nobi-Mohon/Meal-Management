<%@ Page Language="C#" AutoEventWireup="true" CodeFile="create new account.aspx.cs" Inherits="create_new_account" %>

<head >
    <meta charset="UTF-8">
	<title>Create new account</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
     <link href="bootstrap/css/bootstrap-theme.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <script src="bootstrap/js/bootstrap.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>

 <SCRIPT LANGUAGE="JavaScript" SRC="javascript/JSFX_Layer.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" SRC="javascript/JSFX_Mouse.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" SRC="javascript/JSFX_Fire.js"></SCRIPT>
    <%--<SCRIPT>
    function JSFX_StartEffects() {
        JSFX.Fire(500, 0);
    }
</SCRIPT>--%>
    <style type="text/css">
        #form1 {
        }
    </style>
</head>

    <body>

    <div id="header">
		<div>
			<div id="logo" >
				
				<a ><span>Meal Management</span></a>
			</div>
			<ul id="navigation">
				<li>
					<a href="index.aspx">Home</a>
				</li>
				<li>
					<a href="about.aspx">About</a>
				</li>
                
				<li>
					<a href="answer.aspx">FAQ</a>
				</li>
				<li>
					<a href="blog.aspx">Blog</a>
				</li>
				<li>
					<a href="contact.aspx">Contact</a>
				</li>
			</ul>
		    <p>
                
                   &nbsp;</p>
		</div>
	</div>
         <form id="form1" runat="server">
	<div id="contents" style="align-content:center ">
   <h2 style="width: auto; text-align:center" >Create New Account :</h2>
                
                 
               
                 
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
                                        <asp:TextBox ID="TextPassword" runat="server" class="form-control"  placeholder="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextPassword" EnableClientScript="False" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
               
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-md-3 control-label">Confirm Password</label>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="TextBoxConfirmPassword" runat="server" class="form-control" name="Confirm passwd" placeholder="Confirm Password"></asp:TextBox>
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

    </div></form>
	<div id="footer">
		<div>
			<div>
			</div>
			<div id="connect">
				<h2>Get in touch</h2>
				<a href="http://facebook.com/" target="_blank" class="facebook"></a> <a href="http://freewebsitetemplates.com/go/twitter/" target="_blank" class="twitter"></a> <a href="http://freewebsitetemplates.com/go/googleplus/" target="_blank" class="googleplus"></a>
			</div>
			<p>
				© Copyright Meal Management
			</p>
		</div>
	</div>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="input.aspx.cs" Inherits="input" %>

<!DOCTYPE html>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <meta charset="UTF-8" />
    <title>About - Social Advice Website Template</title>
    <link href="bootstrap/css/bootstrap-theme.css" rel="stylesheet" />
    <script src="js/jquery-1.9.1.min.js"></script>
    <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />

    <script src="bootstrap/js/bootstrap.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <style type="text/css">
        #nav {
            width: 883px;
        }

        .auto-style1 {
            width: 230px;
        }

        .auto-style2 {
            width: 192px;
        }

        .auto-style3 {
            width: 285px;
        }

        body{background:#efefef !important;}

        #contents{background-color:transparent !important;}
        #contents .body {
            background-color: #fff;
            height: auto;
            width: 700px;
            margin: 0 auto;
            border: 1px solid #CECECE !important;
            padding: 50px 30px !important;
            box-shadow: 0px 0px 25px 1px #c2c2c2;
        }

        h2.title {
            color: #333;
            border-bottom: 1px solid #9C9C9C;
            margin: 0 0 20px 0;
            font-size: 23px;
        }
    </style>

    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="js/jssor.slider.min.js"></script>
    <%--<SCRIPT>
    function JSFX_StartEffects() {
        JSFX.Fire(500, 0);
    }
</SCRIPT>--%>
     <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <link rel="stylesheet"href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />
    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#TextBoxDate").datepicker();
        });
    </script>
   
</head>

<body>
    <form id="form1" runat="server">
                                    

        <div class="container">
            <div class="row">
                <div class="col-md-12">



                        <br />
                       
                       

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
				                   <li><a href="add members.aspx">AddMembers</a></li>
                                   <li class="active"><a href="input.aspx">Input</a></li>
                                   <li><a href="final.aspx">Calculation</a></li>
                                   <li><a href="export.aspx">Export</a></li>
                                   <li><a href="MembersPicture.aspx">Members</a> </li>
                                   <li ><a href="BazarList Picture.aspx">BazarList</a> </li>
                                   <li>
                                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Logout</asp:LinkButton>
                                   </li>
                                  
			                    </ul>
			                </div><!-- /.navbar-collapse -->
		                </div><!-- /.container-fluid -->
	                </nav>
                </div>

                <div id="contents" style="margin-top:80px">
                    <h2 class="title">Welcome:
                            <asp:Label ID="Label3" runat="server" Style="font-size: medium; color:green;"></asp:Label></h2><br />
                    <div id="about" class="body">
                        
                       
                         <h2>Input persons meal here..</h2>

                       
                        <br />
                        <br />
                        <br />
                    <asp:Image ID="image2" runat="server" Style="position: absolute; top: 306px; left: 637px; height: 179px; width: 263px;" />
                
                        <br />

                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <table id="inputTable">
                            <tr>
                                <td class="auto-style2">
                                    <asp:Label ID="Label1" runat="server" class="section_title" Text="Name :"></asp:Label></td>
                                <td class="auto-style3">
                                    <asp:DropDownList ID="DropDownList1" class="form-control section_title margin_top_20" runat="server" AutoPostBack="true" Style="font-weight: 700" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="205px">
                                        <asp:ListItem>Select</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">
                                    <asp:Label ID="Label2" class="section_title margin_top_20" runat="server" Text="Person Daily Meal :"></asp:Label></td>
                                <td class="auto-style3">
                                    <asp:TextBox ID="TextPersonDailyMill" class="form-control margin_top_20" placeholder="Input Meal" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="auto-style2">
                                    <asp:Label ID="Label4" class="section_title margin_top_20" runat="server" Text="Person Bazar Tk :"></asp:Label></td>
                                <td class="auto-style3">
                                    <asp:TextBox ID="TextPersonBazarTk" class="form-control margin_top_20" placeholder="Bazar Taka" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="auto-style2">
                                    <asp:Label ID="Label5" class="section_title margin_top_20" runat="server" Text="Date :"></asp:Label></td>
                                <td class="auto-style3">
                                    <asp:TextBox ID="TextBoxDate" class="form-control margin_top_20" placeholder="Date" runat="server"></asp:TextBox>
                                   
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxDate" EnableClientScript="False" ErrorMessage="Select a date.." ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:Image ID="Image1" runat="server" Height="116px" Width="185px" />
                                </td>
                            </tr>

                             
    

                        </table>
                        <table>
                            <tr>
                                <td><span class="section_title margin_top_20">Bazar List Picture :</span></td>
                                <td>
                                    <span class="form-control ">
                                            <asp:FileUpload ID="FileUpload1" runat="server" />
                                        </span></td>
                            </tr>
                             <tr>
                                <td class="auto-style2">&nbsp;</td>
                                <td class="auto-style1">
                                    <asp:Button ID="ButtonSave" runat="server" Text="Save" Width="83px" OnClick="ButtonSave_Click" class="btn btn-primary margin_top_20 pull-right" data-loading-text="Loading..." />
                                    <asp:Label ID="LabelSave" runat="server" Style="font-weight: 700"></asp:Label></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                            </tr>
                        </table>



                        <br /><br /><br>



                    </div>
                </div>
                <div class="divright">
                </div>
                <div id="divImage">
                
                <div>
                    
                    <br />

                  

		<div id="footer">
            <p class = "nav nav-pills" style="font-size:150%; background:#F5F6CE; text-align:center">Thanks for using our Application.</p><br />

           
                   </div>
                 </div>
                </div>
            </div>
        </div>
    </form>

</body>
</html>

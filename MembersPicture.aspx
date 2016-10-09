<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MembersPicture.aspx.cs" Inherits="MembersPicture" %>

<!DOCTYPE html>

<!DOCTYPE html>
<script runat="server">

   
   
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>About - Social Advice Website Template</title>
    <link href="bootstrap/css/bootstrap-theme.css" rel="stylesheet" />
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
    <script language="JavaScript" src="javascript/JSFX_Layer.js"></script>
    <script language="JavaScript" src="javascript/JSFX_Mouse.js"></script>
    <script language="JavaScript" src="javascript/JSFX_Fire.js"></script>
    <%--<SCRIPT>
    function JSFX_StartEffects() {
        JSFX.Fire(500, 0);
    }
</SCRIPT>--%>


    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <style type="text/css">
        .imgt {
            height: 200px;
            width: 211px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $("img.imgt").click(function (e) {
                var enlarge = '<img src='<%#Eval("Listpicture") %> + $(this).attr("alt") + '></img>';
                $('#ImgEnlarge')
                   .html($(enlarge)
                   .animate({ height: '100%', width: '100%' }, 1500));
            })
        })
    </script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />
    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#TextBoxStartDate").datepicker({ dateFormat: "mm/dd/yy" });
            $("#TextBoxEndDate").datepicker({ dateFormat: "mm/dd/yy" });
        });
    </script>
</head>

<body>
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
				                   <li><a href="add members.aspx">AddMembers</a></li>
                                   <li><a href="input.aspx">Input</a></li>
                                   <li><a href="final.aspx">Calculation</a></li>
                                   <li><a href="export.aspx">Export</a></li>
                                   <li class="active"><a href="MembersPicture.aspx">Members</a> </li>
                                   <li><a href="BazarList Picture.aspx">BazarList</a> </li>
                                   <li>
                                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Logout</asp:LinkButton>
                                   </li>
                                  
			                    </ul>
			                </div><!-- /.navbar-collapse -->
		                </div><!-- /.container-fluid -->
	                </nav>
                    <div>
                        </h2>
           
                    </div>
                </div>
                <div id="contents"><br /><br /><br /><br />
                    <h2 class="title">Welcome:
                            <asp:Label ID="Label3" runat="server" Style="font-size: medium; color:green;"></asp:Label></h2><br />
                    <div id="about" class="body">
                         
                        <h2 class="title">Members Picture</h2>
                       
            &nbsp;
             <br />
                       

                        <div class="row">
                            <div class="col-sm-5">
                                <div class="form-group">
                                    <label for="">From :</label>
                                     <asp:TextBox ID="TextBoxStartDate" class="form-control" placeholder="Start Date" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm-5">
                                <div class="form-group">
                                    <label for="">To:</label>
                                     <asp:TextBox ID="TextBoxEndDate" runat="server" class="form-control" placeholder="End Date"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <div class="form-group">
                                    <label for="">&nbsp;</label>
                                    <asp:Button ID="BtnSearchByDate" Text="Search" Class="btn btn-success" Width="83px" runat="server" Style="font-weight: 700" OnClick="BtnSearchByDate_Click" />
                                    <asp:Label ID="Label4" runat="server" ForeColor="Red"></asp:Label>
                                </div>
                            </div>
                        </div>

                        <br />

                         <table cellpadding="1" cellspacing="2" width="100%" align="center"
                            style="background: White;">
                            <tr>
                                <td style="height: 50px;">&nbsp;</td>
                            </tr>

                            <tr>
                                <td>
                                    <asp:DataList ID="dListImages"  runat="server" RepeatColumns="3">
                                        <ItemTemplate>
                                            <table border="1">
                                                <tr>
                                                    <td>
                                                        <img alt='<%#Eval("picture") %>' src='<%#Eval("picture") %>' class="imgt" /></td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </td>
                            </tr>
                            <tr>
                                <td style="">
                                    <div id="ImgEnlarge" style="margin-top:40px"></div>
                                </td>
                            </tr>
                        </table>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mealManagement %>" SelectCommand="SELECT picture FROM AddMember"></asp:SqlDataSource>


                    </div>
                </div>

                <br />
                <div id="footer">
                    <p class="nav nav-pills" style="font-size: 150%; background: #F5F6CE; text-align: center">Thanks for using our Application.</p>
                    <br />



                </div>
            </div>
        </div>
    </form>


</body>
</html>

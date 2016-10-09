<%@ Page Language="C#" AutoEventWireup="true" CodeFile="export.aspx.cs" Inherits="export" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8" />
    <title>Meal Management System</title>
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

    <%--<SCRIPT>
    function JSFX_StartEffects() {
        JSFX.Fire(500, 0);
    }
</SCRIPT>--%>
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

        <div class="container" style="margin-top:80px">
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
                                   <li class="active"><a href="export.aspx">Export</a></li>
                                   <li><a href="MembersPicture.aspx">Members</a> </li>
                                   <li><a href="BazarList Picture.aspx">BazarList</a> </li>
                                   <li>
                                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Logout</asp:LinkButton>
                                   </li><br />
                                  <h2>Welcome:
                            <asp:Label ID="Label3" runat="server" Style="font-size: medium"></asp:Label></h2>
			                    </ul>
			                </div><!-- /.navbar-collapse -->
		                </div><!-- /.container-fluid -->
	                </nav>

                </div>
                <div id="contents"><br /><br />
                     <h2 class="title">Welcome:
                            <asp:Label ID="Label2" runat="server" Style="font-size: medium; color:green;"></asp:Label></h2><br />
                    <div id="about" class="body">
                        <h2 class="title">Export Result</h2>
                        <%-- <ul id="navigation">
            <li><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Pages/inputPage.aspx" >Input Page</asp:HyperLink></li>
            <li><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Pages/ShowData.aspx" >Show All Data</asp:HyperLink></li>
            <li><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Pages/Final.aspx" >Final Calculation</asp:HyperLink></li>
            <li><asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Pages/ExportOrPrintPage.aspx" >Download</asp:HyperLink></li>
             </ul><br />--%>
             
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
                                    <asp:Button ID="BtnSearchByDate" Text="Search" Class="btn btn-success pull-right" runat="server" Style="font-weight: 700; margin-top:23px;" OnClick="BtnSearchByDate_Click" />
                                    <asp:Label ID="Label4" runat="server" ForeColor="Red"></asp:Label>
                                </div>
                            </div>
                        </div>
                       

                        <asp:Label ID="Label1" runat="server" style="font-weight:700; font-size:15px; padding:10px 0; margin-bottom:10px;" Text="Download As"></asp:Label>
                        &nbsp;<br />
                        <asp:Button ID="Button1" Class="btn btn-success" Width="83px" runat="server" Text="Word" OnClick="Button1_Click" Style="background: blue; margin-top:10px;" />
                        &nbsp;<asp:Button ID="Button3" Class="btn btn-success" Width="83px" runat="server" Text="Excel" OnClick="Button3_Click" Style="background: #80FF00; margin-top:10px;" />
                        &nbsp;<asp:Button ID="Button4" Class="btn btn-success" Width="83px" runat="server" Text="PDF" OnClick="Button4_Click" Style="background: #04B404; margin-top:10px;" />
                        &nbsp;<asp:Button ID="Button5" Class="btn btn-success" Width="83px" runat="server" Text="CSV" OnClick="Button5_Click" Style="background: #D8F781; margin-top:10px;" />
                        <br />
                        <br />
                        <br />
                        <br />

                        <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="table table-hover"
                             Width="100%" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" GridLines="None" ForeColor="Black">
                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                            <FooterStyle BackColor="Tan" />
                            <HeaderStyle BackColor="Tan" Font-Bold="True" />
                            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                            <SortedAscendingCellStyle BackColor="#FAFAE7" />
                            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                            <SortedDescendingCellStyle BackColor="#E1DB9C" />
                            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                        </asp:GridView>



                        <br />


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

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="final.aspx.cs" Inherits="final" %>

<!DOCTYPE html>
<script runat="server">
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>Meal Management System</title>
    <link href="bootstrap/css/bootstrap-theme.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />


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
    <link rel="stylesheet"href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />
    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>    
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#TextBoxStartDate").datepicker({
                dateFormat: "mm/dd/yy"
            });
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
                                   <li class = "active"><a href="final.aspx">Calculation</a></li>
                                   <li><a href="export.aspx">Export</a></li>
                                   <li><a href="MembersPicture.aspx">Members</a> </li>
                                   <li><a href="BazarList Picture.aspx">BazarList</a> </li>
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
                        
                        <h2 class="title">Final Calculation</h2>
                        <%-- <ul id="navigation">
            <li><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Pages/inputPage.aspx" >Input Page</asp:HyperLink></li>
            <li><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Pages/ShowData.aspx" >Show All Data</asp:HyperLink></li>
            <li><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Pages/Final.aspx" >Final Calculation</asp:HyperLink></li>
            <li><asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Pages/ExportOrPrintPage.aspx" >Download</asp:HyperLink></li>
             </ul><br />--%>
            &nbsp;
             <br />
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="">Search By Name :</label>
                                    <asp:DropDownList ID="DropDownList1" class="form-control" runat="server" AutoPostBack="true" Style="font-weight: 700" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:Label ID="Label1" runat="server" ForeColor="Green" ></asp:Label>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label for="">From :</label>
                                    <asp:TextBox ID="TextBoxStartDate" class="form-control" placeholder="Start Date" runat="server" Width="140px"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label for="">To :</label>
                                   <asp:TextBox ID="TextBoxEndDate" class="form-control" placeholder="End Taka" runat="server" Width="140px"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        
                        <asp:Button ID="BtnSearchByDate" Text="Search" Class="btn btn-primary pull-right" runat="server" Style="font-weight: 700" OnClick="BtnSearchByDate_Click" Width="83px" /><br />
                        <asp:Label ID="Label4" runat="server" ForeColor="Red"></asp:Label></br>
                        <!--
                        <asp:Button ID="BtnSearchByDate0" Text="Hide" Class="btn btn-success" runat="server" ForeColor="#FF3300" OnClick="ButtonHide_Click" Width="83px" />-->
                        
                        <asp:GridView ID="GridView2" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" GridLines="None" Width="100%" ForeColor="Black">
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
                        &nbsp;&nbsp;&nbsp;
                 <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
                        &nbsp;&nbsp;&nbsp;&nbsp;
          <br />
                        <br />


                        <br />



                    </div>
                </div>
   <br />
		<div id="footer">

        </div>

   </form>
   
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add members.aspx.cs" Inherits="add_members" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>Meal Management System</title>
    <link href="bootstrap/css/bootstrap-theme.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />

    <script src="bootstrap/js/bootstrap.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>

    <style type="text/css">
        #nav {
            width: 883px;
        }

        .auto-style2 {
            width: 192px;
        }

        .auto-style3 {
            width: 285px;
        }

        .auto-style4 {
            width: 192px;
            height: 70px;
        }

        .auto-style5 {
            width: 285px;
            height: 70px;
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

    <link href="CSS/CSS.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" />

    <script src="scripts/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="scripts/jquery.blockUI.js" type="text/javascript"></script>
    <script type="text/javascript">
        function BlockUI(id) {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_beginRequest(function () {
                $("#" + id).block({
                    message: '<table align = "center"><tr><td>' +
             '<img src="images/loadingAnim.gif"/></td></tr></table>',
                    css: {},
                    overlayCSS: {
                        backgroundColor: '#000000', opacity: 0.6
                    }
                });
            });
            prm.add_endRequest(function () {
                $("#" + id).unblock();
            });
        }
        $(document).ready(function () {

            BlockUI("<%=pnlAddEdit.ClientID %>");
            $.blockUI.defaults.css = {};
        });
            function Hidepopup() {
                $find("popup").hide();
                return false;
            }
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
				                   <li class = "active"><a href="add members.aspx">AddMembers</a></li>
                                   <li><a href="input.aspx">Input</a></li>
                                   <li><a href="final.aspx">Calculation</a></li>
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

                    <div class="clearfix"></div>

                   
                   
                    <div id="divImage">
                    </div>
                    <div id="contents" style="margin-top:80px">
                         <h2 class="title">Welcome:
                            <asp:Label ID="Label3" runat="server" Style="font-size: medium; color:green;"></asp:Label></h2><br />
                        <div id="about" class="body">
                           
                            <h2 class="title">Add Member</h2>
                            <table id="inputTable" class="w100">
                                <tr>
                                    <td class="auto-style2">
                                        <asp:Label ID="Label1" runat="server" Text="Name :" Class="section_title"></asp:Label>
                                    </td>

                                    <td class="">
                                        <asp:DropDownList ID="DropDownList1" class="form-control" runat="server" AutoPostBack="false" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                            <asp:ListItem>Select</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">
                                        <asp:Label ID="Label2" runat="server" Text="Picture :" Class="section_title"></asp:Label></td>
                                    <td class="auto-style3">
                                        <asp:Image ID="Image1" runat="server" Height="116px" Width="185px" Class="margin_top_20" />
                                        <span class="form-control margin_top_20">
                                            <asp:FileUpload ID="FileUpload1" runat="server"  />
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style4"></td>
                                    <td class="auto-style5">
                                        <asp:Button ID="ButtonSave" Class="btn btn-success margin_top_20 pull-right" runat="server" Text="Add Picture" Width="118px" OnClick="ButtonSave_Click" />
                                        <asp:Label ID="LabelSave" runat="server" ForeColor="Red" Style="font-weight: 700"></asp:Label>
                                        <br />
                                        
                                    </td>
                                </tr>
                            </table>
                            <br />


                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="GridView1"  runat="server" AutoGenerateColumns="false" CssClass="table table-hover"
    Style="Width:100%"> <Columns>
                                            <asp:BoundField DataField="SirialNo" HeaderText="Sl.No" HtmlEncode="true" />
                                            <asp:BoundField DataField="Name" HeaderText="Customer Name" HtmlEncode="true" />
                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkEdit" runat="server" Text="<b>Edit</b>" OnClick="Edit" Style="color: blue" /></linkbutton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <AlternatingRowStyle BackColor="#C2D69B" />
                                    </asp:GridView>
                                    <asp:Button ID="btnAdd" runat="server" Text="Add Member" OnClick="Add" Width="120px" Class="btn btn-success pull-right" />

                                    <asp:Panel ID="pnlAddEdit" runat="server" CssClass="modalPopup" Style="display: none; width:auto; height: 160px;">
                                        <asp:Label Font-Bold="true" ID="Label4" runat="server" Text="Member Add"></asp:Label>
                                        <br />
                                        <table align="center">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label5" runat="server" Text="Name" Class="margin_top_20"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtCustomerID" MaxLength="80" runat="server" Class="margin_top_20 form-control"></asp:TextBox>
                                                </td>
                                            </tr>

                                            <tr>

                                             <asp:HiddenField ID="HiddenField1" runat="server" />
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Button ID="btnSave" Class="btn btn-success margin_top_20" runat="server" Text="Save" OnClick="Save" />
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnUpdate" Class="btn btn-primary margin_top_20 center-block" runat="server" Text="Update" OnClick="Update" />
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnCancel" Class="btn btn-danger margin_top_20 margin_right_20" runat="server" Text="Cancel" OnClientClick="return Hidepopup()" />
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:LinkButton ID="lnkFake" runat="server"></asp:LinkButton>
                                    <cc1:ModalPopupExtender ID="popup" runat="server" DropShadow="false"
                                        PopupControlID="pnlAddEdit" TargetControlID="lnkFake"
                                        BackgroundCssClass="modalBackground">
                                    </cc1:ModalPopupExtender>
                                    <%--<modalpopupextender id="popup" runat="server" backgroundcssclass="modalBackground" dropshadow="false" popupcontrolid="pnlAddEdit" targetcontrolid="lnkFake">--%>
                                 </modalpopupextender>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="GridView1" />
                                    <asp:AsyncPostBackTrigger ControlID="btnSave" />
                                    <asp:AsyncPostBackTrigger ControlID="btnUpdate" />
                                </Triggers>
                            </asp:UpdatePanel>





                        </div>
                        <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

                        <html xmlns="http://www.w3.org/1999/xhtml">
                        <head runat="server">
                            <title>Untitled Page</title>
                        </head>
                        <body>
                            <div>
                            </div>

                        </body>
                    </div>
                    <br />
		            <div id="footer">
           

           
                   
                 </div>
                </div>
            </div>
        </div>
    </form>

</body>
</html>

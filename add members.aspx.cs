
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Collections.Specialized;
using System.Text;
using System.Web.Security;

public partial class add_members : System.Web.UI.Page
{
    private const string AntiXsrfTokenKey = "__AntiXsrfToken";
    private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
    private string _antiXsrfTokenValue;
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mealManagement"].ConnectionString);

    private String strConnString = ConfigurationManager.ConnectionStrings["mealManagement"].ConnectionString;
    SqlCommand cmd;
    SqlDataAdapter sda;
    DataTable dt;
    string filenamewithrand;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
            dropdownListBind();
            if (Session["new"] != null)
            {
                Label3.Text += Session["new"].ToString();

            }
            else
            {
                Response.Redirect("index.aspx");
            }
        }
    }







    protected void ButtonSave_Click(object sender, EventArgs e)
    {
        try
        {
            if (Page.IsValid)
            {
                //  LabelMessage.Text = "";
                if (DropDownList1.SelectedValue != "")
                {
                    string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    Random rand = new Random((int)DateTime.Now.Ticks);
                    int numIterations = 0;
                    numIterations = rand.Next(1, 100);

                    fileName = filenamewithrand;
                    filenamewithrand = numIterations + ".jpg";
                    //Response.Write(filenamewithrand);

                    FileUpload1.SaveAs(Server.MapPath("images/" + filenamewithrand));
                    Image1.ImageUrl = "bazarListPicture/" + filenamewithrand;

                    con.Open();
                    // cmd = new SqlCommand("insert v1Practise (name,personDailyMill,personBazarTK,date) values ('"+TextName.Text+"','"+TextPersonDailyMill.Text+"','"+TextPersonBazarTk.Text+"','"+TextDate.Text+"')", con);
                    cmd = new SqlCommand("IF NOT EXISTS(SELECT name,hostelName,picture from AddMember where hostelName=@hostelName and name=@name and picture=@picture ) " + "update AddMember set picture=@picture where hostelName=@hostelName and name=@name", con);
                    cmd.Parameters.AddWithValue("@hostelName", Label3.Text);
                    cmd.Parameters.AddWithValue("@name", DropDownList1.SelectedValue);
                    //   cmd.Parameters.AddWithValue("@hostelName", Label3.Text);
                    cmd.Parameters.AddWithValue("@picture", "images/" + filenamewithrand.Trim());

                    cmd.ExecuteNonQuery();
                    LabelSave.ForeColor = System.Drawing.Color.Green;
                    if (DropDownList1.SelectedValue != "Select")
                    {
                        Image1.ImageUrl = "images/" + filenamewithrand;
                        LabelSave.Text = "Save";

                    }
                    if (DropDownList1.SelectedValue == "Select")
                    {
                        LabelSave.Text = "Please select a name and picture..";
                        LabelSave.ForeColor = System.Drawing.Color.Red;

                    }
                    con.Close();
                    //   Session["new"] = TextboxName.Text;

                }
                else
                {
                    LabelSave.Text = "Please check your input...";
                    LabelSave.ForeColor = System.Drawing.Color.Red;


                }
            }
        }
        catch (Exception ex)
        {
            LabelSave.Text = "Please check your input...";
            LabelSave.ForeColor = System.Drawing.Color.Red;

            // LabelMessage.Text = "Please select another name or email...";
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("index.aspx");
    }


    private void BindData()
    {
        try
        {
            string strQuery = "select top 10 sirialNo,Name from addMember where hostelName='" + Label3.Text + "' order by sirialNo desc ";
            SqlCommand cmd = new SqlCommand(strQuery);
            GridView1.DataSource = GetData(cmd);
            GridView1.DataBind();
        }
        catch (Exception e)
        {
            Response.Write(e.Message);
        }
    }

    private DataTable GetData(SqlCommand cmd)
    {

        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(strConnString))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = con;
                con.Open();
                sda.SelectCommand = cmd;
                sda.Fill(dt);
                return dt;
            }
        }


    }

    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        this.BindData();
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();


    }

    protected void Edit(object sender, EventArgs e)
    {
        using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
        {
            //  txtCustomerID.ReadOnly = true;
            HiddenField1.Value = row.Cells[0].Text;

            txtCustomerID.Text = row.Cells[1].Text;
            //  txtCompany.Text = row.Cells[2].Text;

            popup.Show();

        }


    }

    protected void Update(object sender, EventArgs e)
    {


        try
        {
            SqlCommand cmd2 = new SqlCommand("update AddMember set name=@name where hostelName=@hostelName and sirialNo=@sirialNo", con);
            cmd2.Parameters.AddWithValue("@hostelName", Label3.Text);
            cmd2.Parameters.AddWithValue("@name", txtCustomerID.Text);
            cmd2.Parameters.AddWithValue("@sirialNo", HiddenField1.Value);
            //   cmd2.Parameters.AddWithValue("@picture", txtContactName.Text);
            GridView1.DataSource = this.GetData(cmd2);
            GridView1.DataBind();


            BindData();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }

    }

    protected void Add(object sender, EventArgs e)
    {
        txtCustomerID.ReadOnly = false;
        txtCustomerID.Text = string.Empty;
        //    txtContactName.Text = string.Empty;
        //  txtCompany.Text = string.Empty;
        popup.Show();

    }

    protected void Save(object sender, EventArgs e)
    {

        try
        {
            SqlCommand cmd2 = new SqlCommand("IF NOT EXISTS(SELECT name,hostelName from AddMember where hostelName=@hostelName and name=@name) " + "insert into AddMember(name,hostelName,date)values(@name,@hostelName,getdate())", con);
            // cmd2.CommandText = "insert into my (id,name,mobile) values(@id,@name,@mobile)";
            //  cmd2.Parameters.AddWithValue("@id", txtCustomerID.Text);
            if (txtCustomerID.Text != "")
            {
                cmd2.Parameters.AddWithValue("@name", txtCustomerID.Text);
                //     cmd2.Parameters.AddWithValue("@picture", txtContactName.Text);
                cmd2.Parameters.AddWithValue("@hostelName", Label3.Text);

                //   cmd2.Parameters.AddWithValue("@mobile", txtCompany.Text);
                GridView1.DataSource = this.GetData(cmd2);
                GridView1.DataBind();
                BindData();

            }

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    private void dropdownListBind()
    {
        SqlDataReader dr;

        try
        {
            con.Open();
            string query = "select distinct name from AddMember ";
            //string[] name;
            cmd = new SqlCommand(query, con);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                DropDownList1.Items.Add(dr.GetString(0));

            }
            con.Close();
        }

        catch (Exception ex)
        {

        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        //Session.Clear();

        FormsAuthentication.SignOut();

        Session.Clear();
        Session.Abandon();
        Session.RemoveAll();

        HttpCookie cookies = Context.Request.Cookies[FormsAuthentication.FormsCookieName];//Or Response
        cookies.Expires = DateTime.Now.AddDays(-1);
        Context.Response.Cookies.Add(cookies);

        if (Request.Cookies["ASP.NET_SessionId"] != null)
        {
            Response.Cookies["ASP.NET_SessionId"].Value = string.Empty;
            Response.Cookies["ASP.NET_SessionId"].Expires = DateTime.Now.AddMonths(-20);
        }

        if (Request.Cookies["AuthToken"] != null)
        {
            Response.Cookies["AuthToken"].Value = string.Empty;
            Response.Cookies["AuthToken"].Expires = DateTime.Now.AddMonths(-20);
        }

        if (Request.Cookies[AntiXsrfTokenKey] != null)
        {
            Response.Cookies[AntiXsrfTokenKey].Value = string.Empty;
            Response.Cookies[AntiXsrfTokenKey].Expires = DateTime.Now.AddMonths(-20);
        }


        //Response.Redirect("Logon.aspx");
        FormsAuthentication.RedirectToLoginPage();
        Response.Redirect("index.aspx");
    }
}

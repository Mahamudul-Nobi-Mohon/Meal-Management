using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;
using System.Data.SqlClient;
using System.Configuration;

public partial class MembersPicture : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
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
    protected void Button7_Click(object sender, EventArgs e)
    {
       
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
       
    }
    protected void BtnSearchByDate_Click(object sender, EventArgs e)
    {
        try
        {
            if (TextBoxStartDate.Text != "" && TextBoxEndDate.Text != "")
            {
                Label4.Text = "";
                SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["mealManagement"].ToString());
                con.Open();
                SqlCommand cmd = new SqlCommand("select picture from AddMember  where hostelName=@hostelName and (date between @startDate and @endDate)", con);
                cmd.Parameters.AddWithValue("@hostelName", Label3.Text);
                cmd.Parameters.AddWithValue("@startDate", TextBoxStartDate.Text);
                cmd.Parameters.AddWithValue("@endDate", TextBoxEndDate.Text);

                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                dListImages.DataSource = dt;
                dListImages.DataBind();

            }
        }
        catch (Exception ex)
        {
            Label4.Text = "Your date format is not correct..!";

        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("index.aspx");
    }
}
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

public partial class input : System.Web.UI.Page
{
    string filenamewithrand;
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mealManagement"].ConnectionString);
    SqlCommand cmd;
    SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Session["new"] != null)
            {
                Label3.Text += Session["new"].ToString();
                dropdownlistBind();

            }
            else
            {
                Response.Redirect("index.aspx");
            }
        }
        //if (IsPostBack)
        //{
        //    if (Session["new"] == null)
        //    {
        //        Response.Redirect("index.aspx");
        //        //  Session["new"] = null;
        //    }
        //}
    }






    public void dropdownlistBind()
    {

        try
        {

            con.Open();
            string query = "select distinct name from addmember ";
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
            // MessageBox.Show(ex.Message);
        }
    }

    protected void ButtonSave_Click(object sender, EventArgs e)
    {

        try
        {
            if (Page.IsValid)
            {
                string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                Random rand = new Random((int)DateTime.Now.Ticks);
                int numIterations = 0;
                numIterations = rand.Next(1, 100);
                fileName = filenamewithrand;
                filenamewithrand = fileName + numIterations + ".jpg";


                FileUpload1.SaveAs(Server.MapPath("bazarListPicture/" + filenamewithrand));
                Image1.ImageUrl = "bazarListPicture/" + filenamewithrand;

                //  SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString);

                con.Open();
                SqlCommand cmd = new SqlCommand("IF NOT EXISTS(SELECT name,hostelName,date from finalPage where hostelName=@hostelName and name=@name and date=@date) " +
                    "insert into finalPage(name,personDailyMeal,personBazarTk,Listpicture,hostelName,date)" +
                                                " values(@name,@personDailyMeal,@personBazarTk,@Listpicture,@hostelName,@date)" + "else" +
                                                " update finalPage set personDailyMeal=@personDailyMeal,personBazarTk=@personBazarTk,Listpicture=@Listpicture," +
                                                "hostelName=@hostelName where name =@name and date=@date", con);

                cmd.Parameters.AddWithValue("@name", DropDownList1.Text);
                cmd.Parameters.AddWithValue("@personDailyMeal", TextPersonDailyMill.Text);
                cmd.Parameters.AddWithValue("@personBazarTk", TextPersonBazarTk.Text);
                cmd.Parameters.AddWithValue("@Listpicture", "bazarListPicture/" + filenamewithrand);

                cmd.Parameters.AddWithValue("@hostelName", Label3.Text);
                cmd.Parameters.AddWithValue("@date", TextBoxDate.Text);
                cmd.ExecuteNonQuery();
                if (DropDownList1.SelectedValue != "Select" && TextBoxDate.Text != "")
                {
                    Image1.ImageUrl = "images/" + filenamewithrand;
                    LabelSave.Text = "Saved Successfully.";
                    LabelSave.ForeColor = System.Drawing.Color.Green;


                }

                if (DropDownList1.SelectedValue == "Select" && TextBoxDate.Text == "")
                {
                    LabelSave.Text = "Please select a name and picture and date..";
                    LabelSave.ForeColor = System.Drawing.Color.Red;

                }
                con.Close();
                clearAllText();
            }
        }
        catch (Exception ex)
        {
            LabelSave.ForeColor = System.Drawing.Color.Red;
           //  LabelSave.Text = "Please give your information correctly.. "; 
            LabelSave.Text = ex.Message;


        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
    }

    public void clearAllText()
    {
        DropDownList1.Text = "Select";
        TextPersonDailyMill.Text = "";
        TextPersonBazarTk.Text = "";
        TextBoxDate.Text = "";
        // Image1.ImageUrl = "";
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            //   clearAllText();
            if (DropDownList1.SelectedValue == "Select")
            {
                image2.Visible = false;
            }
            else
            {
                image2.Visible = true;
                SqlDataAdapter sda = new SqlDataAdapter("select picture from AddMember where name='" + DropDownList1.Text + "' and hostelName='" + Label3.Text + "'", con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                //  label1.Text = dt.Rows[0]["name"].ToString();
                //  label2.Text = dt.Rows[0]["imageName"].ToString();
                image2.ImageUrl = dt.Rows[0]["picture"].ToString();
            }
        }
        catch (Exception ex)
        {

        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("index.aspx");
    }
}
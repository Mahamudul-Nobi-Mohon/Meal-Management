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

public partial class final : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mealManagement"].ConnectionString);
    SqlCommand cmd;
    SqlDataReader dr;
    double mealRate;
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Session["new"] != null)
            {
                Label3.Text += Session["new"].ToString();
                dropdownlistBind();
              //  showMealRate();
            }
            else
            {
                Response.Redirect("index.aspx");
            }
        }
    }

    public void showMealRate()
    {
        try
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(" SELECT SUM(personDailyMeal) AS [Total Meal], SUM(personBazarTk) AS [Total Bazar], SUM(personBazarTK) / SUM(personDailyMeal) AS [Meal Rate] FROM finalPage where hostelName=@hostelName and (date between @startDate and @endDate) ", con);
                cmd.Parameters.AddWithValue("@hostelName", Label3.Text);

                cmd.Parameters.AddWithValue("@startDate", TextBoxStartDate.Text);
                cmd.Parameters.AddWithValue("@endDate", TextBoxEndDate.Text);
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
                con.Close();

            }
            catch (Exception ex)
            {
                // lblStatus.Text = ex.Message;
            }


        }
        catch (Exception ex)
        {

        }
    }

    public void dropdownlistBind()
    {

        try
        {
            con.Open();
            string query = "select distinct name from finalPage where hostelName='" + Label3.Text + "'";

            
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

    protected void Button2_Click(object sender, EventArgs e)
    {
       
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            //  SqlDataAdapter sda = new SqlDataAdapter("  SELECT COUNT(*) as Total_day ,SUM(PersonDailyMill) as Eaten_Mill ,SUM(PersonBazarTk) as Total_Bazar FROM v1Practise WHERE (name = '" + TextBox1.Text + "')", con);
            cmd = new SqlCommand("SELECT COUNT(*) as Total_day ,SUM(PersonDailyMill) as Eaten_Mill ,SUM(PersonBazarTk) as Total_Bazar FROM v1Practise WHERE (name = '" + DropDownList1.SelectedItem + "' and hostelname=@hostelName and (date between @startDate and @endDate) )", con);
            cmd.Parameters.AddWithValue("@hostelName", Label3.Text);

            cmd.Parameters.AddWithValue("@startDate", TextBoxStartDate.Text);
            cmd.Parameters.AddWithValue("@endDate", TextBoxEndDate.Text);
            cmd.ExecuteNonQuery();


            //  sda.Fill(dt);
        }
        catch (Exception ex)
        {
            Label1.Text = ex.Message;
        }

        giveget();
    }
    



    private double MealRate()
    {
        double DailyMill = 0, BazarTk = 0;
        try
        {

            con.Open();
            //    DataTable dt = new DataTable();

            //string query = "select PersonDailyMill, PersonBazarTk FROM v1Practise ";
            //cmd = new SqlCommand(query, con);
            cmd = new SqlCommand(" select personDailyMeal,personBazarTk FROM finalPage WHERE  hostelname=@hostelName and (date between @startDate and @endDate) ", con);
            cmd.Parameters.AddWithValue("@hostelName", Label3.Text);

            cmd.Parameters.AddWithValue("@startDate", TextBoxStartDate.Text);
            cmd.Parameters.AddWithValue("@endDate", TextBoxEndDate.Text);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {

                DailyMill += Convert.ToDouble(dr.GetValue(0));
                BazarTk += Convert.ToDouble(dr.GetValue(1));

            }

            mealRate = BazarTk / DailyMill;
            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write("Error : " + ex.Message);
        }
        return mealRate;
    }

    private void giveget()
    {
        double PersonEatenMill = 0, BazarTk = 0, TotalCost = 0;
        try
        {

            con.Open();
            DataTable dt = new DataTable();

            //string query = "select PersonDailyMill,PersonBazarTk FROM v1Practise WHERE (name = '" + TextBox1.Text + "') ";
            //cmd = new SqlCommand(query, con);
            cmd = new SqlCommand("select personDailyMeal,personBazarTk FROM finalPage WHERE (name = '" + DropDownList1.Text + "' and hostelname=@hostelName and (date between @startDate and @endDate))  ", con);
            cmd.Parameters.AddWithValue("@hostelName", Label3.Text);

            cmd.Parameters.AddWithValue("@startDate", TextBoxStartDate.Text);
            cmd.Parameters.AddWithValue("@endDate", TextBoxEndDate.Text);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {

                PersonEatenMill += Convert.ToDouble(dr.GetValue(0));
                BazarTk += Convert.ToDouble(dr.GetValue(1));

            }



            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write("Error : " + ex.Message);
        }

        TotalCost = PersonEatenMill * MealRate();

        double giveGet = BazarTk - TotalCost;

        if (giveGet < 0)
        {
            Label1.Text = (DropDownList1.Text + "    Will Give : " + (giveGet * -1).ToString() + " TK");
        }
        else if (giveGet > 0)
        {
            Label1.Text = (DropDownList1.Text + "    Will Get : " + giveGet.ToString() + " TK");
        }
        else
        {
            Label1.Text = (DropDownList1.Text + "    You have no due Money.");

        }
    }

    protected void BtnSearchByDate_Click(object sender, EventArgs e)
    {

       

          try
        {
            if (Label4.Text != "Your date format is not correct..!" || Label4.Text == "please select start and end date.." || Label4.Text=="please select date..")
            {
                if (TextBoxStartDate.Text != "" && TextBoxEndDate.Text != "")
                {
                    Label4.Text = "";
                    con.Open();
                    //  SqlDataAdapter sda = new SqlDataAdapter("  select sirialno,name,personDailyMeal,personBazarTk,Listpicture,date from finalPage  where hostelname='mohon khan' and (date between @startDate and @endDate) ", con);
                    SqlCommand cmd = new SqlCommand(" select name,personDailyMeal,personBazarTk,date from finalPage  where hostelname=@hostelName and (date between @startDate and @endDate) ", con);
                    cmd.Parameters.AddWithValue("@hostelName", Label3.Text);
                    cmd.Parameters.AddWithValue("@startDate", TextBoxStartDate.Text);
                    cmd.Parameters.AddWithValue("@endDate", TextBoxEndDate.Text);
                    cmd.ExecuteNonQuery();
                    DataTable dt = new DataTable();
                    //  sda.Fill(dt);
                    GridView2.DataSource = cmd.ExecuteReader();
                    DataBind();
                    con.Close();
                }



                if (Label4.Text == "Your date format is not correct..!" || Label4.Text == "please select start and end date..")
                {
                    GridView2.Visible = false;
                }
                else
                {
                    GridView2.Visible = true;
                }

                if (TextBoxStartDate.Text == "" && TextBoxEndDate.Text == "")
                {
                    Label4.Text = "please select date..";
                }

                else if (TextBoxStartDate.Text == "" || TextBoxEndDate.Text == "")
                {
                    Label4.Text = "please select start and end date..";
                }

            }
            else
            {
                Label4.Text = "Wrong input. Please check...";
            }
        }
        catch (Exception ex)
        {
            Label4.Text = "Your date format is not correct..!";
               
        }
          GridView1.Visible = true;
          showMealRate();

        
        }

    protected void ButtonHide_Click(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        GridView2.Visible = false;
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("index.aspx");
    }
}

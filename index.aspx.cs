using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mealManagement"].ConnectionString);
   
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private string encriptPassword(String pass)
    {
        byte[] bytes = System.Text.Encoding.Unicode.GetBytes(pass);
        string encriptedPassword = Convert.ToBase64String(bytes);
        return encriptedPassword;
    }

    private void authenticateUser(String ID, String Password)
    {

        string cs = ConfigurationManager.ConnectionStrings["mealManagement"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {

            SqlCommand cmd = new SqlCommand("LoginPage", con);
            cmd.CommandType = CommandType.StoredProcedure;
            //    string encriptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(TextboxPassword.Text, "aaa"); 
            SqlParameter ParamUserID = new SqlParameter("@hostelname", ID);
            SqlParameter ParamPassword = new SqlParameter("@password", Password);
            cmd.Parameters.Add(ParamUserID);
            cmd.Parameters.Add(ParamPassword);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {

                if (Convert.ToBoolean(rdr["Authenticated"]))
                {
                    Session["new"] = textboxName.Text;
                    Response.Redirect("add members.aspx");
                  //  Response.Redirect("input.aspx");


                }

            }
        }
    }
    protected void Login_Click(object sender, EventArgs e)
    {
        try
        {
            if (textboxName.Text == "" || textboxPassword.Text == "" || textboxName.Text == null || textboxPassword.Text == null)
            {
                messageLebel.Text ="UserName and Password is Required.";
            }

            else
            {
                authenticateUser(textboxName.Text, encriptPassword(textboxPassword.Text));
            }

        }
        catch (Exception ex)
        {
            messageLebel.Text = "UserName or Password is Wrond.";
        }
    }

    protected void ButtonSave_Click(object sender, EventArgs e)
    {
        try
        {
            if (Page.IsValid)
            {
            //    LabelMessage.Text = "";
                if (TextboxName2.Text != "" && TextContactMail.Text != "" && TextPassword.Text != "" && TextBoxConfirmPassword.Text != "")
                {
                    con.Open();
                    SqlCommand cmd;
                    // cmd = new SqlCommand("insert v1Practise (name,personDailyMill,personBazarTK,date) values ('"+TextName.Text+"','"+TextPersonDailyMill.Text+"','"+TextPersonBazarTk.Text+"','"+TextDate.Text+"')", con);
                    cmd = new SqlCommand("IF NOT EXISTS(SELECT hostelname,email from CreateNewUser where hostelname='" + TextboxName2.Text + "' and email='" + TextContactMail.Text + "') " + "insert into CreateNewUser (hostelname,email,password,date) values ('" + TextboxName2.Text + "','" + TextContactMail.Text + "','" + encriptPassword(TextPassword.Text) + "',getdate())", con);

                    cmd.ExecuteNonQuery();
                 //   LabelMessage.Text = "Save";
                    con.Close();
                    Session["new"] = TextboxName2.Text;
            //        if (LabelMessage.Text == "Save")
            //        {
                     Response.Redirect("input.aspx");
            //        }
              }
            //    else
            //    {
            //        LabelMessage.Text = "Please select another name or email...";
            //    }
            }
            //else
            //{
            //    LabelMessage.Text = "Please fill up all textboxes...";

            //}
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
           // LabelMessage.Text = "Error" + ex.Message;
            // LabelMessage.Text = "Please select another name or email...";
        }
    }
}
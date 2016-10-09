using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class create_new_account : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mealManagement"].ConnectionString);
    SqlCommand cmd;
    SqlDataAdapter sda;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonSave_Click(object sender, EventArgs e)
    {
        try
        {
            if (Page.IsValid)
            {
                // LabelMessage.Text = "";
                if (TextboxName2.Text != "" && TextContactMail.Text != "" && TextPassword.Text != "" && TextBoxConfirmPassword.Text != "")
                {
                    con.Open();
                    // cmd = new SqlCommand("insert v1Practise (name,personDailyMill,personBazarTK,date) values ('"+TextName.Text+"','"+TextPersonDailyMill.Text+"','"+TextPersonBazarTk.Text+"','"+TextDate.Text+"')", con);
                    cmd = new SqlCommand("IF NOT EXISTS(SELECT hostelname,email from CreateNewUser where hostelname='" + TextboxName2.Text + "' and email='" + TextContactMail.Text + "') " + "insert into CreateNewUser (hostelname,email,password,date) values ('" + TextboxName2.Text + "','" + TextContactMail.Text + "','" + encriptPassword(TextPassword.Text) + "',getdate())", con);

                    cmd.ExecuteNonQuery();
                    //  LabelMessage.Text = "Save";
                    con.Close();
                    Session["new"] = TextboxName2.Text;

                }

            }
        }
        catch (Exception ex)
        {
            //  LabelMessage.Text = "Error"+ex.Message;
            // LabelMessage.Text = "Please select another name or email...";
        }
    }

    private string encriptPassword(String pass)
    {
        byte[] bytes = System.Text.Encoding.Unicode.GetBytes(pass);
        string encriptedPassword = Convert.ToBase64String(bytes);
        return encriptedPassword;
    }
}
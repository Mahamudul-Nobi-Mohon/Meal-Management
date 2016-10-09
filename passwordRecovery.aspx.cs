using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Drawing;
using System.Configuration;
using System.Data.SqlClient;

public partial class passwordRecovery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void SendEmail(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string id = string.Empty;
            string username = string.Empty;
            string password = string.Empty;
            string constr = ConfigurationManager.ConnectionStrings["mealManagement"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("select hostelName,email,Password from createNewUser where hostelName=@hostelName and email=@email"))
                {
                    cmd.Parameters.AddWithValue("@hostelName", TextBoxId.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.Read())
                        {

                            username = sdr["hostelName"].ToString();
                            id = sdr["email"].ToString();
                            password = sdr["Password"].ToString();
                        }
                    }
                    con.Close();
                }
            }
            if (!string.IsNullOrEmpty(password))
            {
                MailMessage mm = new MailMessage("emonkhan129@yahoo.com", txtEmail.Text.Trim());
                mm.Subject = "Password Recovery";
                mm.Body = string.Format("Hi {0},<br />Your email is : {1},<br />Your password is : {2}<br /><br />Thank You.", username, id, DeCryptPassword(password));
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.mail.yahoo.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential();
                NetworkCred.UserName = "emonkhan129@yahoo.com";
                NetworkCred.Password = "3414710";
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(mm);
                lblMessage.ForeColor = Color.Green;
                lblMessage.Text = "If Id and Email Is Correct Then Password Send On Your Mail...";
            }
            else
            {
                lblMessage.ForeColor = Color.Green;
                lblMessage.Text = "If Id and Email Is Correct Then Password Send On Your Mail...";

            }
        }
    }

    private string DeCryptPassword(String EncriptedPass)
    {
        byte[] bytes = Convert.FromBase64String(EncriptedPass);
        string DeCryptedPassword = System.Text.Encoding.Unicode.GetString(bytes);
        return DeCryptedPassword;
    }

}
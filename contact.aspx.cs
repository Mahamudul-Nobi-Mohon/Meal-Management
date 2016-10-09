using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class contact : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mealManagement"].ConnectionString);
   
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                //here on button click what will done 
                SendMail();
                DisplayMessage.Text = "Your Mail Is sending succesfully..";
                DisplayMessage.Visible = true;
                YourSubject.Text = "";
                YourEmail.Text = "";
                YourName.Text = "";
                Comments.Text = "";
            }
            catch (Exception) { }


        }
    }

    protected void SendMail()
    {

        using (MailMessage message = new MailMessage())
        {
            // Gmail Address from where you send the mail
            var fromAddress = "emonkhan129@yahoo.com";
            // any address where the email will be sending
            var toAddress = "mn.mohon@gmail.com";
            //Password of your gmail address
            var fromPassword = "3414710";
            // Passing the values and make a email formate to display
            string subject = YourSubject.Text.ToString();
            string body = "Name : " + YourName.Text + "\n";
            body += "Email : " + YourEmail.Text + "\n";
            body += "Subject : " + YourSubject.Text + "\n";
            body += "Comments : \n" + Comments.Text + "\n";
            // smtp settings
            var smtp = new System.Net.Mail.SmtpClient();
            {
                smtp.Host = "smtp.mail.yahoo.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
                smtp.Timeout = 20000;
            }
            // Passing values to smtp object
            smtp.Send(fromAddress, toAddress, subject, body);
        }
    }
    protected void YourEmail_TextChanged(object sender, EventArgs e)
    {

    }
}
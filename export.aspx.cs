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

public partial class export : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mealManagement"].ConnectionString);
   
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)
        {
            BtnSearchByDate.Focus();
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
    protected void Button2_Click(object sender, EventArgs e)
    {
       
    }
    protected void Button1_Click(object sender, EventArgs e)
    { 
        if (GridView1.Visible == true) { 
        try
        {
            HtmlForm form = new HtmlForm();
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.AddHeader("content-disposition", string.Format("attachment;filename={0}", "Meal_Calculation.doc"));
            Response.ContentType = "application/ms-msword";
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            GridView1.AllowPaging = false;
            //   BindGridDetails(GridView1);
            form.Attributes["runat"] = "server";
            form.Controls.Add(GridView1);
            this.Controls.Add(form);
            form.RenderControl(hw);
            string style = @"<!--mce:0-->";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }
        catch (Exception ex)
        {
            Response.Write("Please select date");
        }
     }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
         if (GridView1.Visible == true) { 
        try { 
        HtmlForm form = new HtmlForm();
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "";
        Response.AddHeader("content-disposition", string.Format("attachment;filename={0}", "Meal_Calculation.xls"));
        Response.ContentType = "application/ms-excel";
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        GridView1.AllowPaging = false;
        //  BindGridDetails(GridView1);
        form.Attributes["runat"] = "server";
        form.Controls.Add(GridView1);
        this.Controls.Add(form);
        form.RenderControl(hw);
        string style = @"<!--mce:2-->";
        Response.Write(style);
        Response.Output.Write(sw.ToString());
        Response.Flush();
        Response.End();
        }
        catch (Exception ex)
        {
            Response.Write("Please select date");
        }
         }
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
         try
            {
        if (GridView1.Visible == true)
        {
           
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=Meal_Calculation.pdf");
                //  Response.Cache.SetCacheability(HttpCacheability.NoCache);
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                //  GridView1.AllowPaging = false;
                HtmlForm frm = new HtmlForm();
                GridView1.Parent.Controls.Add(frm);
                //  frm.Attributes["runat"] = "server";
                frm.Controls.Add(GridView1);
                frm.RenderControl(hw);
                //  GridView1.DataBind();
                StringReader sr = new StringReader(sw.ToString());
                iTextSharp.text.Document pdfDoc = new iTextSharp.text.Document(PageSize.A4, 10f, 10f, 10f, 10f);
                HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                pdfDoc.Open();
                htmlparser.Parse(sr);
                pdfDoc.Close();
                Response.Write(pdfDoc);
                Response.End();
            }
         }
            catch (Exception ex)
            {
                Response.Write("Please select date");
            }
        }
    
    protected void Button5_Click(object sender, EventArgs e)
    { if (GridView1.Visible == true) { 
        try { 
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=Meal_Calculation.csv");
        Response.Charset = "";
        Response.ContentType = "application/text";
        GridView1.AllowPaging = false;
        GridView1.DataBind();
        StringBuilder sb = new StringBuilder();
        for (int k = 0; k < GridView1.Columns.Count; k++)
        {
            //add separator 
            sb.Append(GridView1.Columns[k].HeaderText + ',');
        }
        //append new line 
        sb.Append("\r\n");
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            for (int k = 0; k < GridView1.Columns.Count; k++)
            {
                //add separator 
                sb.Append(GridView1.Rows[i].Cells[k].Text + ',');
            }
            //append new line 
            sb.Append("\r\n");
        }
        Response.Output.Write(sb.ToString());
        Response.Flush();
        Response.End();
        }
        catch (Exception ex)
        {
            Response.Write("Please select date");
        }
    }}
    protected void BtnSearchByDate_Click(object sender, EventArgs e)
    {




        try
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
                GridView1.DataSource = cmd.ExecuteReader();
                DataBind();
                con.Close();
            }


            
                if (Label4.Text == "Your date format is not correct..!" || Label4.Text == "please select start or end date..")
                {
                    GridView1.Visible = false;
                }
                else
                {
                    GridView1.Visible = true;
                }

                if (TextBoxStartDate.Text == "" && TextBoxEndDate.Text == "")
                {
                    Label4.Text = "please select date..";
                }

                else if (TextBoxStartDate.Text == "" || TextBoxEndDate.Text == "")
                {
                    Label4.Text = "please select start or end date..";
                }

            
        }
        catch (Exception ex)
        {
            Label4.Text = "Your date format is not correct..!";
               
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
   
   
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("index.aspx");
    }
}
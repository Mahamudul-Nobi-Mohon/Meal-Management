using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
/// <summary>
/// Summary description for EmployeeDataAcess
/// </summary>
/// 



public class Employee
{
    public string name { get; set; }
    public int personDailyMeal { get; set; }
    public int personBazarTk { get; set; }
    public string date { get; set; }
    public string Listpicture { get; set; }
    public string picture { get; set; }


    //  AddMember.name,finalPage.personDailyMeal,finalPage.personBazarTk,finalPage.Listpicture,AddMember.picture,AddMember.date from finalPage

}



public class EmployeeDataAcess
{
   
    public static List<Employee> getallEmployee()
    {
        
        List<Employee> listEmployees = new List<Employee>();
        string cs = ConfigurationManager.ConnectionStrings["mealManagement"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("select AddMember.name,finalPage.personDailyMeal,finalPage.personBazarTk,finalPage.Listpicture,AddMember.picture,finalPage.date from finalPage inner join AddMember on AddMember.name=finalPage.name  where (finalPage.date between '2012-01-02' and '2015-01-02') and finalPage.hostelName='Mohon khan'", con);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                Employee employee = new Employee();
                employee.name = rdr["name"].ToString();
                employee.personDailyMeal = Convert.ToInt32(rdr["personDailyMeal"].ToString());
                employee.personBazarTk = Convert.ToInt32(rdr["personBazarTk"].ToString());
                employee.date = rdr["date"].ToString();
               employee.Listpicture = rdr["Listpicture"].ToString();
               employee.picture = rdr["picture"].ToString();
               
              
                listEmployees.Add(employee);
            }
           

        }
        return listEmployees;
        
    }

}

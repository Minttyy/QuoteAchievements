using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;
using System.Net.Security;

namespace QuoteAchievements.Pages.Quotes
{
    public class CreateModel : PageModel
    {
        public QuotesInfo quotesInfo = new QuotesInfo();
        public String errorMessage = "";
        public String successMessage = "";
        public void OnGet()
        {
        }

        public void OnPost() 
        {
            quotesInfo.author = Request.Form["author"];
            quotesInfo.quote = Request.Form["quote"];

            if (quotesInfo.author.Length == 0 || quotesInfo.quote.Length == 0)
            {
                errorMessage = "All fields are required";
                return;
            }

            //save the new quote into database
            try
            {
                String connectionString = "Data Source=(local)\\SQLEXPRESSSERVER;Initial Catalog=webpage;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    String sql = "INSERT INTO quotes" +
                                 "(quote, author) VALUES " +
                                 "(@quote, @author);";
                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        command.Parameters.AddWithValue("@quote", quotesInfo.quote);
                        command.Parameters.AddWithValue("@author", quotesInfo.author);

                        command.ExecuteNonQuery();  
                    }
                }
            }
            catch (Exception ex) 
            {
                errorMessage = ex.Message;
                return;
            }

            quotesInfo.author = ""; quotesInfo.quote = ""; quotesInfo.IsFavourite = "";
            successMessage = "New client added correctly!";

            Response.Redirect("/Quotes/Index");
        }
    }
}

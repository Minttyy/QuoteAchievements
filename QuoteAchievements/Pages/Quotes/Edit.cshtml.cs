using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;

namespace QuoteAchievements.Pages.Quotes
{
    public class EditModel : PageModel
    {
        public QuotesInfo quotesInfo = new QuotesInfo();
        public String errorMessage = "";
        public String successMessage = "";
        public void OnGet()
        {
            String id = Request.Query["id"];

            try
            {
                String connectionString = "Data Source=(local)\\SQLEXPRESSSERVER;Initial Catalog=webpage;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    String sql = "SELECT * FROM quotes WHERE id=@id";
                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        command.Parameters.AddWithValue("id", id);
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                quotesInfo.id = "" + reader.GetInt32(0);
                                quotesInfo.quote = reader.GetString(1);
                                quotesInfo.author = reader.GetString(2);
                            }
                        }
                    }
                }
            }
            catch (Exception ex) 
            {
                errorMessage = ex.Message;
            }
        }

        public void OnPost() 
        {
            quotesInfo.id = Request.Form["id"];
            quotesInfo.author = Request.Form["author"];
            quotesInfo.quote = Request.Form["quote"];

            if (quotesInfo.id.Length == 0 || quotesInfo.author.Length == 0 || quotesInfo.quote.Length == 0)
            {
                errorMessage = "All fields are required";
                return;
            }

            try
            {
                String connectionString = "Data Source=(local)\\SQLEXPRESSSERVER;Initial Catalog=webpage;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    String sql = "UPDATE quotes" +
                                 "SET quote=@quote, author=@author" +
                                 "WHERE id=@id;";

                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        command.Parameters.AddWithValue("@quote", quotesInfo.quote);
                        command.Parameters.AddWithValue("@author", quotesInfo.author);
                        command.Parameters.AddWithValue("@id", quotesInfo.id);

                        command.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                errorMessage = ex.Message;
                return;
            }

            Response.Redirect("/Quotes/Index");
        }
    }
}

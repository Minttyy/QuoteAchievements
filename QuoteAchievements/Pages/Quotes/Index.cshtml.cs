using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using QuoteAchievements.Pages.Helpers;
using System.Data.SqlClient;
using System.Net.Security;
using System.Reflection.PortableExecutable;
using System.Xml;

namespace QuoteAchievements.Pages.Quotes
{
    public class IndexModel : PageModel
    {
        public List<QuotesInfo> listQuotes = new List<QuotesInfo>();
        public string SuccessMessage { get; private set; } = "";
        public string DeletionMessage { get; private set; } = "";
        public void OnGet()
        {
            SuccessMessage = TempData["SuccessMessage"] as string;
            DeletionMessage = TempData["DeletionMessage"] as string;

            try
            {
                String connectionString = "Data Source=(local)\\SQLEXPRESSSERVER;Initial Catalog=webpage;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";
                using (SqlConnection connection = new SqlConnection(connectionString)) 
                {
                    connection.Open();

                    String sql = "SELECT quotes.id, quotes.author, quotes.quote, quotes.IsFavourite, category.name FROM quotes LEFT JOIN category ON quotes.category_id = category.id ";
                    using (SqlCommand command = new SqlCommand(sql, connection)) 
                    {
                        using ( SqlDataReader reader = command.ExecuteReader()) 
                        {
                            while (reader.Read()) 
                            {
                                QuotesInfo quotesInfo = new QuotesInfo
                                {
                                    id = "" + reader.GetInt32(0),
                                    author = reader.SafeGetString(1),
                                    quote = reader.SafeGetString(2),
                                    IsFavourite = reader.SafeGetBoolean(3).ToString(),
                                    category_name = reader.SafeGetString(4),
                                };
                                
                                listQuotes.Add(quotesInfo);
                            }
                        }
                    }
                }
            }
            catch (Exception ex) 
            {
                Console.WriteLine("Exception: " + ex.ToString());
            }

        }
    }

    public class QuotesInfo
    {
        public String id;
        public String quote;
        public String author;
        public String IsFavourite;
        public String category_name;
    }
}

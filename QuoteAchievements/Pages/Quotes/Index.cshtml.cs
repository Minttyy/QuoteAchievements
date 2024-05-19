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
        public void OnGet()
        {
            try
            {
                String connectionString = "Data Source=(local)\\SQLEXPRESSSERVER;Initial Catalog=webpage;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";
                using (SqlConnection connection = new SqlConnection(connectionString)) 
                {
                    connection.Open();
                    String sql = "SELECT * FROM quotes";
                    using (SqlCommand command = new SqlCommand(sql, connection)) 
                    {
                        using ( SqlDataReader reader = command.ExecuteReader()) 
                        {
                            while (reader.Read()) 
                            {
                                QuotesInfo quotesInfo = new QuotesInfo();
                                var authorTemp = reader.GetValue(1);
                                quotesInfo.id = "" + reader.GetInt32(0);


                                quotesInfo.author = reader.SafeGetString(1);
                                //quotesInfo.author = (string)reader.GetValue(2)??string.Empty;
                                //quotesInfo.IsFavourite = reader.GetBoolean(3).ToString();
                                //quotesInfo.category_id = "" + reader.GetInt32(4);

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
        public String category_id;
    }
}

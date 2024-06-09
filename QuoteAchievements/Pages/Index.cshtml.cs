using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using QuoteAchievements.Pages.Quotes;
using QuoteAchievements.Pages.Helpers;
using System.Data.SqlClient;


// Testing
namespace QuoteAchievements.Pages
{
    public class IndexModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;

        public IndexModel(ILogger<IndexModel> logger)
        {
            _logger = logger;
        }

        public Quote Quotes { get; set; }

        public async Task OnGetAsync()
        {
            try
            {
                List<Quote> quotes = await Quote.GetAllQuotesAsync();

                if (quotes.Count > 0)
                {
                    Random random = new Random();
                    int index = random.Next(quotes.Count);
                    Quotes = quotes[index];
                }
                else
                {
                    Quotes = new Quote { Text = "No quotes available", Author = "System" };
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "An error occurred while getting quotes.");
                Quotes = new Quote { Text = "An error occurred while getting quotes.", Author = "System" };
            }
        }

        public class Quote
        {
            public string Id { get; set; }
            public string Text { get; set; }
            public string Author { get; set; }

            private static string connectionString = "Data Source=(local)\\SQLEXPRESSSERVER;Initial Catalog=webpage;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

            public static async Task<List<Quote>> GetAllQuotesAsync()
            {
                var quotes = new List<Quote>();

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    await conn.OpenAsync();
                    using (SqlCommand cmd = new SqlCommand("SELECT quotes.id, quotes.quote, quotes.author FROM quotes LEFT JOIN category ON quotes.category_id = category.id", conn))
                    {
                        using (SqlDataReader reader = await cmd.ExecuteReaderAsync())
                        {
                            while (await reader.ReadAsync())
                            {
                                quotes.Add(new Quote
                                {
                                    Id = reader.GetInt32(0).ToString(),
                                    Text = reader.GetString(1),
                                    Author = reader.GetString(2)
                                });
                            }
                        }
                    }
                }

                return quotes;
            }
        }
    }
    
}


using System.Data.SqlClient;

namespace QuoteAchievements.Pages.Helpers
{
    public static class ReaderExtension
    {
        public static string SafeGetString(this SqlDataReader reader, int colIndex)
        {
            if (!reader.IsDBNull(colIndex))
                return reader.GetString(colIndex);
            return string.Empty;

        }
    }
}

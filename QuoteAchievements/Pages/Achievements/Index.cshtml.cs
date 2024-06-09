using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace QuoteAchievements.Pages.Achievements
{
    public class AchievementsModel : PageModel
    {
        private readonly ILogger<AchievementsModel> _logger;

        public AchievementsModel(ILogger<AchievementsModel> logger)
        {
            _logger = logger;
        }

        public void OnGet()
        {
        }
    }

}

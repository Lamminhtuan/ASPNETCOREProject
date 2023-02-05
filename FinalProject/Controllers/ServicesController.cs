using Microsoft.AspNetCore.Mvc;

namespace FinalProject.Controllers
{
    public class ServicesController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Service1()
        {
            return View();
        }

        public IActionResult Service2()
        {
            return View();
        }

        public IActionResult Service3()
        {
            return View();
        }
    }
}

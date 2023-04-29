using Microsoft.AspNetCore.Mvc;

namespace FinalProject.Controllers
{
    public class BlogController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public IActionResult Blog1()
        {
            return View();
        }
        [HttpGet]
        public IActionResult Blog2()
        {
            return View();
        }
        [HttpGet]
        public IActionResult Blog3()
        {
            return View();
        }
        [HttpGet]
        public IActionResult Blog4()
        {
            return View();
        }
        [HttpGet]
        public IActionResult Blog5()
        {
            return View();
        }
        [HttpGet]
        public IActionResult Blog6()
        {
            return View();
        }
        [HttpGet]
        public IActionResult Blog7()
        {
            return View();
        }
    }
}

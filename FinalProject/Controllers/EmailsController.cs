using Microsoft.AspNetCore.Mvc;
using FinalProject.Models;
using MimeKit;
using MailKit.Net.Smtp;
using MailKit.Security;
namespace FinalProject.Controllers
{
    //[Route("api/[controller]")]
    //[ApiController]
    public class EmailsController : Controller
    {
    
        public JsonResult Index(string nguoinhan)
        {

            Random rand = new Random();
            int randnum = rand.Next(1000000);
            string sixdigits = randnum.ToString("D6");
            TaikhoansDAL.kpmatkhau = sixdigits;
            var email = new MimeMessage();
            email.From.Add(MailboxAddress.Parse("teststore7891@gmail.com"));
            email.To.Add(MailboxAddress.Parse(nguoinhan));
            email.Subject = "Khôi phục mật khẩu cho hệ thống UIT STORE";
            email.Body = new TextPart(MimeKit.Text.TextFormat.Html)
            {
                Text = sixdigits
            };
            using var smtp = new SmtpClient();
            smtp.Connect("smtp.gmail.com", 587, SecureSocketOptions.StartTls);
            smtp.Authenticate("teststore7891@gmail.com", "cvhnvueucokhrfsc");
            smtp.Send(email);
            smtp.Disconnect(true);
            return Json(new 
            {
                toxacnhan = Url.Action("LayMaXacNhan", "Taikhoans")

            });
        }
    }
}

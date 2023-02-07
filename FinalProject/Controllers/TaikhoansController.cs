using FinalProject.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;


namespace FinalProject.Controllers
{


    public class TaikhoansController : Controller
    {
        private readonly ASPContext _context;

        public TaikhoansController(ASPContext context)
        {
            _context = context;
        }
        public async Task<IActionResult> DoiMatKhau(string email)
        {
            var tk = _context.Taikhoans.SingleOrDefault(b => b.Email.Equals(email));
            return View(tk);
        }
        public IActionResult QuenMatKhau()
        {
            return View();
        }


        public IActionResult DangNhap(string email, string password, string returnUrl)
        {
            //Nếu như đang load form thì lấy returnurl để chuyển hướng, còn nếu người dùng đã vào được form đăng nhập thì không lấy (vì khi đó sẽ lấy returnurl là chính view đăng nhập)
            if (!String.IsNullOrEmpty(returnUrl) && String.IsNullOrEmpty(email) && String.IsNullOrEmpty(password))
                TempData["returnurl"] = returnUrl;
            TempData.Keep();
            if (!String.IsNullOrEmpty(email) && !String.IsNullOrEmpty(password))
            {
                //Đăng nhập
                string query = "EXEC DangNhap @email = '" + email + "', @password = '" + password + "'";
                var taikhoan = _context.Taikhoans.FromSqlRaw(query).ToList();
                //Nếu thành công
                if (taikhoan.Count > 0)
                {
                    string role = taikhoan[0].VaiTro;
                    string name = taikhoan[0].HoTen;
                    string sdt = taikhoan[0].Sdt;
                    string diachi = taikhoan[0].DiaChi;

                    var claims = new List<Claim>
                    {
                        new Claim(ClaimTypes.Email, email),
                        new Claim(ClaimTypes.Name, name),
                        new Claim(ClaimTypes.Role, role),
                        new Claim(ClaimTypes.MobilePhone, sdt),
                        new Claim(ClaimTypes.StreetAddress, diachi)
                    };
                    var identity = new ClaimsIdentity(
                        claims, CookieAuthenticationDefaults.AuthenticationScheme);
                    var principal = new ClaimsPrincipal(identity);
                    var props = new AuthenticationProperties();
                    HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, principal, props).Wait();
                    
                    if (TempData["returnurl"] != null)
                    {
                        //Chuyển hướng tới trang mong muốn
                        return LocalRedirect(TempData["returnurl"].ToString());
                    }

                    else
                        return RedirectToAction("");
                }

                else
                {
                    ModelState.AddModelError(String.Empty, "Sai tài khoản hoặc mật khẩu!");
                    return View();
                }
            }
            else
                return View();
        }

        public IActionResult DangXuat()
        {
            //Xóa yêu thích trong bảng tạm
            _context.Yeuthiches.RemoveRange(_context.Yeuthiches.Where(b => b.Email.Equals("Test")));
            _context.SaveChanges();
            HttpContext.SignOutAsync();
            return RedirectToAction("DangNhap");
        }
        public IActionResult DangNhapThanhCong()
        {
            return View();
        }
        public bool CheckEmailExists(string email)
        {
            string query = "EXEC CheckEmailExists @email = '" + email + "'";
            var taikhoan = _context.Taikhoans.FromSqlRaw(query).ToList();
            if (taikhoan.Count > 0)
            {
                TaikhoansDAL.emailkpmatkhau = email;
                return true;
            }
            else
                return false;
        }
        public IActionResult EditTaiKhoan(string email, string hoten, string diachi, string sdt)
        {
            var tk = _context.Taikhoans.SingleOrDefault(b => b.Email.Equals(email));
            tk.HoTen = hoten;
            tk.DiaChi = diachi;
            tk.Sdt = sdt;
            _context.SaveChanges();
            return RedirectToAction("DangNhapThanhCong");
        }
        public void EditPassword(string email, string password)
        {

            string query = "EXEC DoiMatKhau @email = '" + email + "'" + ",@password='" + password + "'";
            _context.Database.ExecuteSqlRaw(query);

        }

        public IActionResult KPMatKhau()
        {
            return View();
        }

        public bool SoSanhMXN(string maxacnhan)
        {
            if (maxacnhan.Equals(TaikhoansDAL.kpmatkhau))
                return true;
            else
                return false;
        }
        public IActionResult LayMaXacNhan()
        {
            return View();
        }
        // GET: Taikhoans
        [Authorize]
        public async Task<IActionResult> Index()
        {
            return View(await _context.Taikhoans.ToListAsync());
        }

        // GET: Taikhoans/Details/5

        public async Task<IActionResult> Details(string id)
        {
            if (id == null || _context.Taikhoans == null)
            {
                return NotFound();
            }

            var taikhoan = await _context.Taikhoans
                .FirstOrDefaultAsync(m => m.Email == id);
            if (taikhoan == null)
            {
                return NotFound();
            }

            return View(taikhoan);
        }

        // GET: Taikhoans/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Taikhoans/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Email,HoTen,DiaChi, MatKhau, Sdt,VaiTro")] Taikhoan taikhoan)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    _context.Add(taikhoan);
                    
                    await _context.SaveChangesAsync();
                    return RedirectToAction("DangNhap");
                }
                catch
                {
                    ModelState.AddModelError(String.Empty, "Email đã tồn tại!");

                }
            }
            var errors = ModelState.Values.SelectMany(v => v.Errors);
            return View(taikhoan);
        }

        // GET: Taikhoans/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null || _context.Taikhoans == null)
            {
                return NotFound();
            }

            var taikhoan = await _context.Taikhoans.FindAsync(id);
            if (taikhoan == null)
            {
                return NotFound();
            }
            return View(taikhoan);
        }

        // POST: Taikhoans/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.


        // GET: Taikhoans/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null || _context.Taikhoans == null)
            {
                return NotFound();
            }

            var taikhoan = await _context.Taikhoans
                .FirstOrDefaultAsync(m => m.Email == id);
            if (taikhoan == null)
            {
                return NotFound();
            }

            return View(taikhoan);
        }

        // POST: Taikhoans/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            if (_context.Taikhoans == null)
            {
                return Problem("Entity set 'ASPContext.Taikhoans'  is null.");
            }
            var taikhoan = await _context.Taikhoans.FindAsync(id);
            if (taikhoan != null)
            {
                _context.Taikhoans.Remove(taikhoan);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool TaikhoanExists(string id)
        {
            return _context.Taikhoans.Any(e => e.Email == id);
        }
    }
}

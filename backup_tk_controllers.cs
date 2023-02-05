using FinalProject.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace FinalProject.Controllers
{


    public class TaikhoansController : Controller
    {
        private readonly ASPContext _context;

        public TaikhoansController(ASPContext context)
        {
            _context = context;
        }
        public IActionResult QuenMatKhau()
        {
            return View();
        }
        public IActionResult DangNhap(string email, string password, string thanhtoan)
        {
            if (!String.IsNullOrEmpty(thanhtoan))
                TempData["ThanhToan"] = thanhtoan;
            
            if (!String.IsNullOrEmpty(email) && !String.IsNullOrEmpty(password))
            {
               
               
                //Stored Procedure trong SQL
                string query = "EXEC DangNhap @email = '" + email + "', @password = '" + password +"'";
                var taikhoan = _context.Taikhoans.FromSqlRaw(query).ToList();

                int count = taikhoan.Count();
                if (count > 0)
                {
                    TaikhoansDAL.emailhientai = email;
                    if (TempData["ThanhToan"].ToString().Equals("dn")) 

                    {
                        return RedirectToAction("DangNhapThanhCong");
                        

                    }
                    if (TempData["ThanhToan"].ToString().Equals("tt")) 
                    {
                        return RedirectToAction("ThanhToan", "Ctgiohangs");
                      
                    }
                }

                else
                {
                    ModelState.AddModelError(String.Empty, "Sai tài khoản hoặc mật khẩu!");
                    return View();
                }
            }
            return View();
       
        }
      
        public IActionResult DangXuat()
        {
            TaikhoansDAL.DangXuat();
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
        public void EditPassword(string password)
        {
            string email = TaikhoansDAL.emailkpmatkhau;
            string query = "EXEC DoiMatKhau @email = '" + email + "'" + ",@password='" + password + "'";
            _context.Database.ExecuteSqlRaw(query);
            //var taikhoan = _context.Taikhoans.FromSqlRaw(query);
  
           
        }
        public bool CheckTaiKhoanTrung(string email)
        {
            string query = "EXEC CheckTaiKhoanTrung @email = " + email;
            var taikhoan = _context.Taikhoans.FromSqlRaw(query).ToList();
            if (taikhoan.Count() > 0)
            {
                return false;
            }
            else
            {
                return true;
            }
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
        public async Task<IActionResult> Create([Bind("Email,HoTen,MatKhau,DiaChi,Sdt,VaiTro")] Taikhoan taikhoan)
        {
            if (ModelState.IsValid)
            {
                _context.Add(taikhoan);
                TaikhoansDAL.emailhientai = taikhoan.Email;
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
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
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("Email,HoTen,MatKhau,DiaChi,Sdt,VaiTro")] Taikhoan taikhoan)
        {
            if (id != taikhoan.Email)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(taikhoan);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!TaikhoanExists(taikhoan.Email))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(taikhoan);
        }

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

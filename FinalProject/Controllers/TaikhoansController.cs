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
        public async Task<IActionResult> DoiMatKhau(string email)
        {
            var tk = _context.Taikhoans.SingleOrDefault(b => b.Email.Equals(email));
            return View(tk);
        }
        public IActionResult QuenMatKhau()
        {
            return View();
        }
        public IActionResult DangNhap(string email, string password, string loaidn)
        {
            if (!String.IsNullOrEmpty(loaidn))
                TempData["ThanhToan"] = loaidn;
            
            if (!String.IsNullOrEmpty(email) && !String.IsNullOrEmpty(password))
            {
               
               
                //Stored Procedure trong SQL
                string query = "EXEC DangNhap @email = '" + email + "', @password = '" + password +"'";
                var taikhoan = _context.Taikhoans.FromSqlRaw(query).ToList();

                int count = taikhoan.Count();
                if (count > 0)
                {
                    TaikhoansDAL.emailhientai = email;
                    var yt = _context.Yeuthiches.Where(b => b.Email.Equals("Test")).ToList();
                    //Add yêu thích đã yêu thích vào tài khoản
                    for (int i = 0; i < yt.Count; i++)
                    {
                        var ytnew = new Yeuthich()
                        {
                            Idsp = yt[i].Idsp,
                            Email = email,
                            Gia = yt[i].Gia,
                            ImagePath = yt[i].ImagePath,
                            Ten = yt[i].Ten
                        };
                        try
                        {
                            _context.Yeuthiches.Add(ytnew);
                            _context.SaveChanges();
                        }
                        catch
                        {

                        }
                    }
                    
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
            //Xóa yêu thích trong bảng tạm
            _context.Yeuthiches.RemoveRange(_context.Yeuthiches.Where(b => b.Email.Equals("Test")));
            _context.SaveChanges();
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
        public async Task<IActionResult> Create([Bind("Email,HoTen,DiaChi,Sdt,VaiTro")] Taikhoan taikhoan)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    _context.Add(taikhoan);
                    TaikhoansDAL.emailhientai = taikhoan.Email;
                    await _context.SaveChangesAsync();
                    return RedirectToAction(nameof(Index));
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

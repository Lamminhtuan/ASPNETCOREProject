using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using FinalProject.Models;
using System.Security.Claims;

namespace FinalProject.Controllers
{
    public class GiohangsController : Controller
    {
        private readonly ASPContext _context;

        public GiohangsController(ASPContext context)
        {
            _context = context;
        }
        public IActionResult ThankYou()
        {
            return View();
        }
        public IActionResult SuaGioHang(string idgh, string email, DateTime ngaymua, decimal tonggia, decimal giamgia, decimal tongphaitra)
        {
            var giohang = _context.Giohangs.FirstOrDefault(b => b.Idgh.Equals(idgh));
            giohang.Email = email;
            giohang.NgayMua = ngaymua;
            giohang.TongGia = tonggia;
            giohang.GiamGia = giamgia;
            giohang.TongPhaiTra = tongphaitra;
            _context.SaveChanges();
            return Redirect("Index");
        }
        public JsonResult DatHang(decimal giamgia, decimal tongphaitra)
        {
            if (giamgia == 0)
            {
                tongphaitra = CtgiohangsDAL.GetTongTien();
            }
            int count = _context.Giohangs.Count();
            string currentid;
            if (count < 10)
                currentid = "GH0" + count.ToString();
            else
                currentid = "GH" + count.ToString();
            var gh = _context.Giohangs.SingleOrDefault(b => b.Idgh.Equals(currentid));
            gh.TongPhaiTra = tongphaitra;
            gh.TongGia = CtgiohangsDAL.GetTongTien();
            gh.GiamGia = giamgia;
            gh.Email = @User.FindFirstValue(ClaimTypes.Email);
            gh.NgayMua = DateTime.Now;
            _context.SaveChanges();
            GiohangsDAL.DatHang();
            return Json(new
            {
                redirectToUrl = Url.Action("ThankYou", "Giohangs")
            });
        }


        // GET: Giohangs
        public async Task<IActionResult> Index()
        {
              return View(await _context.Giohangs.ToListAsync());
        }

        // GET: Giohangs/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null || _context.Giohangs == null)
            {
                return NotFound();
            }

            var giohang = await _context.Giohangs
                .FirstOrDefaultAsync(m => m.Idgh == id);
            if (giohang == null)
            {
                return NotFound();
            }

            return View(giohang);
        }

        // GET: Giohangs/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Giohangs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("TenTaiKhoan,Idgh,NgayMua,TongGia")] Giohang giohang)
        {
            if (ModelState.IsValid)
            {
                _context.Add(giohang);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(giohang);
        }

        // GET: Giohangs/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null || _context.Giohangs == null)
            {
                return NotFound();
            }

            var giohang = await _context.Giohangs.FindAsync(id);
            if (giohang == null)
            {
                return NotFound();
            }
            return View(giohang);
        }

        // POST: Giohangs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("TenTaiKhoan,Idgh,NgayMua,TongGia")] Giohang giohang)
        {
            if (id != giohang.Idgh)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(giohang);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!GiohangExists(giohang.Idgh))
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
            return View(giohang);
        }

        // GET: Giohangs/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null || _context.Giohangs == null)
            {
                return NotFound();
            }

            var giohang = await _context.Giohangs
                .FirstOrDefaultAsync(m => m.Idgh == id);
            if (giohang == null)
            {
                return NotFound();
            }

            return View(giohang);
        }

        // POST: Giohangs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            if (_context.Giohangs == null)
            {
                return Problem("Entity set 'ASPContext.Giohangs'  is null.");
            }
            var giohang = await _context.Giohangs.FindAsync(id);
            if (giohang != null)
            {
                _context.Giohangs.Remove(giohang);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool GiohangExists(string id)
        {
          return _context.Giohangs.Any(e => e.Idgh == id);
        }
    }
}

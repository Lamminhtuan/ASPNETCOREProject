using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using FinalProject.Models;
using System.Globalization;
using Microsoft.AspNetCore.Authorization;

namespace FinalProject.Controllers
{
    public class CtgiohangsController : Controller
    {
        private readonly ASPContext _context;
        public string UpdateSL(string idsp, int sl)
        {
            int count = _context.Giohangs.Count();
            string currentid;
            if (count < 10)
                currentid = "GH0" + count.ToString();
            else
                currentid = "GH" + count.ToString();
            var kq = _context.Ctgiohangs.SingleOrDefault(b => b.Idgh.Equals(currentid) && b.Idsp.Equals(idsp));
            kq.SoLuong = sl;
            decimal thanhtien = sl * kq.DonGia;
            kq.ThanhTien = thanhtien;
            _context.SaveChanges();
            return thanhtien.ToString("C", CultureInfo.CreateSpecificCulture("vi-VN"));
        }
        [Authorize]
        public async Task<IActionResult> ThanhToan()
        {
            int count = _context.Giohangs.Count();
            string currentid;
            if (count < 10)
                currentid = "GH0" + count.ToString();
            else
                currentid = "GH" + count.ToString();
            var kq = _context.Ctgiohangs.Where(b => b.Idgh.Equals(currentid));
            return View(kq.AsEnumerable());
        }
        public string ConvertToVND(decimal money)
        {
            return money.ToString("C", CultureInfo.CreateSpecificCulture("vi-VN"));
        }
        public string GetTongTien()
        {
            decimal result = 0;
            int count = _context.Giohangs.Count();
            string currentid;
            if (count < 10)
                currentid = "GH0" + count.ToString();
            else
                currentid = "GH" + count.ToString();
            var kq = _context.Ctgiohangs.Where(b => b.Idgh.Equals(currentid));
            foreach (var item in kq)
            {
                result += item.ThanhTien;
            }
            return result.ToString("C", CultureInfo.CreateSpecificCulture("vi-VN"));
        }

        public void XoaSanPhamKhoiGioHang(string idsp)
        {
            int count = _context.Giohangs.Count();
            string currentid;
            if (count < 10)
                currentid = "GH0" + count.ToString();
            else
                currentid = "GH" + count.ToString();
            var kq = _context.Ctgiohangs.SingleOrDefault(b => b.Idgh.Equals(currentid) && b.Idsp.Equals(idsp));
            _context.Ctgiohangs.Remove(kq);
            _context.SaveChanges();
        }
        public void TangSoLuong(string idgh, string idsp, int soluongtang)
        {
            var ctgh = _context.Ctgiohangs.SingleOrDefault(b => b.Idgh.Equals(idgh) && b.Idsp.Equals(idsp));
            int soluongmoi = ctgh.SoLuong + soluongtang;
            ctgh.SoLuong = soluongmoi;
            _context.SaveChangesAsync();
        }
        public void ThemVaoGioHang(string idgh, string idsp, string ten, string imagepath, decimal dongia, int soluong, decimal thanhtien)
        {
            var Ctgiohang = new Ctgiohang()
            {
                Idgh = idgh,
                Idsp = idsp,
                Ten = ten,
                ImagePath = imagepath,
                DonGia = dongia,
                SoLuong = soluong,
                ThanhTien = thanhtien
            };
            _context.Add(Ctgiohang);
            _context.SaveChanges();
        }
        public CtgiohangsController(ASPContext context)
        {
            _context = context;
        }

        // GET: Ctgiohangs
        public async Task<IActionResult> GioHang()
        {
            string idgh = GiohangsDAL.GetIDDH();
            var aSPContext = _context.Ctgiohangs.Include(c => c.IdghNavigation);
            var current = _context.Ctgiohangs.Where(b => b.Idgh.Equals(idgh));
            return View(await current.ToListAsync());
        }
     
        public async Task<IActionResult> Index(string idgh)
        {
            var aSPContext = _context.Ctgiohangs.Include(c => c.IdghNavigation);
            var current = _context.Ctgiohangs.Where(b => b.Idgh.Equals(idgh)); 
            return View(await current.ToListAsync());
        }

        // GET: Ctgiohangs/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null || _context.Ctgiohangs == null)
            {
                return NotFound();
            }

            var ctgiohang = await _context.Ctgiohangs
                .Include(c => c.IdghNavigation)
                .FirstOrDefaultAsync(m => m.Idgh == id);
            if (ctgiohang == null)
            {
                return NotFound();
            }

            return View(ctgiohang);
        }

        // GET: Ctgiohangs/Create
        public IActionResult Create()
        {
            ViewData["Idgh"] = new SelectList(_context.Giohangs, "Idgh", "Idgh");
            return View();
        }

        // POST: Ctgiohangs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Idgh,Idsp,ImagePath,DonGia,SoLuong,ThanhTien")] Ctgiohang ctgiohang)
        {
            if (ModelState.IsValid)
            {
                _context.Add(ctgiohang);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["Idgh"] = new SelectList(_context.Giohangs, "Idgh", "Idgh", ctgiohang.Idgh);
            return View(ctgiohang);
        }

        // GET: Ctgiohangs/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null || _context.Ctgiohangs == null)
            {
                return NotFound();
            }

            var ctgiohang = await _context.Ctgiohangs.FindAsync(id);
            if (ctgiohang == null)
            {
                return NotFound();
            }
            ViewData["Idgh"] = new SelectList(_context.Giohangs, "Idgh", "Idgh", ctgiohang.Idgh);
            return View(ctgiohang);
        }

        // POST: Ctgiohangs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("Idgh,Idsp,ImagePath,DonGia,SoLuong,ThanhTien")] Ctgiohang ctgiohang)
        {
            if (id != ctgiohang.Idgh)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(ctgiohang);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CtgiohangExists(ctgiohang.Idgh))
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
            ViewData["Idgh"] = new SelectList(_context.Giohangs, "Idgh", "Idgh", ctgiohang.Idgh);
            return View(ctgiohang);
        }

        // GET: Ctgiohangs/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null || _context.Ctgiohangs == null)
            {
                return NotFound();
            }

            var ctgiohang = await _context.Ctgiohangs
                .Include(c => c.IdghNavigation)
                .FirstOrDefaultAsync(m => m.Idgh == id);
            if (ctgiohang == null)
            {
                return NotFound();
            }

            return View(ctgiohang);
        }

        // POST: Ctgiohangs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            if (_context.Ctgiohangs == null)
            {
                return Problem("Entity set 'ASPContext.Ctgiohangs'  is null.");
            }
            var ctgiohang = await _context.Ctgiohangs.FindAsync(id);
            if (ctgiohang != null)
            {
                _context.Ctgiohangs.Remove(ctgiohang);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool CtgiohangExists(string id)
        {
          return _context.Ctgiohangs.Any(e => e.Idgh == id);
        }
    }
}

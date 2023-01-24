using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using FinalProject.Models;

namespace FinalProject.Controllers
{
    public class CtgiohangsController : Controller
    {
        private readonly ASPContext _context;

        public CtgiohangsController(ASPContext context)
        {
            _context = context;
        }
        public void CreateCT(int idsp, string imagepath, decimal dongia, int soluong, decimal thanhtien)
        {
            int idgh = GiohangsDAL.GetIDDH();
            var ctgiohang = new Ctgiohang()
            {
                Idgh = idgh,
                Idsp = idsp,
                ImagePath = imagepath,
                DonGia = dongia,
                SoLuong = soluong,
                ThanhTien = thanhtien
                
 
            };
            _context.Add(ctgiohang);
            _context.SaveChanges();
        }
        // GET: Ctgiohangs
        public async Task<IActionResult> Index()
        {
            var aSPContext = _context.Ctgiohangs.Include(c => c.IdghNavigation);
            return View(await aSPContext.ToListAsync());
        }

        // GET: Ctgiohangs/Details/5
        public async Task<IActionResult> Details(int? id)
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
        public async Task<IActionResult> Edit(int? id)
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
        public async Task<IActionResult> Edit(int id, [Bind("Idgh,Idsp,ImagePath,DonGia,SoLuong,ThanhTien")] Ctgiohang ctgiohang)
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
        public async Task<IActionResult> Delete(int? id)
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
        public async Task<IActionResult> DeleteConfirmed(int id)
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

        private bool CtgiohangExists(int id)
        {
          return _context.Ctgiohangs.Any(e => e.Idgh == id);
        }
    }
}

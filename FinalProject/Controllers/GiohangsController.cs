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
    public class GiohangsController : Controller
    {
        private readonly ASPContext _context;

        public GiohangsController(ASPContext context)
        {
            _context = context;
        }
        public void GetIDDH()
        {
            int count = _context.Giohangs.Count();
            ViewData["GetIDDH"] = count - 1;
        }

        // GET: Giohangs
        public async Task<IActionResult> Index()
        {
              return View(await _context.Giohangs.ToListAsync());
        }

        // GET: Giohangs/Details/5
        public async Task<IActionResult> Details(int? id)
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
        public async Task<IActionResult> Create([Bind("Idgh,NgayMua,TongGia")] Giohang giohang)
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
        public async Task<IActionResult> Edit(int? id)
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
        public async Task<IActionResult> Edit(int id, [Bind("Idgh,NgayMua,TongGia")] Giohang giohang)
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
        public async Task<IActionResult> Delete(int? id)
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
        public async Task<IActionResult> DeleteConfirmed(int id)
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

        private bool GiohangExists(int id)
        {
          return _context.Giohangs.Any(e => e.Idgh == id);
        }
    }
}

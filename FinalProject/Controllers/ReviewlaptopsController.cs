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
    public class ReviewlaptopsController : Controller
    {
        private readonly ASPContext _context;

        public ReviewlaptopsController(ASPContext context)
        {
            _context = context;
        }
        public IActionResult DanhGia(string idgh, string idsp, int sao, string binhluan)
        {
            var rvp = new Reviewlaptop()
            {
                Idgh = idgh,
                Idsp = idsp,
                Sao = sao,
                BinhLuan = binhluan
            };
            _context.Reviewlaptops.Add(rvp);
            //Save review rồi tính sao trung bình
            _context.SaveChanges();
            var sp = _context.Laptops.SingleOrDefault(b => b.Id.Equals(idsp));
            sp.SaoTrungBinh = ReviewsDAL.TinhSaoTrungBinh(idsp);
            _context.SaveChanges();
            return RedirectToAction("GetCTGiohangsAndReview", "Ctgiohangs", new { idgh = idgh });
        }

        // GET: Reviewlaptops
        public async Task<IActionResult> Index()
        {
            var aSPContext = _context.Reviewlaptops.Include(r => r.IdghNavigation).Include(r => r.IdspNavigation);
            return View(await aSPContext.ToListAsync());
        }

        // GET: Reviewlaptops/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null || _context.Reviewlaptops == null)
            {
                return NotFound();
            }

            var reviewlaptop = await _context.Reviewlaptops
                .Include(r => r.IdghNavigation)
                .Include(r => r.IdspNavigation)
                .FirstOrDefaultAsync(m => m.Idgh == id);
            if (reviewlaptop == null)
            {
                return NotFound();
            }

            return View(reviewlaptop);
        }

        // GET: Reviewlaptops/Create
        public IActionResult Create()
        {
            ViewData["Idgh"] = new SelectList(_context.Giohangs, "Idgh", "Idgh");
            ViewData["Idsp"] = new SelectList(_context.Laptops, "Id", "Id");
            return View();
        }

        // POST: Reviewlaptops/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Idgh,Idsp,Sao,BinhLuan")] Reviewlaptop reviewlaptop)
        {
            if (ModelState.IsValid)
            {
                _context.Add(reviewlaptop);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["Idgh"] = new SelectList(_context.Giohangs, "Idgh", "Idgh", reviewlaptop.Idgh);
            ViewData["Idsp"] = new SelectList(_context.Laptops, "Id", "Id", reviewlaptop.Idsp);
            return View(reviewlaptop);
        }

        // GET: Reviewlaptops/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null || _context.Reviewlaptops == null)
            {
                return NotFound();
            }

            var reviewlaptop = await _context.Reviewlaptops.FindAsync(id);
            if (reviewlaptop == null)
            {
                return NotFound();
            }
            ViewData["Idgh"] = new SelectList(_context.Giohangs, "Idgh", "Idgh", reviewlaptop.Idgh);
            ViewData["Idsp"] = new SelectList(_context.Laptops, "Id", "Id", reviewlaptop.Idsp);
            return View(reviewlaptop);
        }

        // POST: Reviewlaptops/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("Idgh,Idsp,Sao,BinhLuan")] Reviewlaptop reviewlaptop)
        {
            if (id != reviewlaptop.Idgh)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(reviewlaptop);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ReviewlaptopExists(reviewlaptop.Idgh))
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
            ViewData["Idgh"] = new SelectList(_context.Giohangs, "Idgh", "Idgh", reviewlaptop.Idgh);
            ViewData["Idsp"] = new SelectList(_context.Laptops, "Id", "Id", reviewlaptop.Idsp);
            return View(reviewlaptop);
        }

        // GET: Reviewlaptops/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null || _context.Reviewlaptops == null)
            {
                return NotFound();
            }

            var reviewlaptop = await _context.Reviewlaptops
                .Include(r => r.IdghNavigation)
                .Include(r => r.IdspNavigation)
                .FirstOrDefaultAsync(m => m.Idgh == id);
            if (reviewlaptop == null)
            {
                return NotFound();
            }

            return View(reviewlaptop);
        }

        // POST: Reviewlaptops/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            if (_context.Reviewlaptops == null)
            {
                return Problem("Entity set 'ASPContext.Reviewlaptops'  is null.");
            }
            var reviewlaptop = await _context.Reviewlaptops.FindAsync(id);
            if (reviewlaptop != null)
            {
                _context.Reviewlaptops.Remove(reviewlaptop);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ReviewlaptopExists(string id)
        {
          return _context.Reviewlaptops.Any(e => e.Idgh == id);
        }
    }
}

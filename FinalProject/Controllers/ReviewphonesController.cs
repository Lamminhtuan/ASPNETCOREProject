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
    public class ReviewphonesController : Controller
    {
        private readonly ASPContext _context;

        public ReviewphonesController(ASPContext context)
        {
            _context = context;
        }

        // GET: Reviewphones
        public IActionResult DanhGia(string idgh, string idsp, int sao, string binhluan)
        {
            var rvp = new Reviewphone()
            {
                Idgh = idgh,
                Idsp = idsp,
                Sao = sao,
                BinhLuan = binhluan
            };

            _context.Reviewphones.Add(rvp);
            //Save review rồi tính sao
            _context.SaveChanges();
            var sp = _context.Phones.SingleOrDefault(b => b.Id.Equals(idsp));
            sp.SaoTrungBinh = ReviewsDAL.TinhSaoTrungBinh(idsp);
            _context.SaveChanges();
            return RedirectToAction("GetCTGiohangsAndReview", "Ctgiohangs", new {idgh=idgh});
        }
        public async Task<IActionResult> Index()
        {
            var aSPContext = _context.Reviewphones.Include(r => r.IdghNavigation).Include(r => r.IdspNavigation);
            return View(await aSPContext.ToListAsync());
        }

        // GET: Reviewphones/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null || _context.Reviewphones == null)
            {
                return NotFound();
            }

            var reviewphone = await _context.Reviewphones
                .Include(r => r.IdghNavigation)
                .Include(r => r.IdspNavigation)
                .FirstOrDefaultAsync(m => m.Idgh == id);
            if (reviewphone == null)
            {
                return NotFound();
            }

            return View(reviewphone);
        }

        // GET: Reviewphones/Create
        public IActionResult Create()
        {
            ViewData["Idgh"] = new SelectList(_context.Giohangs, "Idgh", "Idgh");
            ViewData["Idsp"] = new SelectList(_context.Phones, "Id", "Id");
            return View();
        }

        // POST: Reviewphones/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Idgh,Idsp,Sao,DanhGia,DaDanhGia")] Reviewphone reviewphone)
        {
            if (ModelState.IsValid)
            {
                _context.Add(reviewphone);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["Idgh"] = new SelectList(_context.Giohangs, "Idgh", "Idgh", reviewphone.Idgh);
            ViewData["Idsp"] = new SelectList(_context.Phones, "Id", "Id", reviewphone.Idsp);
            return View(reviewphone);
        }

        // GET: Reviewphones/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null || _context.Reviewphones == null)
            {
                return NotFound();
            }

            var reviewphone = await _context.Reviewphones.FindAsync(id);
            if (reviewphone == null)
            {
                return NotFound();
            }
            ViewData["Idgh"] = new SelectList(_context.Giohangs, "Idgh", "Idgh", reviewphone.Idgh);
            ViewData["Idsp"] = new SelectList(_context.Phones, "Id", "Id", reviewphone.Idsp);
            return View(reviewphone);
        }

        // POST: Reviewphones/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("Idgh,Idsp,Sao,DanhGia,DaDanhGia")] Reviewphone reviewphone)
        {
            if (id != reviewphone.Idgh)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(reviewphone);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ReviewphoneExists(reviewphone.Idgh))
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
            ViewData["Idgh"] = new SelectList(_context.Giohangs, "Idgh", "Idgh", reviewphone.Idgh);
            ViewData["Idsp"] = new SelectList(_context.Phones, "Id", "Id", reviewphone.Idsp);
            return View(reviewphone);
        }

        // GET: Reviewphones/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null || _context.Reviewphones == null)
            {
                return NotFound();
            }

            var reviewphone = await _context.Reviewphones
                .Include(r => r.IdghNavigation)
                .Include(r => r.IdspNavigation)
                .FirstOrDefaultAsync(m => m.Idgh == id);
            if (reviewphone == null)
            {
                return NotFound();
            }

            return View(reviewphone);
        }

        // POST: Reviewphones/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            if (_context.Reviewphones == null)
            {
                return Problem("Entity set 'ASPContext.Reviewphones'  is null.");
            }
            var reviewphone = await _context.Reviewphones.FindAsync(id);
            if (reviewphone != null)
            {
                _context.Reviewphones.Remove(reviewphone);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ReviewphoneExists(string id)
        {
          return _context.Reviewphones.Any(e => e.Idgh == id);
        }
    }
}

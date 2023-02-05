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
    public class YeuthichesController : Controller
    {
        private readonly ASPContext _context;

        public YeuthichesController(ASPContext context)
        {
            _context = context;
        }
        public void XoaKhoiYeuThich(string email, string idsp)
        {
           
            _context.Yeuthiches.Remove(_context.Yeuthiches.SingleOrDefault(b => b.Email.Equals(email) && b.Idsp.Equals(idsp)));
            _context.SaveChanges();
        }
        public void ThemVaoYeuThich(string email, string idsp, string ten, decimal gia, string imagepath)
        {
            if (String.IsNullOrEmpty(email))
                email = "Test";
            var Yeuthich = new Yeuthich()
            {
                Email = email,
                Idsp = idsp,
                Ten = ten,
                Gia = gia,
                ImagePath = imagepath
            };

            _context.Yeuthiches.Add(Yeuthich);

            _context.SaveChanges();
        }
        // GET: Yeuthiches

        public async Task<IActionResult> Index(string email)
        {
            if (String.IsNullOrEmpty(email))
                email = "Test";
            //var aSPContext = _context.Yeuthiches.Include(y => y.EmailNavigation);
            var yeuthich = _context.Yeuthiches.Where(b => b.Email.Equals(email));
            return View(await yeuthich.ToListAsync());
        }

        // GET: Yeuthiches/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null || _context.Yeuthiches == null)
            {
                return NotFound();
            }

            var yeuthich = await _context.Yeuthiches
                .Include(y => y.EmailNavigation)
                .FirstOrDefaultAsync(m => m.Email == id);
            if (yeuthich == null)
            {
                return NotFound();
            }

            return View(yeuthich);
        }

        // GET: Yeuthiches/Create
        public IActionResult Create()
        {
            ViewData["Email"] = new SelectList(_context.Taikhoans, "Email", "Email");
            return View();
        }

        // POST: Yeuthiches/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Email,Idsp,Ten,Gia,ImagePath")] Yeuthich yeuthich)
        {
            if (ModelState.IsValid)
            {
                _context.Add(yeuthich);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["Email"] = new SelectList(_context.Taikhoans, "Email", "Email", yeuthich.Email);
            return View(yeuthich);
        }

        // GET: Yeuthiches/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null || _context.Yeuthiches == null)
            {
                return NotFound();
            }

            var yeuthich = await _context.Yeuthiches.FindAsync(id);
            if (yeuthich == null)
            {
                return NotFound();
            }
            ViewData["Email"] = new SelectList(_context.Taikhoans, "Email", "Email", yeuthich.Email);
            return View(yeuthich);
        }

        // POST: Yeuthiches/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("Email,Idsp,Ten,Gia,ImagePath")] Yeuthich yeuthich)
        {
            if (id != yeuthich.Email)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(yeuthich);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!YeuthichExists(yeuthich.Email))
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
            ViewData["Email"] = new SelectList(_context.Taikhoans, "Email", "Email", yeuthich.Email);
            return View(yeuthich);
        }

        // GET: Yeuthiches/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null || _context.Yeuthiches == null)
            {
                return NotFound();
            }

            var yeuthich = await _context.Yeuthiches
                .Include(y => y.EmailNavigation)
                .FirstOrDefaultAsync(m => m.Email == id);
            if (yeuthich == null)
            {
                return NotFound();
            }

            return View(yeuthich);
        }

        // POST: Yeuthiches/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            if (_context.Yeuthiches == null)
            {
                return Problem("Entity set 'ASPContext.Yeuthiches'  is null.");
            }
            var yeuthich = await _context.Yeuthiches.FindAsync(id);
            if (yeuthich != null)
            {
                _context.Yeuthiches.Remove(yeuthich);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool YeuthichExists(string id)
        {
            return _context.Yeuthiches.Any(e => e.Email == id);
        }
    }
}

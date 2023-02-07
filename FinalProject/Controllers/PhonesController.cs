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
    public class PhonesController : Controller
    {
        private readonly ASPContext _context;

        public PhonesController(ASPContext context)
        {
            _context = context;
        }

        // GET: Phones
        public async Task<IActionResult> Index(string sortOrder, string searchString, string Hang, string Nhucau, string Giamin, string Giamax, string Loai, string Ram, string Rom)
        {
            TempData["PriceASC"] = "PriceASC";
            TempData["PriceDESC"] = "PriceDESC";
            TempData["CurrentFilter"] = searchString;
            TempData["Hang"] = Hang;
            TempData["NhuCau"] = Nhucau;
            TempData["GiaMin"] = Giamin;
            TempData["GiaMax"] = Giamax;
            TempData["Loai"] = Loai;
            TempData["RAM"] = Ram;
            TempData["ROM"] = Rom;
            TempData.Keep();
            ////Tìm kiếm 
            var phones = from b in _context.Phones
                         select b;

            if (!String.IsNullOrEmpty(searchString))
            {
                phones = phones.Where(b => b.Ten.Contains(searchString) || b.Hang.Contains(searchString));
            }
            if (!String.IsNullOrEmpty(Hang))
            {
                phones = phones.Where(b => b.Hang.Contains(Hang));
            }
            if (!String.IsNullOrEmpty(Nhucau))
            {
                phones = phones.Where(b => b.NhuCau.Contains(Nhucau));
            }
            if (!String.IsNullOrEmpty(Giamin) && !String.IsNullOrEmpty(Giamax))
            {
                phones = phones.Where(b => b.Gia >= Convert.ToDecimal(Giamin) && b.Gia <= Convert.ToDecimal(Giamax));
            }
            if (!String.IsNullOrEmpty(Loai))
            {
                phones = phones.Where(b => b.Os.Contains(Loai));
            }
            if (!String.IsNullOrEmpty(Ram))
            {
                phones = phones.Where(b => b.Ram == Convert.ToUInt16(Ram));
            }
            if (!String.IsNullOrEmpty(Rom))
            {
                phones = phones.Where(b => b.Rom == Convert.ToUInt16(Rom));
            }
            switch (sortOrder)
            {
                case "PriceDESC":
                    phones = phones.OrderByDescending(b => b.Gia);
                    break;
                case "PriceASC":
                    phones = phones.OrderBy(b => b.Gia);
                    break;

            }



            return View(await phones.AsNoTracking().ToListAsync());
        }

        // GET: Phones/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null || _context.Phones == null)
            {
                return NotFound();
            }

            var phone = await _context.Phones
                .FirstOrDefaultAsync(m => m.Id == id);
            if (phone == null)
            {
                return NotFound();
            }

            return View(phone);
        }

        // GET: Phones/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Phones/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Ten,Hang,Gia,ManHinh,Os,CameraSau,CameraTruoc,NhuCau,Chip,Ram,Rom,Pin,ThietKe,ImagePath")] Phone phone)
        {
            if (ModelState.IsValid)
            {
                _context.Add(phone);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(phone);
        }

        // GET: Phones/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null || _context.Phones == null)
            {
                return NotFound();
            }

            var phone = await _context.Phones.FindAsync(id);
            if (phone == null)
            {
                return NotFound();
            }
            return View(phone);
        }

        // POST: Phones/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("Id,Ten,Hang,Gia,ManHinh,Os,CameraSau,CameraTruoc,NhuCau,Chip,Ram,Rom,Pin,ThietKe,ImagePath")] Phone phone)
        {
            if (id != phone.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(phone);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!PhoneExists(phone.Id))
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
            return View(phone);
        }

        // GET: Phones/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null || _context.Phones == null)
            {
                return NotFound();
            }

            var phone = await _context.Phones
                .FirstOrDefaultAsync(m => m.Id == id);
            if (phone == null)
            {
                return NotFound();
            }

            return View(phone);
        }

        // POST: Phones/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            if (_context.Phones == null)
            {
                return Problem("Entity set 'ASPContext.Phones'  is null.");
            }
            var phone = await _context.Phones.FindAsync(id);
            if (phone != null)
            {
                _context.Phones.Remove(phone);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool PhoneExists(string id)
        {
          return _context.Phones.Any(e => e.Id == id);
        }
    }
}

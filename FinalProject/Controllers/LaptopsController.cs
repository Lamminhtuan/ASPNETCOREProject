using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using FinalProject.Models;
using Org.BouncyCastle.Bcpg.OpenPgp;
using Microsoft.AspNetCore.Authorization;

namespace FinalProject.Controllers
{
    public class LaptopsController : Controller
    {
        private readonly ASPContext _context;

        public LaptopsController(ASPContext context)
        {
            _context = context;
        }

        // GET: Laptops
        public async Task<IActionResult> Index(string sortOrder, string searchString, string Hang, string NhuCau, string Giamin, string Giamax, string Loai, string Ram, string Rom, string ManHinh, string Os, string Webcam, string Chip, string Vga, string Pin)
        {
            TempData["PriceASC"] = "PriceASC";
            TempData["PriceDESC"] = "PriceDESC";
            TempData["CurrentFilter"] = searchString;
            TempData["Hang"] = Hang;
            TempData["NhuCau"] = NhuCau;
            TempData["GiaMin"] = Giamin;
            TempData["GiaMax"] = Giamax; TempData["Loai"] = Loai;
            TempData["RAM"] = Ram;
            TempData["ROM"] = Rom;
            TempData["ManHinh"] = ManHinh;
            TempData["Os"] = Os;
            TempData["Chip"] = Chip;
            TempData["Vga"] = Vga;
            TempData["Pin"] = Pin;
            TempData.Keep();
            ////Tìm kiếm 
            var laptops = from b in _context.Laptops
                          select b;

            if (!String.IsNullOrEmpty(searchString))
            {
                laptops = laptops.Where(b => b.Ten.Contains(searchString) || b.Hang.Contains(searchString));
            }
            if (!String.IsNullOrEmpty(Hang))
            {
                laptops = laptops.Where(b => b.Hang.Contains(Hang));
            }
            if (!String.IsNullOrEmpty(NhuCau))
            {
                laptops = laptops.Where(b => b.NhuCau.Contains(NhuCau));
            }
            if (!String.IsNullOrEmpty(Giamin) && !String.IsNullOrEmpty(Giamax))
            {
                laptops = laptops.Where(b => b.Gia >= Convert.ToDecimal(Giamin) && b.Gia <= Convert.ToDecimal(Giamax));
            }
            if (!String.IsNullOrEmpty(Loai))
            {
                laptops = laptops.Where(b => b.Os.Contains(Loai));
            }
            if (!String.IsNullOrEmpty(Ram))
            {
                laptops = laptops.Where(b => b.Ram == Convert.ToUInt16(Ram));
            }
            if (!String.IsNullOrEmpty(Rom))
            {
                laptops = laptops.Where(b => b.Rom == Convert.ToUInt16(Rom));
            }
            if (!String.IsNullOrEmpty(Chip))
            {
                laptops = laptops.Where(b => b.Chip.Contains(Chip));
            }
            if (!String.IsNullOrEmpty(Vga))
            {
                laptops = laptops.Where(b => b.Vga.Contains(Vga));
            }
            switch (sortOrder)
            {
                case "PriceDESC":
                    laptops = laptops.OrderByDescending(b => b.Gia);
                    break;
                case "PriceASC":
                    laptops = laptops.OrderBy(b => b.Gia);
                    break;

            }



            return View(await laptops.AsNoTracking().ToListAsync());
        }
        public void ThemLaptop(string id, string ten, string hang, decimal gia, string manhinh, string os, string webcam, string nhucau, string chip, string vga, int ram, int rom, string pin, double khoiluong, string cgt, string thietke, string imagepath)
        {
            var laptop = new Laptop()
            {
                Id = id,
                Ten = ten,
                Hang = hang,
                Gia = gia,
                Os = os,
                NhuCau = nhucau,
                Webcam = webcam,
                Chip = chip,
                ManHinh = manhinh,
                Vga = vga,
                Ram = ram,
                Rom = rom,
                Pin = pin,
                KhoiLuong  = khoiluong,
                CongGiaoTiep = cgt,
                ThietKe= thietke,   
                ImagePath = imagepath,
                SaoTrungBinh = 0
            };
            _context.Laptops.Add(laptop);
            _context.SaveChanges();
        }
		public void SuaLaptop(string id, string ten, string hang, decimal gia, string manhinh, string os, string webcam, string nhucau, string chip, string vga, int ram, int rom, string pin, double khoiluong, string cgt, string thietke, string imagepath)
		{
            var laptop = _context.Laptops.SingleOrDefault(b => b.Id.Equals(id));
            laptop.Ten = ten;
			laptop.Hang = hang;
            laptop.Gia = gia;
            laptop.Os = os;
            laptop.NhuCau = nhucau;
            laptop.Webcam = webcam;
            laptop.Chip = chip;
            laptop.ManHinh = manhinh;
            laptop.Vga = vga;
            laptop.Ram = ram;
            laptop.Rom = rom;
            laptop.Pin = pin;
            laptop.KhoiLuong = khoiluong;
            laptop.CongGiaoTiep = cgt;
            laptop.ThietKe = thietke;
            laptop.ImagePath = imagepath;
			
	
			_context.SaveChanges();
		}
		public void XoaLaptop(string idlt)
        {
            var kq = _context.Laptops.SingleOrDefault(b => b.Id.Equals(idlt));
            _context.Laptops.Remove(kq);
            _context.SaveChanges();
        }

        // GET: Laptops/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null || _context.Laptops == null)
            {
                return NotFound();
            }

            var laptop = await _context.Laptops
                .FirstOrDefaultAsync(m => m.Id == id);
            if (laptop == null)
            {
                return NotFound();
            }

            return View(laptop);
        }

        // GET: Laptops/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Laptops/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Ten,Hang,Gia,ManHinh,Os,Webcam,NhuCau,Chip,Vga,Ram,Rom,Pin,KhoiLuong,CongGiaoTiep,ThietKe,ImagePath")] Laptop laptop)
        {
            if (ModelState.IsValid)
            {
                _context.Add(laptop);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(laptop);
        }
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Chitiet(string searchstring)
        {
            
            var laptops = from b in _context.Laptops
                          select b;
            if (!String.IsNullOrEmpty(searchstring))
            {
                laptops = laptops.Where(b => b.Ten.Contains(searchstring) || b.Hang.Contains(searchstring));
            }
    
            return View(await laptops.ToListAsync());
        }
        // GET: Laptops/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null || _context.Laptops == null)
            {
                return NotFound();
            }

            var laptop = await _context.Laptops.FindAsync(id);
            if (laptop == null)
            {
                return NotFound();
            }
            return View(laptop);
        }

        // POST: Laptops/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("Id,Ten,Hang,Gia,ManHinh,Os,Webcam,NhuCau,Chip,Vga,Ram,Rom,Pin,KhoiLuong,CongGiaoTiep,ThietKe,ImagePath")] Laptop laptop)
        {
            if (id != laptop.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(laptop);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!LaptopExists(laptop.Id))
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
            return View(laptop);
        }

        // GET: Laptops/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null || _context.Laptops == null)
            {
                return NotFound();
            }

            var laptop = await _context.Laptops
                .FirstOrDefaultAsync(m => m.Id == id);
            if (laptop == null)
            {
                return NotFound();
            }

            return View(laptop);
        }

        // POST: Laptops/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            if (_context.Laptops == null)
            {
                return Problem("Entity set 'ASPContext.Laptops'  is null.");
            }
            var laptop = await _context.Laptops.FindAsync(id);
            if (laptop != null)
            {
                _context.Laptops.Remove(laptop);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool LaptopExists(string id)
        {
          return _context.Laptops.Any(e => e.Id == id);
        }
    }
}

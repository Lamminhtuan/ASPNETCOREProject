using System;
using System.Collections.Generic;

namespace FinalProject.Models
{
    public partial class Ctgiohang
    {
        public string Idgh { get; set; } = null!;
        public string Idsp { get; set; } = null!;
        public string Ten { get; set; } = null!;
        public string ImagePath { get; set; } = null!;
        public decimal DonGia { get; set; }
        public int SoLuong { get; set; }
        public decimal ThanhTien { get; set; }

        public virtual Giohang IdghNavigation { get; set; } = null!;
    }
}

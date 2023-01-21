using System;
using System.Collections.Generic;

namespace FinalProject.Models
{
    public partial class Ctgiohang
    {
        public int Idgh { get; set; }
        public int Idsp { get; set; }
        public string ImagePath { get; set; } = null!;
        public decimal DonGia { get; set; }
        public int SoLuong { get; set; }

        public virtual Giohang IdghNavigation { get; set; } = null!;
    }
}

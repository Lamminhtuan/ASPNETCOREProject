using System;
using System.Collections.Generic;

namespace FinalProject.Models
{
    public partial class Laptop
    {
        public string Id { get; set; } = null!;
        public string Ten { get; set; } = null!;
        public string Hang { get; set; } = null!;
        public decimal Gia { get; set; }
        public string ManHinh { get; set; } = null!;
        public string Os { get; set; } = null!;
        public string Webcam { get; set; } = null!;
        public string NhuCau { get; set; } = null!;
        public string Chip { get; set; } = null!;
        public string Vga { get; set; } = null!;
        public int Ram { get; set; }
        public int Rom { get; set; }
        public string Pin { get; set; } = null!;
        public double KhoiLuong { get; set; }
        public string CongGiaoTiep { get; set; } = null!;
        public string ThietKe { get; set; } = null!;
        public string ImagePath { get; set; } = null!;
    }
}

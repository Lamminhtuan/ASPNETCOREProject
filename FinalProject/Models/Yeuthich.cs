using System;
using System.Collections.Generic;

namespace FinalProject.Models
{
    public partial class Yeuthich
    {
        public string Email { get; set; } = null!;
        public string Idsp { get; set; } = null!;
        public string Ten { get; set; } = null!;
        public decimal Gia { get; set; }
        public string ImagePath { get; set; } = null!;

        public virtual Taikhoan EmailNavigation { get; set; } = null!;
    }
}

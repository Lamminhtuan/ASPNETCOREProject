using System;
using System.Collections.Generic;

namespace FinalProject.Models
{
    public partial class Giohang
    {
        public Giohang()
        {
            Ctgiohangs = new HashSet<Ctgiohang>();
            Reviewlaptops = new HashSet<Reviewlaptop>();
            Reviewphones = new HashSet<Reviewphone>();
        }

        public string Email { get; set; } = null!;
        public string Idgh { get; set; } = null!;
        public DateTime NgayMua { get; set; }
        public decimal TongGia { get; set; }
        public decimal GiamGia { get; set; }
        public decimal TongPhaiTra { get; set; }

        public virtual ICollection<Ctgiohang> Ctgiohangs { get; set; }
        public virtual ICollection<Reviewlaptop> Reviewlaptops { get; set; }
        public virtual ICollection<Reviewphone> Reviewphones { get; set; }
    }
}

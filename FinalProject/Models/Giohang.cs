using System;
using System.Collections.Generic;

namespace FinalProject.Models
{
    public partial class Giohang
    {
        public Giohang()
        {
            Ctgiohangs = new HashSet<Ctgiohang>();
        }

        public int Idgh { get; set; }
        public DateTime NgayMua { get; set; }
        public decimal? TongGia { get; set; }

        public virtual ICollection<Ctgiohang> Ctgiohangs { get; set; }
    }
}

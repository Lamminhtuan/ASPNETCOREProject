using System;
using System.Collections.Generic;

namespace FinalProject.Models
{
    public partial class Reviewlaptop
    {
        public string Idgh { get; set; } = null!;
        public string Idsp { get; set; } = null!;
        public int Sao { get; set; }
        public string BinhLuan { get; set; } = null!;

        public virtual Giohang IdghNavigation { get; set; } = null!;
        public virtual Laptop IdspNavigation { get; set; } = null!;
    }
}

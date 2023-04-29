using System;
using System.Collections.Generic;

namespace FinalProject.Models
{
    public partial class Taikhoan
    {
        public Taikhoan()
        {
            Yeuthiches = new HashSet<Yeuthich>();
        }

        public string Email { get; set; } = null!;
        public string HoTen { get; set; } = null!;
        public string MatKhau { get; set; } = null!;
        public string DiaChi { get; set; } = null!;
        public string Sdt { get; set; } = null!;
        public string VaiTro { get; set; } = null!;

        public virtual ICollection<Yeuthich> Yeuthiches { get; set; }
    }
}

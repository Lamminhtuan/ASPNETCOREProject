﻿using System;
using System.Collections.Generic;

namespace FinalProject.Models
{
    public partial class Phone
    {
        public Phone()
        {
            Reviewphones = new HashSet<Reviewphone>();
        }

        public string Id { get; set; } = null!;
        public string Ten { get; set; } = null!;
        public string Hang { get; set; } = null!;
        public decimal Gia { get; set; }
        public string ManHinh { get; set; } = null!;
        public string Os { get; set; } = null!;
        public string CameraSau { get; set; } = null!;
        public string CameraTruoc { get; set; } = null!;
        public string NhuCau { get; set; } = null!;
        public string Chip { get; set; } = null!;
        public double Ram { get; set; }
        public double Rom { get; set; }
        public string Pin { get; set; } = null!;
        public string ThietKe { get; set; } = null!;
        public string ImagePath { get; set; } = null!;
        public double SaoTrungBinh { get; set; }

        public virtual ICollection<Reviewphone> Reviewphones { get; set; }
    }
}

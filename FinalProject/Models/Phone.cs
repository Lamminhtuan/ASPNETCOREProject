using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace FinalProject.Models
{
    [Table("PHONES")]
    public partial class Phone
    {
        [Key]
        [Column("ID")]
        public int Id { get; set; }
        [StringLength(250)]
        public string Ten { get; set; } = null!;
        [StringLength(250)]
        public string Hang { get; set; } = null!;
        [Column(TypeName = "decimal(18, 2)")]
        public decimal Gia { get; set; }
        [StringLength(250)]
        public string ManHinh { get; set; } = null!;
        [Column("OS")]
        [StringLength(250)]
        public string Os { get; set; } = null!;
        [StringLength(250)]
        public string CameraSau { get; set; } = null!;
        [StringLength(250)]
        public string CameraTruoc { get; set; } = null!;
        [StringLength(250)]
        public string Chip { get; set; } = null!;
        public int Ram { get; set; }
        public int Rom { get; set; }
        [StringLength(250)]
        public string Pin { get; set; } = null!;
        [StringLength(550)]
        public string ImagePath { get; set; } = null!;
    }
}

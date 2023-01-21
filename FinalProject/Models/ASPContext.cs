using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace FinalProject.Models
{
    public partial class ASPContext : DbContext
    {
        public ASPContext()
        {
        }

        public ASPContext(DbContextOptions<ASPContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Ctgiohang> Ctgiohangs { get; set; } = null!;
        public virtual DbSet<Giohang> Giohangs { get; set; } = null!;
        public virtual DbSet<Laptop> Laptops { get; set; } = null!;
        public virtual DbSet<Phone> Phones { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Data Source=DESKTOP-TNPKD3S\\SQLEXPRESS;Initial Catalog=ASP;Integrated Security=True");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Ctgiohang>(entity =>
            {
                entity.HasKey(e => new { e.Idgh, e.Idsp })
                    .HasName("PK__CTGIOHAN__F3FA22084AE69E73");

                entity.ToTable("CTGIOHANG");

                entity.Property(e => e.Idgh).HasColumnName("IDGH");

                entity.Property(e => e.Idsp).HasColumnName("IDSP");

                entity.Property(e => e.DonGia).HasColumnType("decimal(18, 0)");

                entity.Property(e => e.ImagePath).HasMaxLength(550);

                entity.HasOne(d => d.IdghNavigation)
                    .WithMany(p => p.Ctgiohangs)
                    .HasForeignKey(d => d.Idgh)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__CTGIOHANG__IDGH__1F98B2C1");
            });

            modelBuilder.Entity<Giohang>(entity =>
            {
                entity.HasKey(e => e.Idgh)
                    .HasName("PK__GIOHANG__B87DE222369C3A9D");

                entity.ToTable("GIOHANG");

                entity.Property(e => e.Idgh)
                    .ValueGeneratedNever()
                    .HasColumnName("IDGH");

                entity.Property(e => e.NgayMua).HasColumnType("date");

                entity.Property(e => e.TongGia).HasColumnType("decimal(18, 0)");
            });

            modelBuilder.Entity<Laptop>(entity =>
            {
                entity.ToTable("LAPTOPS");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");

                entity.Property(e => e.Chip).HasMaxLength(250);

                entity.Property(e => e.CongGiaoTiep).HasMaxLength(250);

                entity.Property(e => e.Gia).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.Hang).HasMaxLength(250);

                entity.Property(e => e.ImagePath).HasMaxLength(550);

                entity.Property(e => e.ManHinh).HasMaxLength(250);

                entity.Property(e => e.NhuCau).HasMaxLength(250);

                entity.Property(e => e.Os)
                    .HasMaxLength(250)
                    .HasColumnName("OS");

                entity.Property(e => e.Pin).HasMaxLength(250);

                entity.Property(e => e.Ten).HasMaxLength(250);

                entity.Property(e => e.ThietKe).HasMaxLength(250);

                entity.Property(e => e.Vga)
                    .HasMaxLength(250)
                    .HasColumnName("VGA");

                entity.Property(e => e.Webcam).HasMaxLength(250);
            });

            modelBuilder.Entity<Phone>(entity =>
            {
                entity.ToTable("PHONES");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");

                entity.Property(e => e.CameraSau).HasMaxLength(250);

                entity.Property(e => e.CameraTruoc).HasMaxLength(250);

                entity.Property(e => e.Chip).HasMaxLength(250);

                entity.Property(e => e.Gia).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.Hang).HasMaxLength(250);

                entity.Property(e => e.ImagePath).HasMaxLength(550);

                entity.Property(e => e.ManHinh).HasMaxLength(250);

                entity.Property(e => e.NhuCau).HasMaxLength(250);

                entity.Property(e => e.Os)
                    .HasMaxLength(250)
                    .HasColumnName("OS");

                entity.Property(e => e.Pin).HasMaxLength(250);

                entity.Property(e => e.Ten).HasMaxLength(250);

                entity.Property(e => e.ThietKe).HasMaxLength(250);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}

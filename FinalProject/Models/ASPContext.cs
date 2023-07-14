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
        public virtual DbSet<Reviewlaptop> Reviewlaptops { get; set; } = null!;
        public virtual DbSet<Reviewphone> Reviewphones { get; set; } = null!;
        public virtual DbSet<Taikhoan> Taikhoans { get; set; } = null!;
        public virtual DbSet<Voucher> Vouchers { get; set; } = null!;
        public virtual DbSet<Yeuthich> Yeuthiches { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Copy connection string vào đây");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Ctgiohang>(entity =>
            {
                entity.HasKey(e => new { e.Idgh, e.Idsp })
                    .HasName("PK__CTGIOHAN__F3FA22085D83D60E");

                entity.ToTable("CTGIOHANG");

                entity.Property(e => e.Idgh)
                    .HasMaxLength(5)
                    .HasColumnName("IDGH");

                entity.Property(e => e.Idsp)
                    .HasMaxLength(5)
                    .HasColumnName("IDSP");

                entity.Property(e => e.DonGia).HasColumnType("decimal(18, 0)");

                entity.Property(e => e.ImagePath).HasMaxLength(550);

                entity.Property(e => e.Ten).HasMaxLength(250);

                entity.Property(e => e.ThanhTien).HasColumnType("decimal(18, 0)");

                entity.HasOne(d => d.IdghNavigation)
                    .WithMany(p => p.Ctgiohangs)
                    .HasForeignKey(d => d.Idgh)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__CTGIOHANG__IDGH__440B1D61");
            });

            modelBuilder.Entity<Giohang>(entity =>
            {
                entity.HasKey(e => e.Idgh)
                    .HasName("PK__GIOHANG__B87DE222A55999E3");

                entity.ToTable("GIOHANG");

                entity.Property(e => e.Idgh)
                    .HasMaxLength(5)
                    .HasColumnName("IDGH");

                entity.Property(e => e.Email).HasMaxLength(50);

                entity.Property(e => e.GiamGia).HasColumnType("decimal(4, 2)");

                entity.Property(e => e.NgayMua).HasColumnType("date");

                entity.Property(e => e.TongGia).HasColumnType("decimal(18, 0)");

                entity.Property(e => e.TongPhaiTra).HasColumnType("decimal(18, 0)");
            });

            modelBuilder.Entity<Laptop>(entity =>
            {
                entity.ToTable("LAPTOP");

                entity.Property(e => e.Id)
                    .HasMaxLength(6)
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
                entity.ToTable("PHONE");

                entity.Property(e => e.Id)
                    .HasMaxLength(6)
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

            modelBuilder.Entity<Reviewlaptop>(entity =>
            {
                entity.HasKey(e => new { e.Idgh, e.Idsp })
                    .HasName("PK__REVIEWLA__F3FA22086506CB4D");

                entity.ToTable("REVIEWLAPTOP");

                entity.Property(e => e.Idgh)
                    .HasMaxLength(5)
                    .HasColumnName("IDGH");

                entity.Property(e => e.Idsp)
                    .HasMaxLength(6)
                    .HasColumnName("IDSP");

                entity.Property(e => e.BinhLuan).HasMaxLength(200);

                entity.HasOne(d => d.IdghNavigation)
                    .WithMany(p => p.Reviewlaptops)
                    .HasForeignKey(d => d.Idgh)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__REVIEWLAPT__IDGH__4E88ABD4");

                entity.HasOne(d => d.IdspNavigation)
                    .WithMany(p => p.Reviewlaptops)
                    .HasForeignKey(d => d.Idsp)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__REVIEWLAPT__IDSP__4F7CD00D");
            });

            modelBuilder.Entity<Reviewphone>(entity =>
            {
                entity.HasKey(e => new { e.Idgh, e.Idsp })
                    .HasName("PK__REVIEWPH__F3FA2208247624A3");

                entity.ToTable("REVIEWPHONE");

                entity.Property(e => e.Idgh)
                    .HasMaxLength(5)
                    .HasColumnName("IDGH");

                entity.Property(e => e.Idsp)
                    .HasMaxLength(6)
                    .HasColumnName("IDSP");

                entity.Property(e => e.BinhLuan).HasMaxLength(200);

                entity.HasOne(d => d.IdghNavigation)
                    .WithMany(p => p.Reviewphones)
                    .HasForeignKey(d => d.Idgh)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__REVIEWPHON__IDGH__4AB81AF0");

                entity.HasOne(d => d.IdspNavigation)
                    .WithMany(p => p.Reviewphones)
                    .HasForeignKey(d => d.Idsp)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__REVIEWPHON__IDSP__4BAC3F29");
            });

            modelBuilder.Entity<Taikhoan>(entity =>
            {
                entity.HasKey(e => e.Email)
                    .HasName("PK__TAIKHOAN__A9D10535EBC1199A");

                entity.ToTable("TAIKHOAN");

                entity.Property(e => e.Email)
                    .HasMaxLength(50)
                    .UseCollation("SQL_Latin1_General_CP1_CS_AS");

                entity.Property(e => e.DiaChi).HasMaxLength(200);

                entity.Property(e => e.HoTen).HasMaxLength(100);

                entity.Property(e => e.MatKhau)
                    .HasMaxLength(100)
                    .UseCollation("SQL_Latin1_General_CP1_CS_AS");

                entity.Property(e => e.Sdt)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("SDT");

                entity.Property(e => e.VaiTro).HasMaxLength(50);
            });

            modelBuilder.Entity<Voucher>(entity =>
            {
                entity.HasKey(e => e.Voucher1)
                    .HasName("PK__VOUCHER__4BFED2CD35C79B30");

                entity.ToTable("VOUCHER");

                entity.Property(e => e.Voucher1)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("Voucher");

                entity.Property(e => e.GiamGia).HasColumnType("decimal(4, 2)");
            });

            modelBuilder.Entity<Yeuthich>(entity =>
            {
                entity.HasKey(e => new { e.Email, e.Idsp })
                    .HasName("PK__YEUTHICH__E256C51F3DE7D142");

                entity.ToTable("YEUTHICH");

                entity.Property(e => e.Email)
                    .HasMaxLength(50)
                    .UseCollation("SQL_Latin1_General_CP1_CS_AS");

                entity.Property(e => e.Idsp)
                    .HasMaxLength(6)
                    .HasColumnName("IDSP");

                entity.Property(e => e.Gia).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.ImagePath).HasMaxLength(550);

                entity.Property(e => e.Ten).HasMaxLength(250);

                entity.HasOne(d => d.EmailNavigation)
                    .WithMany(p => p.Yeuthiches)
                    .HasForeignKey(d => d.Email)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__YEUTHICH__Email__3D5E1FD2");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}

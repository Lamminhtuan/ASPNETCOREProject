using Microsoft.EntityFrameworkCore;
namespace FinalProject.Models;

public class GiohangsDAL
{
    private static ASPContext _context;
    public decimal giamgia { get; set; }
    public decimal tongtienphaitra { get; set; }
   public static void KhoiTao()
    {
        _context = new ASPContext();
    }
    public static void DatHang()
    {
        int count = _context.Giohangs.Count();
        count += 1;
        string currentid;
        if (count < 10)
            currentid = "GH0" + count.ToString();
        else
            currentid = "GH" + count.ToString();
        var giohang = new Giohang()
        {
            Idgh = currentid,
            Email = "",
            TongGia = 0,
            TongPhaiTra = 0,
            NgayMua = DateTime.Now,
            GiamGia = 0
        };
        _context.Giohangs.Add(giohang);
        _context.SaveChanges();
    }
    public static string GetIDDH()
    {
        int count = _context.Giohangs.Count();
        string currentid;
        if (count < 10)
            currentid = "GH0" + count.ToString();
        else
            currentid = "GH" + count.ToString();
        return currentid;
    }
}

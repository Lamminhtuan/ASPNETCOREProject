namespace FinalProject.Models;
using System.Globalization;

public class CtgiohangsDAL
{
    private static ASPContext _context;

    public static void KhoiTao()
    {
        _context = new ASPContext();
    }
    public static int GetSLInCart()
    {
        int count = _context.Giohangs.Count();
        string currentid;
        if (count < 10)
            currentid = "GH0" + count.ToString();
        else
            currentid = "GH" + count.ToString();
        return _context.Ctgiohangs.Where(b => b.Idgh.Equals(currentid)).Count();

    }
    public static string ConvertToVND(decimal money)
    {
        return money.ToString("C", CultureInfo.CreateSpecificCulture("vi-VN"));
    }
    public static decimal GetTongTien()
    {
        decimal result = 0;
        int count = _context.Giohangs.Count();
        string currentid;
        if (count < 10)
            currentid = "GH0" + count.ToString();
        else
            currentid = "GH" + count.ToString();
        var kq = _context.Ctgiohangs.Where(b => b.Idgh.Equals(currentid));
        foreach (var item in kq)
        {
            result += item.ThanhTien;
        }
        return result;
    }
    public static void XoaItem(string idsp)
    {
        int count = _context.Giohangs.Count();
        string currentid;
        if (count < 10)
            currentid = "GH0" + count.ToString();
        else
            currentid = "GH" + count.ToString();
        var kq = _context.Ctgiohangs.SingleOrDefault(b => b.Idgh.Equals(currentid) && b.Idsp.Equals(idsp));
        _context.Ctgiohangs.Remove(kq);
        _context.SaveChanges();
    }
}

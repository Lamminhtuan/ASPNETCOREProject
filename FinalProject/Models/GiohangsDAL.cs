using Microsoft.EntityFrameworkCore;
namespace FinalProject.Models;

public class GiohangsDAL
{
    private static ASPContext _context;
   
    public static int GetIDDH()
    {

        ASPContext context = new ASPContext();
        _context = context;
        int count = _context.Giohangs.Count();
        return count - 1;
    }
}

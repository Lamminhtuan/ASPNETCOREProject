using Microsoft.EntityFrameworkCore;

namespace FinalProject.Models
{
    public class TaikhoansDAL
    {

    
  
        private static ASPContext _context;
        public static string kpmatkhau { get; set; }
        public static string emailkpmatkhau { set; get; }   
        
        public static void KhoiTao()
        {
            _context = new ASPContext();
         

           

        }
        public static string GetHoTenByEmail(string email)
        {
            string query = "SELECT * FROM TAIKHOAN WHERE Email = '" + email + "'";
            var taikhoan = _context.Taikhoans.FromSqlRaw(query).ToList();
            if (taikhoan.Count > 0)
                return taikhoan[0].HoTen;
            else
                return "";
        }
      
            
    }
}

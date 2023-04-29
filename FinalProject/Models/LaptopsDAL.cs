namespace FinalProject.Models
{
    public class LaptopsDAL
    {
        private static ASPContext _context;
        public static void KhoiTao()
        {
            _context = new ASPContext();
        }
        public static string GetID()
        {
            var kq = _context.Laptops.SingleOrDefault(b => b.Id.Substring(2) == _context.Laptops.Max(x => x.Id.Substring(2)));
            int id = Convert.ToUInt16(kq.Id.Substring(2));
            int id1 = id + 1;
            if (id < 10)
            {
                return "LT0" + id1.ToString();
            }
            else
            {
                return "LT" + id1.ToString();
            }
        }
    }
}

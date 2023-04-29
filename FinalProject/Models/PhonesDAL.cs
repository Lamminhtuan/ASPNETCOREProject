namespace FinalProject.Models
{
    public class PhonesDAL
    {
        private static ASPContext _context;
        public static void KhoiTao()
        {
            _context = new ASPContext();
        }
        public static string GetID()
        {
            var kq = _context.Phones.SingleOrDefault(b => b.Id.Substring(2) == _context.Phones.Max(x => x.Id.Substring(2)));
            int id = Convert.ToUInt16(kq.Id.Substring(2));
            int id1 = id + 1;
            if (id < 10)
            {
                return "DT0" + id1.ToString();
            }
            else
            {
                return "DT" + id1.ToString();
            }
        }
    }
}

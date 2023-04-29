namespace FinalProject.Models
{
    public class YeuthichesDAL
    {
        private static ASPContext _context;
        public static void KhoiTao()
        {
            _context = new ASPContext();
        }
        public static int GetYeuThichesSL(string email)
        {
            if (String.IsNullOrEmpty(email))
                email = "Test";
            var yeuthichfv = _context.Yeuthiches.Where(b => b.Email.Equals(email)).ToList();
            return yeuthichfv.Count;
         
        }
    }

}

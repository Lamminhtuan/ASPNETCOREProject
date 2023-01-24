namespace FinalProject.Models
{
    public class CtgiohangsDAL
    {
        private static ASPContext _context;

        public static int GetSLInCart()
        {

            ASPContext context = new ASPContext();
            _context = context;
            int count = _context.Giohangs.Count() - 1;
            return _context.Ctgiohangs.Where(b => b.Idgh == count).Count();
            
        }
    }
}

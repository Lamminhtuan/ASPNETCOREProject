namespace FinalProject.Models
{
    public class ReviewsDAL
    {
        private static ASPContext _context;
        public static void KhoiTao()
        {
            _context = new ASPContext();
        }
        public static List<Reviewphone> GetReviewPhone(string idsp)
        {
            var kq = _context.Reviewphones.Where(b => b.Idsp.Equals(idsp)).ToList();
            return kq;
        }
        public static List<Reviewlaptop> GetReviewLaptop(string idsp)
        {
            var kq = _context.Reviewlaptops.Where(b => b.Idsp.Equals(idsp)).ToList();
            return kq;
        }
        public static int GetSoLuongDanhGia(string idsp)
        {
            if (idsp.Contains("DT"))
            {
                var kq = _context.Reviewphones.Where(b => b.Idsp.Equals(idsp)).ToList();
                return kq.Count;
            }
            else
            {
                var kq = _context.Reviewlaptops.Where(b => b.Idsp.Equals(idsp)).ToList();
                return kq.Count;
            }
        }
        public static float TinhSaoTrungBinh(string idsp)
        {
            if (idsp.Contains("DT"))
            {
                float tong = 0;
                var kq = _context.Reviewphones.Where(b => b.Idsp.Equals(idsp)).ToList();
                for (int i = 0; i < kq.Count; i++)
                {
                    tong += kq[i].Sao;

                }
                return tong / kq.Count;
            }
            else
            {
                float tong = 0;
                var kq = _context.Reviewlaptops.Where(b => b.Idsp.Equals(idsp)).ToList();
                for (int i = 0; i < kq.Count; i++)
                {
                    tong += kq[i].Sao;

                }
                return tong / kq.Count;
            }
        }
        public static bool GetDaDanhGia(string idgh, string idsp)
        {
            //true là đã đánh giá, false là chưa
            if (idsp.Contains("DT"))
            {
                var kq = _context.Reviewphones.Where(b => b.Idgh.Equals(idgh) && b.Idsp.Equals(idsp)).ToList();
                if (kq.Count > 0)
                    return true;
                else
                    return false;
            }
            else
            {
                var kq = _context.Reviewlaptops.Where(b => b.Idgh.Equals(idgh) && b.Idsp.Equals(idsp)).ToList();
                if (kq.Count > 0)
                    return true;
                else
                    return false;
            }
        }
    }
}

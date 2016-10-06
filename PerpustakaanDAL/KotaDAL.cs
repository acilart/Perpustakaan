using PerpustakaanModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerpustakaanDAL
{
    public class KotaDAL
    {
        public static List<MstKota> GetAllKota()
        {
            using (var db = new PerpustakaanDbContext())
            {
                return db.MstKota.ToList();
            }
        }

        public static List<MstKota> GetAllKotaByProvID(int id)
        {
            using (var db = new PerpustakaanDbContext())
            {
                return db.MstKota.Where(n => n.IDProvinsi == id).ToList();
            }
        }
    }
}

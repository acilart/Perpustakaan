using PerpustakaanModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerpustakaanDAL
{
    public class KelurahanDAL
    {
        public static List<MstKelurahan> GetAllKelurahan()
        {
            using (var db = new PerpustakaanDbContext())
            {
                return db.MstKelurahan.ToList();
            }
        }

        public static List<MstKelurahan> GetAllKelurahanByKecId(int id)
        {
            using (var db = new PerpustakaanDbContext())
            {
                return db.MstKelurahan.Where(n=>n.IDKecamatan==id).ToList();
            }
        }
    }
}

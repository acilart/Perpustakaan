using PerpustakaanModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerpustakaanDAL
{
    public class KecamatanDAL
    {
        public static List<MstKecamatan> GetAllKecamatan()
        {
            using (var db=new PerpustakaanDbContext())
            {
                return db.MstKecamatan.ToList();
            }
        }

        public static List<MstKecamatan> GetAllKecamatanbyKotaID(int id)
        {
            using (var db = new PerpustakaanDbContext())
            {
                return db.MstKecamatan.Where(n=>n.IDKota==id).ToList();
            }
        }
    }
}

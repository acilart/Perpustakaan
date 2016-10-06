using PerpustakaanModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerpustakaanDAL
{
    public class KategoriBukuDAL
    {
        public static List<MstKategori> GetAllKategori()
        {
            using (var db=new PerpustakaanDbContext())
            {
                return db.MstKategori.ToList();
            }
        }

        public static MstKategori GetKategoriByID(int id)
        {
            using (var db = new PerpustakaanDbContext())
            {
                return db.MstKategori.FirstOrDefault(n=>n.ID==id);
            }
        }
    }
}

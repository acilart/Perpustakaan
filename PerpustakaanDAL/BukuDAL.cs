using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PerpustakaanModel;
using System.Data.Entity;
namespace PerpustakaanDAL
{
  
    public class BukuDAL
    {
        public static List<MstBuku> GetAllBuku()
        {

            using (var db = new PerpustakaanDbContext())
            {
                return db.MstBuku.ToList();
            }

        }
    }
}
        

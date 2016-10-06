using PerpustakaanModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerpustakaanDAL
{
    public class ProvinsiDAL
    {
        public static List<MstProvinsi> GetAllPropinsi()
        {
            using (var db = new PerpustakaanDbContext())
            
            {
                return db.MstProvinsi.ToList();
            }
        }

      
    }
}

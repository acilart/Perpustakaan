using PerpustakaanModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerpustakaanDAL
{
    public class SumberBukuDAL
    {
        public List<MstSumberBuku> GetAllSumberBuku()
        {
            using (var db = new PerpustakaanDbContext())
            {
                return db.MstSumberBuku.ToList();
            }
        }
    }
}

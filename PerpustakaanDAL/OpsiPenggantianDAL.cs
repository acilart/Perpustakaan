using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PerpustakaanModel;
namespace PerpustakaanDAL
{
    public class OpsiPenggantianDAL
    {
        public static List<MstOpsiPenggantian> GetOpsi()
        {
            using (var db = new PerpustakaanDbContext())
            {
                return db.MstOpsiPenggantian.ToList();
            }
        }
    }
}

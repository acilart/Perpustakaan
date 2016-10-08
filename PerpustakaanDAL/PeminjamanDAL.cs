using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PerpustakaanModel;
namespace PerpustakaanDAL
{
    public class PeminjamanDAL
    {
        public TrBrwHeader GetHeaderByNore(string noReg)
        {
            using (var db = new PerpustakaanDbContext())
            {
                return db.TrBrwHeader.FirstOrDefault(n => n.NoRegistrasi == noReg);
            }
        }
    }
}

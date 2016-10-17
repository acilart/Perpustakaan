using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PerpustakaanModel;
namespace PerpustakaanDAL
{
    public class TipeIuranDAL
    {
        public List<MstTipeIuran> GetTipeIuranByIDAnggota(int id)
        {
            var list = new List<MstTipeIuran>();
            using (var db = new PerpustakaanDbContext())
            {
                var listIuran = db.MstTipeIuran.ToList();
                var anggota = db.MstAnggota.FirstOrDefault(n => n.ID == id);
                if (anggota != null)
                {
                    if (Convert.ToDateTime(anggota.MasaBerlakuKartu) < DateTime.Now)
                    {
                        list.Add(listIuran.FirstOrDefault(n => n.ID == 4));
                        if (Convert.ToDateTime(anggota.MasaBerlakuAnggota) < DateTime.Now)
                        {
                            list.Add(listIuran.FirstOrDefault(n => n.ID == 2));
                        }

                    }
                    return list;
                }
                return null;
            }
        }

        public List<MstTipeIuran> GetAllIuranNonDenda()
        {
            using (var db = new PerpustakaanDbContext())
            {
                return db.MstTipeIuran.Where(n => n.ID != 3).ToList();
            }
        }
    }
}

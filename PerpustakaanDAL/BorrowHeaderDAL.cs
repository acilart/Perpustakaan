using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Perpustakaan.ViewModel;
using PerpustakaanModel;
using System.Data.Entity.Validation;

namespace PerpustakaanDAL
{
    public class BorrowHeaderDAL
    {
        public List<TrBrwHeader> GetAllData()
        {
            using (var db = new PerpustakaanDbContext())
            {
                return db.TrBrwHeader.ToList();
            }
        }

        public static TrBrwHeader GetDataById(int id)
        {
            using (var db = new PerpustakaanDbContext())
            {
                var cek = db.TrBrwHeader.FirstOrDefault(n => n.ID == id);

                return cek;
            }
        }

        public TrBrwHeader GetDataByIdonly(int id)
        {
            using (var db = new PerpustakaanDbContext())
            {
                var cek = db.TrBrwHeader.FirstOrDefault(n => n.ID == id);

                return cek;
            }
        }

        public TrBrwHeader GetDataByIdAnggota(int id)
        {
            using (var db = new PerpustakaanDbContext())
            {
                var cek = db.TrBrwHeader.FirstOrDefault(n => n.IDAnggota == id);

                return cek;
            }
        }

    }
}

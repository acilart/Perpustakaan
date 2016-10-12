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

        //public List<TrBrwHeader> GetAllByNama(int ID)
        //{
        //    using (var db = new PerpustakaanDbContext())
        //    {

        //        var cek = db.TrBrwHeader.Where(n => n.IDAnggota == ID).ToList();
        //        return cek;

           
        //    }
        //}


    }
}

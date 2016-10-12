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
    public class BorrowDetailDAL
    {
        public  List<TrBrwDetail> GetAllData()
        {
            using (var db = new PerpustakaanDbContext())
            {
                return db.TrBrwDetail.ToList();
            }
        }

        public static List<TrBrwDetail> GetAllDataByID(int ID)
        {
            using (var db = new PerpustakaanDbContext())
            {

                var cek = db.TrBrwDetail.Where(n => n.HeaderID == ID).ToList();
                return cek;
            
            }
        }

        public List<TrBrwDetail> GetDataByID(int ID)
        {
            using (var db = new PerpustakaanDbContext())
            {
                
                var cek = db.TrBrwDetail.Where(n => n.HeaderID == ID).ToList();
                return cek;

            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PerpustakaanModel;
using Perpustakaan.ViewModel;

namespace PerpustakaanDAL
{
    public class BookingDAL
    {
        public List<BookingViewModel> GetBookingAktifByID(int id)
        {
            var list = new List<BookingViewModel>();
            using (var db = new PerpustakaanDbContext())
            {
                var det = db.TrBookingDetail.Where(n => n.HeaderID == id);
                foreach (var item in det)
                {
                    var dal = new BukuDAL();
                    var buku = dal.GetBukuByID(item.IDBuku);
                    if (buku != null)
                    {
                        var boking = new BookingViewModel()
                        {
                            IDBuku=buku.ID,
                            IDDetail = item.ID,
                            JudulBuku = buku.JudulBuku,
                            KodeBuku = buku.Kode,
                            Pengarang = buku.Pengarang
                        };
                        list.Add(boking);
                    }
                }
            }
            return list;
        }

        public List<TrBookingHeader> GetBookingHeaderAktifByIDAnggota(int id)
        {
            using (var db = new PerpustakaanDbContext())
            {
                return db.TrBookingHeader.Where(n => n.IDAnggota==id &&
                    n.Active == false && 
                    n.TanggalPinjam >= DateTime.Now).ToList();
            }
        }
    }
}

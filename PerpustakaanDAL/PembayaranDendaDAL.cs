using Perpustakaan.ViewModel;
using PerpustakaanModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerpustakaanDAL
{
    public class PembayaranDendaDAL
    {      
        public static List<PembayaranDendaViewModel> GetPengembalian()
        {
            using (var db = new PerpustakaanDbContext())
            {
                var list = new List<PembayaranDendaViewModel>();
                var headerkembali = db.TrReturnHeader.Where(n => n.Denda == true && n.SudahDibayar < 1).ToList();
                foreach (var item in headerkembali)
                {
                    var anggota = db.MstAnggota.FirstOrDefault(n => n.ID == item.IDAnggota);
                    var pembayaran = new PembayaranDendaViewModel()
                    {
                        ID = item.ID,
                        NamaAnggota = anggota.Nama,
                        NoReferensi = item.NoReferensi,
                        TanggalPinjam = Convert.ToDateTime(item.TanggalPinjam),
                        TanggalKembali = Convert.ToDateTime(item.TanggalKembali),
                        TanggalDikembalikan = Convert.ToDateTime(item.TanggalDikembalikan)
                    };
                    list.Add(pembayaran);                    
                }
                 return list;
                }
               
            }

        //public static List<PembayaranDendaViewModel> GetPengembalianBySearch(string search)
        //{
        //    using (PerpustakaanDbContext db = new PerpustakaanDbContext())
        //    {
        //        //masih ngeload semua datanya abis search
        //        var headerkembali = db.TrReturnHeader.Where(n => n.Denda == true && n.SudahDibayar < 1).ToList();
        //        foreach (var item in headerkembali)
        //        {
        //            var result = (from rtr in db.TrReturnHeader
        //                          join nama in db.MstAnggota on rtr.IDAnggota equals nama.ID
        //                          select new
        //                          {
        //                              ID = rtr.ID,
        //                              NoReferensi = rtr.NoReferensi,
        //                              NamaAnggota = nama.Nama,
        //                              TanggalPinjam = rtr.TanggalPinjam,
        //                              TanggalKembali = rtr.TanggalKembali,
        //                              TanggalDikembalikan = rtr.TanggalDikembalikan,
        //                          }).Where(a => (a.NoReferensi + a.NamaAnggota).Contains(search)).ToList();
        //            var list = new List<PembayaranDendaViewModel>();
        //            foreach (var cek in result)
        //            {
        //                var dal = new PembayaranDendaViewModel()
        //                {
        //                    NoReferensi = cek.NoReferensi,
        //                    NamaAnggota = cek.NamaAnggota,
        //                    TanggalPinjam = Convert.ToDateTime(cek.TanggalPinjam),
        //                    TanggalKembali = Convert.ToDateTime(cek.TanggalKembali),
        //                    TanggalDikembalikan = Convert.ToDateTime(cek.TanggalDikembalikan)
        //                };
        //                list.Add(dal);
        //            }
        //            return list;
        //        }
        //        return null;
        //    }
        //}

        public static PembayaranDendaViewModel GetPeminjamanById(int id)
        {
            using (PerpustakaanDbContext db = new PerpustakaanDbContext())
            {
                var cek = db.TrReturnHeader.FirstOrDefault(n => n.ID == id);
                if (cek != null)
                {
                    var anggota = db.MstAnggota.FirstOrDefault(n => n.ID == cek.IDAnggota);
                    if (anggota != null)
                    {
                        var pembayaran = new PembayaranDendaViewModel()
                    {
                        ID = cek.ID,
                        IDAnggota = cek.IDAnggota,
                        NamaAnggota = anggota.Nama,
                        NoReferensi = cek.NoReferensi,
                        TanggalPinjam = Convert.ToDateTime(cek.TanggalPinjam),
                        TanggalKembali = Convert.ToDateTime(cek.TanggalKembali),
                        TanggalDikembalikan = Convert.ToDateTime(cek.TanggalDikembalikan)
                    };
                        return pembayaran;
                    }
                    return null;
                }
                return null;
                
            }
        }

        public static List<PengembalianViewModel> GetBukuDenda(int id)
        {
            List<PengembalianViewModel> result = new List<PengembalianViewModel>();
            using (PerpustakaanDbContext db = new PerpustakaanDbContext())
            {
                var header = db.TrReturnHeader.FirstOrDefault(n => n.ID == id);
                var detail = db.TrReturnDetail.Where(n => n.HeaderID == id);
                foreach (var item in detail)
                {
                    var ts = new TimeSpan();
                    ts = DateTime.Now.Subtract(Convert.ToDateTime(header.TanggalKembali));
                    var buku = new PerpustakaanDbContext().MstBuku.FirstOrDefault(n => n.ID == item.IDBuku);
                    var pembayaran = new PengembalianViewModel()
                    {
                        IDBuku = buku.ID,
                        Judul = buku.JudulBuku,
                        KodeMstBuku = buku.Kode,
                        Terlambat=ts.Days,
                        denda = ts.Days * 5000,
                    };
                    result.Add(pembayaran);
                }
                return result;
            }
        }

        public static bool SimpanPembayaranDenda(TrDendaHeader header,List<TrDendaDetail> details, TrReturnHeader retHeader)
        {
            using (var db = new PerpustakaanDbContext())
            {
                var listHeader = db.TrDendaHeader.ToList();
                int id = 1;
                if (listHeader.Count > 0)
                {
                    id = listHeader[listHeader.Count - 1].ID + 1;
                }

                header.NoRegistrasi = AutoNumberDAL.PembayaranDendaNoRegAutoNumber();
                header.NoReferensi = header.NoReferensi;
                header.ID = id;                
                header.IDAnggota = header.IDAnggota;                
                header.CreatedOn = DateTime.Now;                
                header.ModifiedOn = DateTime.Now;
                header.CreatedBy = header.CreatedBy;
                db.TrDendaHeader.Add(header);
                foreach (var item in details)
                {
                    var dal = new BukuDAL();
                    var buku = dal.GetBukuByID(item.IDBuku);
                    if (buku!= null)
                    {
                        item.HeaderID = id;
                        item.IDBuku = item.IDBuku;
                        item.Jumlah = item.Jumlah;
                        item.CreatedOn = DateTime.Now;
                        item.CreatedBy = header.CreatedBy;
                        item.ModifiedOn = DateTime.Now;
                        db.TrDendaDetail.Add(item);
                    }                                                        
                }
                
                var cek = db.TrReturnHeader.FirstOrDefault(n => n.ID == retHeader.ID);
                if (cek != null)
                {
                    cek.SudahDibayar = 1;
                }
                try
                {
                    db.SaveChanges();
                    return true;
                }
                catch (Exception)
                {
                    return false;
                    throw;
                }
            }
        }
    }
}

using PerpustakaanModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using Perpustakaan.ViewModel;

namespace PerpustakaanDAL
{
    public class PengembalianDAL
    {               
        //ini untuk nampilin table peminjaman
        public static List<PengembalianViewModel> GetPeminjaman()
        {
            List<PengembalianViewModel> result = new List<PengembalianViewModel>();
            using (PerpustakaanDbContext db = new PerpustakaanDbContext())
            {
                var pinjam = db.TrBrwHeader.Where(n => n.Status == false);
                if (pinjam.Count() > 0)
                {
                    result = (from Brw in db.TrBrwHeader
                              join cat in db.MstAnggota on Brw.IDAnggota equals cat.ID
                              select new
                              {
                                  ID = Brw.ID,
                                  NoReferensi = Brw.NoReferensi,
                                  NamaAnggota = cat.Nama,
                                  TanggalPinjam = Brw.TanggalPinjam,
                                  TanggalKembali = Brw.TanggalKembali

                              }).ToList().
                          Select(x => new PengembalianViewModel()
                          {
                              ID = x.ID,
                              NoReferensi = x.NoReferensi,
                              NamaAnggota = x.NamaAnggota,
                              TanggalPinjam = Convert.ToDateTime(x.TanggalPinjam),
                              TanggalKembali = Convert.ToDateTime(x.TanggalKembali)
                          }).ToList();
                }
                
               
            }
            return result;
        }

        public static List<PengembalianViewModel> GetPeminjamanByID(int id)
        {

            // List<PengembalianDAL> result = new List<PengembalianDAL>();
            using (PerpustakaanDbContext db = new PerpustakaanDbContext())
            {
                //result = db.TrBrwHeader.Include("Anggota").Where(n => n.IDAnggota == id).ToList();
                var result = (from Brw in db.TrBrwHeader
                              join cat in db.MstAnggota on Brw.IDAnggota equals cat.ID
                              select new
                              {
                                  ID = Brw.ID,
                                  IDAnggota = Brw.IDAnggota,
                                  NoReferensi = Brw.NoReferensi,
                                  NamaAnggota = cat.Nama,
                                  TanggalPinjam = Brw.TanggalPinjam,
                                  TanggalKembali = Brw.TanggalKembali
                              }).Where(a => a.ID == id).ToList();

                var list = new List<PengembalianViewModel>();
                foreach (var item in result)
                {

                    var dal = new PengembalianViewModel()
                    {
                        ID = item.ID,
                        IDAnggota = item.IDAnggota,
                        NoReferensi = item.NoReferensi,
                        NamaAnggota = item.NamaAnggota,
                        TanggalPinjam = Convert.ToDateTime(Convert.ToDateTime(item.TanggalPinjam).ToShortDateString()),
                        TanggalKembali = Convert.ToDateTime(Convert.ToDateTime(item.TanggalKembali).ToShortDateString())
                    };
                    list.Add(dal);
                }
                return list;
            }
            //return new List<PengembalianDAL>();          
        }
        public static List<PengembalianViewModel> GetPeminjamanBySearch(string Search)
        {

            // List<PengembalianDAL> result = new List<PengembalianDAL>();
            using (PerpustakaanDbContext db = new PerpustakaanDbContext())
            {
                //result = db.TrBrwHeader.Include("Anggota").Where(n => n.IDAnggota == id).ToList();
                var result = (from Brw in db.TrBrwHeader
                              join cat in db.MstAnggota on Brw.IDAnggota equals cat.ID
                              select new
                              {
                                  NoReferensi = Brw.NoReferensi,
                                  NamaAnggota = cat.Nama,
                                  TanggalPinjam = Brw.TanggalPinjam,
                                  TanggalKembali = Brw.TanggalKembali
                              }).Where(a => (a.NamaAnggota + a.NoReferensi).Contains(Search)).ToList();

                var list = new List<PengembalianViewModel>();
                foreach (var item in result)
                {

                    var dal = new PengembalianViewModel()
                    {
                        NoReferensi = item.NoReferensi,
                        NamaAnggota = item.NamaAnggota,
                        TanggalPinjam = Convert.ToDateTime(item.TanggalPinjam),
                        TanggalKembali = Convert.ToDateTime(item.TanggalKembali)
                    };
                    list.Add(dal);
                }
                return list;
            }
        }
        //untuk mendapatkan buku yang dipinjam oleh anggota
        public static List<PengembalianViewModel> GetBukuPinjam(int id)
        {
            List<PengembalianViewModel> result = new List<PengembalianViewModel>();
            using (PerpustakaanDbContext db = new PerpustakaanDbContext())
            {
                
                var header = db.TrBrwHeader.FirstOrDefault(n => n.ID == id);
                var detail = db.TrBrwDetail.Where(n => n.HeaderID == id);
                foreach (var item in detail)
                {                    
                    var ts = new TimeSpan();
                    ts = DateTime.Now.Subtract(Convert.ToDateTime(header.TanggalKembali));
                    var buku = new PerpustakaanDbContext().MstBuku.FirstOrDefault(n => n.ID == item.IDBuku);
                    var pengembalian = new PengembalianViewModel()
                    {
                        IDBuku=buku.ID,
                        Judul = buku.JudulBuku,
                        IsKehilangan = false,
                        Terlambat = ts.Days,
                        KodeMstBuku = buku.Kode,
                        denda = ts.Days * 5000,                        
                    };
                    result.Add(pengembalian);                    
                }
            }
            return result;
        }

        public static bool SimpanPengembalian(TrReturnHeader header, List<TrReturnDetail> detail)
        {
            var bukuDal = new BukuDAL();
            
            using (var db = new PerpustakaanDbContext())
            {
                #region Update Peminjaman Header
                var pinjamDal = new PeminjamanDAL();
                var pinjam = db.TrBrwHeader.FirstOrDefault(n=>n.ID == header.IDBorrow);
                if (pinjam != null)
                {
                    pinjam.Status = true;
                }
                #endregion
                #region Insert Header Pengembalian
                int id = 1;
                var listHeader = db.TrReturnHeader.ToList();
                if (listHeader.Count > 0)
                {
                    id = listHeader[listHeader.Count - 1].ID + 1;
                }
                header.ID = id;
                header.IDAnggota = header.IDAnggota;
                header.ModifiedOn = DateTime.Now;
                header.NoRegistrasi = AutoNumberDAL.PengembalianBukuNoRegAutoNumber();
                header.NoReferensi = header.NoReferensi;
                header.CreatedOn = DateTime.Now;
                header.CreatedBy = header.CreatedBy;
                header.TanggalPinjam = header.TanggalPinjam;
                header.TanggalKembali = header.TanggalKembali;
                header.TanggalDikembalikan = header.TanggalDikembalikan; //harus diganti pakai datepicker
                header.Denda = header.Denda;
                db.TrReturnHeader.Add(header);
                #endregion
               
                foreach (var item in detail)
                {
                    #region Insert Detail Pengembalian
                    int idd = 0;
                    var listdetail = db.TrReturnDetail.ToList();
                    if (listdetail.Count > 0)
                    {
                        idd = listdetail[listdetail.Count - 1].ID + 1;
                    }
                    var dal = new BukuDAL();
                    var buku = dal.GetBukuByID(item.IDBuku);
                    if (buku != null)
                    {
                        item.ID = idd;
                        item.HeaderID = header.ID;
                        item.IDBuku = item.IDBuku;
                        item.LaporKehilangan = item.LaporKehilangan;
                        item.CreatedOn = DateTime.Now;
                        item.CreatedBy = header.CreatedBy;
                        item.ModifiedOn = DateTime.Now;
                        item.Denda = header.Denda;
                        db.TrReturnDetail.Add(item);
                    }
                    #endregion
                    if (item.LaporKehilangan == false && buku!=null)
                    {
                            #region Update Stock
                            var stock = db.TrStock.FirstOrDefault(n => n.IDBuku == item.IDBuku);
                            if (stock != null)
                            {
                                stock.InStock = true;
                            }
                            #endregion

                            #region Update Cell
                            var cell = db.MstCabinetCell.Where(n => n.ID == buku.Lokasi).FirstOrDefault();
                            if (cell != null)
                            {
                                cell.Terisi += 1;
                                cell.Kosong -= 1;
                            }
                            #endregion

                    }
                    else if (item.LaporKehilangan == true && buku != null)
                    {
                        var cekBuku = db.MstBuku.FirstOrDefault(n => n.ID == item.IDBuku);
                        if (cekBuku != null)
                        {
                            cekBuku.Aktif = false;
                            cekBuku.Lokasi = null;
                        }
                    }

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

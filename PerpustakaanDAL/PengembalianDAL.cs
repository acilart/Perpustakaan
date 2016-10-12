using PerpustakaanModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

namespace PerpustakaanDAL
{
    public class PengembalianDAL
    {
        public string NamaAnggota { get; set; }
        public int ID { get; set; }
        public Nullable<int> IDAnggota { get; set; }
        public string NoReferensi { get; set; }
        public DateTime TanggalPinjam { get; set; }
        public DateTime TanggalKembali { get; set; }
        public DateTime TanggalDikembalikan { get; set; }
       
        //ini property untuk tampilan di form pengembalian
        public int IDBuku { get; set; }
        public int Terlambat { get; set; }
        public bool IsKehilangan { get; set; }
        public string Judul { get; set; }
        public string KodeMstBuku { get; set; }
        public int denda { get; set; }
        
        //ini untuk nampilin table peminjaman
        public static List<PengembalianDAL> GetPeminjaman()
        {
            List<PengembalianDAL> result = new List<PengembalianDAL>();
            using (PerpustakaanDbContext db = new PerpustakaanDbContext())
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
                          Select(x => new PengembalianDAL()
                          {
                              ID = x.ID,                              
                              NoReferensi = x.NoReferensi,
                              NamaAnggota = x.NamaAnggota,
                              TanggalPinjam = Convert.ToDateTime(x.TanggalPinjam),
                              TanggalKembali = Convert.ToDateTime(x.TanggalKembali)
                          }).ToList();
                
                //result = db.TrBrwHeader.ToList();
            }
            return result;
        }

        public static List<PengembalianDAL> GetPeminjamanByID(int id)
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

                var list = new List<PengembalianDAL>();
                foreach (var item in result)
                {

                    var dal = new PengembalianDAL()
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
        public static List<PengembalianDAL> GetPeminjamanBySearch(string Search)
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

                var list = new List<PengembalianDAL>();
                foreach (var item in result)
                {

                    var dal = new PengembalianDAL()
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
        public static List<PengembalianDAL> GetBukuPinjam(int id)
        {
            List<PengembalianDAL> result = new List<PengembalianDAL>();
            using (PerpustakaanDbContext db = new PerpustakaanDbContext())
            {
                
                var header = db.TrBrwHeader.FirstOrDefault(n => n.ID == id);
                var detail = db.TrBrwDetail.Where(n => n.HeaderID == id);
                foreach (var item in detail)
                {                    
                    var ts = new TimeSpan();
                    ts = DateTime.Now.Subtract(Convert.ToDateTime(header.TanggalKembali));
                    var buku = new PerpustakaanDbContext().MstBuku.FirstOrDefault(n => n.ID == item.IDBuku);
                    var pengembalian = new PengembalianDAL()
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
            #region Update Peminjaman Header
            var pinjamDal = new PeminjamanDAL();
            var pinjam = pinjamDal.GetHeaderByNore(header.NoReferensi);
            if (pinjam != null)
            {
                pinjam.Status = true;
            }
            #endregion
            using (var db = new PerpustakaanDbContext())
            {
                #region Insert Header Pengembalian
                int id = 1;
                var listHeader = db.TrReturnHeader.ToList();
                if (listHeader.Count > 0)
                {
                    id = listHeader[listHeader.Count - 1].ID + 1;
                }
                header.IDAnggota = header.IDAnggota;
                header.ModifiedOn = DateTime.Now;
                header.NoRegistrasi = AutoNumberDAL.PengembalianBukuNoRegAutoNumber();
                header.CreatedOn = DateTime.Now;
                header.TanggalPinjam = header.TanggalPinjam;
                header.TanggalKembali = header.TanggalKembali;
                header.TanggalDikembalikan = DateTime.Now;
                //untuk denda
                var ts = new TimeSpan();
                ts = DateTime.Now.Subtract(Convert.ToDateTime(header.TanggalKembali));
                if (ts.Days > 0)
                {
                    header.Denda = true ; //ada denda
                }
                db.TrReturnHeader.Add(header);
                #endregion
                #region Insert Detail Pengembalian
                foreach (var item in detail)
                {
                    var dal = new BukuDAL();
                    var buku = dal.GetBukuByID(item.IDBuku);
                    item.HeaderID = id;
                    item.IDBuku = item.IDBuku;
                    item.LaporKehilangan = item.LaporKehilangan;
                    item.CreatedOn = DateTime.Now;
                    item.ModifiedOn = DateTime.Now;
                    item.Denda = header.Denda;
                    if (item.LaporKehilangan == false)
                    {
                        using (var dbStock = new PerpustakaanDbContext())
                        {
                            #region Update Stock
                            var stock = db.TrStock.FirstOrDefault(n => n.IDBuku == item.IDBuku);
                            if (stock != null)
                            {
                                stock.InStock = true;
                            }
                            #endregion

                            #region Update Cell
                            var cell = dbStock.MstCabinetCell.Where(n => n.ID == buku.Lokasi).FirstOrDefault();
                            if (cell != null)
                            {
                                cell.Terisi += 1;
                                cell.Kosong -= 1;
                            }
                            #endregion

                            #region Update Status Buku
                            if (buku != null)
                            {
                                buku.Aktif = true;
                            }
                            #endregion
                            try
                            {
                                dbStock.SaveChanges();
                            }
                            catch (Exception)
                            {
                                return false;
                            }
                            
                        }

                    }

                }
                #endregion
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

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
        public int ID { get; set; }
        public string NoReferensi { get; set; }
        public string NamaAnggota { get; set; }
        public DateTime TanggalPinjam { get; set; }
        public Nullable<int> IDAnggota { get; set; }
        public DateTime TanggalKembali { get; set; }
        public DateTime TanggalDikembalikan { get; set; }
        public static List<PembayaranDendaDAL> GetPengembalian()
        {
            using (var db = new PerpustakaanDbContext())
            {
                var list = new List<PembayaranDendaDAL>();
                var headerkembali = db.TrReturnHeader.Where(n => n.Denda == true && n.SudahDibayar < 1).ToList();
                foreach (var item in headerkembali)
                {
                    var anggota = db.MstAnggota.FirstOrDefault(n => n.ID == item.IDAnggota);
                    var pembayaran = new PembayaranDendaDAL()
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
        
        public static List<PembayaranDendaDAL> GetPengembalianBySearch(string search)
        {
            using (PerpustakaanDbContext db = new PerpustakaanDbContext())
            {
                //masih ngeload semua datanya abis search
                var headerkembali = db.TrReturnHeader.Where(n => n.Denda == true && n.SudahDibayar < 1).ToList();
                foreach (var item in headerkembali)
                {
                    var result = (from rtr in db.TrReturnHeader
                                  join nama in db.MstAnggota on rtr.IDAnggota equals nama.ID
                                  select new
                                  {
                                      ID = rtr.ID,
                                      NoReferensi = rtr.NoReferensi,
                                      NamaAnggota = nama.Nama,
                                      TanggalPinjam = rtr.TanggalPinjam,
                                      TanggalKembali = rtr.TanggalKembali,
                                      TanggalDikembalikan = rtr.TanggalDikembalikan,
                                  }).Where(a => (a.NoReferensi + a.NamaAnggota).Contains(search)).ToList();
                    var list = new List<PembayaranDendaDAL>();
                    foreach (var cek in result)
                    {
                        var dal = new PembayaranDendaDAL()
                        {
                            NoReferensi = cek.NoReferensi,
                            NamaAnggota = cek.NamaAnggota,
                            TanggalPinjam = Convert.ToDateTime(cek.TanggalPinjam),
                            TanggalKembali = Convert.ToDateTime(cek.TanggalKembali),
                            TanggalDikembalikan = Convert.ToDateTime(cek.TanggalDikembalikan)
                        };
                        list.Add(dal);
                    }
                    return list;
                }
                return null;
            }
        }

        public static PembayaranDendaDAL GetPeminjamanById(int id)
        {
            using (PerpustakaanDbContext db = new PerpustakaanDbContext())
            {
                var cek = db.TrReturnHeader.FirstOrDefault(n => n.ID == id);
                if (cek != null)
                {
                    var anggota = db.MstAnggota.FirstOrDefault(n => n.ID == cek.IDAnggota);
                    if (anggota != null)
                    {
                        var pembayaran = new PembayaranDendaDAL()
                    {
                        ID = cek.ID,
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


        public bool SimpanPembayaranDenda(TrDendaHeader header,List<TrDendaDetail> details, TrReturnHeader retHeader)
        {
            using (var db = new PerpustakaanDbContext())
            {
                var listHeader = db.TrPlcHeader.ToList();
                var id = listHeader[listHeader.Count - 1].ID + 1;
                header.NoRegistrasi = AutoNumberDAL.PembayaranNoRegAutoNumber();
                header.ID = id;                
                header.IDAnggota = header.IDAnggota;                
                header.CreatedOn = DateTime.Now;
                header.ModifiedOn = DateTime.Now;
                db.TrDendaHeader.Add(header);
                foreach (var item in details)
                {
                    item.HeaderID = id;
                    item.IDBuku = item.IDBuku;
                    item.Jumlah = item.Jumlah;
                    item.CreatedOn = DateTime.Now;
                    item.ModifiedOn = DateTime.Now;
                }
                db.TrDendaDetail.AddRange(details);
                var cek = db.TrReturnHeader.FirstOrDefault(n => n.ID == header.ID);
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

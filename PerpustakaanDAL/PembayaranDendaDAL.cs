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

        public DateTime TanggalKembali { get; set; }

        public DateTime TanggalDikembalikan { get; set; }

        public static List<PembayaranDendaDAL> GetPengembalian()
        {
            List<PembayaranDendaDAL> result = new List<PembayaranDendaDAL>();
            using (PerpustakaanDbContext db = new PerpustakaanDbContext())
            {
                result = (from rtr in db.TrReturnHeader
                          join nama in db.MstAnggota on rtr.IDAnggota equals nama.ID
                          select new
                          {
                              ID = rtr.ID,
                              NoReferensi = rtr.NoReferensi,
                              NamaAnggota = nama.Nama,
                              TanggalPinjam = rtr.TanggalPinjam,
                              TanggalKembali = rtr.TanggalKembali,
                              TanggalDikembalikan = rtr.TanggalDikembalikan
                          }).ToList().
                              Select(x => new PembayaranDendaDAL()
                              {
                                  ID = x.ID,
                                  NoReferensi = x.NoReferensi,
                                  NamaAnggota = x.NamaAnggota,
                                  TanggalPinjam = Convert.ToDateTime(x.TanggalPinjam),
                                  TanggalKembali = Convert.ToDateTime(x.TanggalKembali),
                                  TanggalDikembalikan = Convert.ToDateTime(x.TanggalDikembalikan)
                              }).ToList();
            }
            return result;
        }


        public static List<PembayaranDendaDAL> GetPengembalianBySearch(string search)
        {
            using (PerpustakaanDbContext db = new PerpustakaanDbContext())
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
                              }).Where(a => (a.NoReferensi +a.NamaAnggota).Contains(search)).ToList();
                var list = new List<PembayaranDendaDAL>();
                foreach (var item in result)
                {
                    var dal = new PembayaranDendaDAL()
                    {
                        NoReferensi = item.NoReferensi,
                        NamaAnggota = item.NamaAnggota,
                        TanggalPinjam = Convert.ToDateTime(item.TanggalPinjam),
                        TanggalKembali = Convert.ToDateTime(item.TanggalKembali),
                        TanggalDikembalikan = Convert.ToDateTime(item.TanggalDikembalikan)
                    };
                    list.Add(dal);
                }
                return list;
            }
        }

        public static List<PembayaranDendaDAL> GetPeminjamanById(int id)
        {
            using(PerpustakaanDbContext db = new PerpustakaanDbContext())
            {
                var result = (from rtr in db.TrReturnHeader
                              join nama in db.MstAnggota on rtr.IDAnggota equals nama.ID
                              select new
                              {
                                  ID = rtr.ID,
                                  Noreferensi = rtr.NoReferensi,
                                  NamaAnggota = nama.Nama,
                                  TanggalPinjam = rtr.TanggalPinjam,
                                  TanggalKembali = rtr.TanggalKembali,
                                  TanggalDikembalikan = rtr.TanggalDikembalikan
                              }).Where(a => a.ID == id).ToList();
                var list = new List<PembayaranDendaDAL>();
                foreach(var item in result)
                {
                    var dal = new PembayaranDendaDAL()
                    {
                        ID = item.ID,
                        NoReferensi = item.Noreferensi,
                        NamaAnggota = item.NamaAnggota,
                        TanggalPinjam = Convert.ToDateTime(item.TanggalPinjam),
                        TanggalKembali = Convert.ToDateTime(item.TanggalKembali),
                        TanggalDikembalikan = Convert.ToDateTime(item.TanggalDikembalikan)
                    };
                    list.Add(dal);
                }
                return list;
            }
        }
    }
}

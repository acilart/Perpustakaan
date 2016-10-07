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
        public string NoRegistrasi { get; set; }
        public string NoReferensi { get; set; }
        public Nullable<System.DateTime> TanggalPinjam { get; set; }
        public Nullable<System.DateTime> TanggalKembali { get; set; }

        //ini untuk nampilin table peminjaman
        public static List<PengembalianDAL> GetPeminjaman()
        {
            List<PengembalianDAL> result = new List<PengembalianDAL>();
            using (PerpustakaanDbContext db = new PerpustakaanDbContext())
            {
                //masih error terus buat nampilin namanya 

                result = (from Brw in db.TrBrwHeader
                          join cat in db.MstAnggota on Brw.IDAnggota equals cat.ID
                          select new
                          {
                              ID = Brw.ID,
                              NoRegistrasi = Brw.NoRegistrasi,
                              NoReferensi = Brw.NoReferensi,
                              NamaAnggota = cat.Nama,
                              TanggalPinjam = Brw.TanggalPinjam,
                              TanggalKembali = Brw.TanggalKembali

                          }).ToList().
                          Select(x => new PengembalianDAL()
                          {
                              ID = x.ID,
                              NoRegistrasi = x.NoRegistrasi,
                              NoReferensi = x.NoReferensi,
                              NamaAnggota = x.NamaAnggota,
                              TanggalPinjam = x.TanggalPinjam,
                              TanggalKembali = x.TanggalKembali
                          }).ToList();
                //return (courses.ToList());
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
                                  NoRegistrasi = Brw.NoRegistrasi,
                                  NoReferensi = Brw.NoReferensi,
                                  NamaAnggota = cat.Nama,
                                  TanggalPinjam = Brw.TanggalPinjam,
                                  TanggalKembali = Brw.TanggalKembali
                              }).ToList();

                var list = new List<PengembalianDAL>();
                foreach (var item in result)
                {

                    var dal = new PengembalianDAL()
                    {
                        NoRegistrasi = item.NoRegistrasi,
                        NoReferensi = item.NoReferensi,
                        NamaAnggota = item.NamaAnggota,
                        TanggalPinjam = item.TanggalPinjam,
                        TanggalKembali = item.TanggalKembali
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
                                  NoRegistrasi = Brw.NoRegistrasi,
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
                        NoRegistrasi = item.NoRegistrasi,
                        NoReferensi = item.NoReferensi,
                        NamaAnggota = item.NamaAnggota,
                        TanggalPinjam = item.TanggalPinjam,
                        TanggalKembali = item.TanggalKembali
                    };
                    list.Add(dal);
                }
                return list;
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PerpustakaanModel;
using System.Data.Entity;
namespace PerpustakaanDAL
{
  
    public class BukuDAL
    {
        public static List<MstBuku> GetAllBuku()
        {

            using (var db = new PerpustakaanDbContext())
            {
                return db.MstBuku.ToList();
            }

        }

        public static bool SimpanBuku(MstBuku buku)
        {
            using (var db = new PerpustakaanDbContext())
            {
                var cek = db.MstBuku.FirstOrDefault(n => n.ID == buku.ID);
                if (cek != null)
                {
                    cek.IDKategori = buku.IDKategori;
                    cek.IDPenerbit = buku.IDPenerbit;
                    cek.JudulBuku = buku.JudulBuku;
                    cek.ISBN = buku.ISBN;
                    cek.Pengarang = buku.Pengarang;
                    cek.Aktif = buku.Aktif;
                    cek.Value = buku.Value;
                    cek.IDSumberBuku = buku.IDSumberBuku;
                }
                else
                {
                    buku.Kode = AutoNumberDAL.KodeBukuAutoNumber();
                    buku.Aktif = false;
                    db.MstBuku.Add(buku);
                }
                try
                {
                    db.SaveChanges();
                    return true;
                }
                catch (Exception)
                {
                    return false;
                    //throw;
                }
            }
        }

        public static List<MstBuku> GetBukuNonPlaced()
        {
            using (var db = new PerpustakaanDbContext())
            {
                return db.MstBuku.Where(n=>n.Aktif == false && n.Lokasi != null).ToList();
            }
        }
        public  static List<MstBuku> GetBukuHilang()
        {
            using (var db = new PerpustakaanDbContext())
            {
                 return db.MstBuku.Where(n=>n.Aktif == false && n.Lokasi == null).ToList();
            }
        }

        public MstBuku GetBukuByID(int id)
        {
            using (var db = new PerpustakaanDbContext())
            {
                return db.MstBuku.FirstOrDefault(n => n.ID == id);
            }
        }

        public static List<MstBuku> GetBukuAvailable()
        {
            using (var db = new PerpustakaanDbContext())
            {
                var list = new List<MstBuku>();
                var buku = db.MstBuku.ToList();
                var stok = db.TrStock.Where(n => n.InStock == true);
                foreach (var item in stok)
                {
                    list.Add(buku.FirstOrDefault(n => n.ID == item.ID));
                }
                return list;
            }
        }


    }
}
        

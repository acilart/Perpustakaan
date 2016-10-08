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
                }
                catch (Exception)
                {
                    
                    throw;
                }
            }
        }
    }
}
        

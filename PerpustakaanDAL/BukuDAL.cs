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
        public static List<MstBuku> searchBukuByNama(string nama)
        {

            using (var db = new PerpustakaanDbContext())
            {
                var cek = db.MstBuku.Where(n => (n.Kode + n.JudulBuku + n.Pengarang).Contains(nama)).ToList();
                return cek;

            }

        }

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
                    var lokasi = db.MstCabinetCell.FirstOrDefault(n => n.ID == buku.Lokasi);
                    if (lokasi != null)
                    {
                        lokasi.Terisi +=1;
                        lokasi.Kosong -= 1;
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
                    //throw;
                }
            }
        }

        public static List<MstBuku> GetBukuNonPlaced()
        {
            using (var db = new PerpustakaanDbContext())
            {
                var list = db.MstBuku.Where(n => n.Aktif == false && n.Lokasi != null).ToList();
                foreach (var item in list)
                {
                    var dal = new LemariDAL();
                    var lemari = dal.GetLemariByIDCell(Convert.ToInt16(item.Lokasi));
                    if (lemari != null)
                    { 
                        item.LokasiD = lemari.Lokasi;
                    }
                }
                return list;
            }
        }
        public static List<MstBuku> GetBukuHilang()
        {
            using (var db = new PerpustakaanDbContext())
            {
                return db.MstBuku.Where(n => n.Aktif == false && n.Lokasi == null).ToList();
            }
        }

        public MstBuku GetBukuByID(int id)
        {
            using (var db = new PerpustakaanDbContext())
            {
                var buku = db.MstBuku.FirstOrDefault(n => n.ID == id);
                if (buku != null)
                {
                    var dal = new LemariDAL();

                    var lemari = dal.GetLemariByIDCell(Convert.ToInt16(buku.Lokasi));
                    if (lemari != null)
                    { buku.LokasiD = lemari.Lokasi; }



                    return buku;
                }
                return null;
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
                    var cek = buku.FirstOrDefault(n => n.ID == item.IDBuku);
                    if (cek != null)
                    {
                        list.Add(cek);
                    }

                }
                return list;
            }
        }

        public static MstBuku GetBukuPinjam(int id)
        {
            using (var db = new PerpustakaanDbContext())
            {
                var stop = db.MstBuku.FirstOrDefault(n => n.ID == id);
                return stop;
            }
        }

        public static MstBuku GetBukuAvailableByID(int id)
        {
            using (var db = new PerpustakaanDbContext())
            {
                var cek = db.MstBuku.FirstOrDefault(n => n.ID == id);
                if (cek != null)
                {
                    return cek;
                }
                return null;
            }
        }



    }
}


using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PerpustakaanModel;
namespace PerpustakaanDAL
{
    public class AnggotaDAL
    {
        public static List<MstAnggota> GetAllAnggota()
        {
            using (var db = new PerpustakaanDbContext())
            {
                return db.MstAnggota.ToList();
            }
        }

        public static int GetLamaAnggotaByID(int id)
        {
            int lama = 0;
            using (var db = new PerpustakaanDbContext())
            {
                var cek = db.MstAnggota.FirstOrDefault(n => n.ID == id);
                if (cek != null)
                {
                    var ts = new TimeSpan();
                    // menghitung selisih antara hari ini dan createdon
                    ts = DateTime.Now.Subtract(cek.CreatedOn.GetValueOrDefault());
                    lama = ts.Days;
                }
            }
            return lama;
        }

        public static bool SimpanAnggota(MstAnggota anggota)
        {
            using (var db = new PerpustakaanDbContext())
            {
                var cek = db.MstAnggota.FirstOrDefault(n => n.ID == anggota.ID);
                if (cek != null)
                {
                    cek.ID = anggota.ID;
                    cek.Nama = anggota.Nama;
                    cek.KodeAnggota = anggota.KodeAnggota;
                    cek.MasaBerlakuAnggota = anggota.MasaBerlakuAnggota;
                    cek.MasaBerlakuKartu = anggota.MasaBerlakuKartu;
                    cek.ModifiedBy = anggota.ModifiedBy;
                    cek.ModifiedOn = DateTime.Now;
                    cek.NoTelepon = anggota.NoTelepon;
                    cek.IDKecamatan = anggota.IDKecamatan;
                    cek.IDKelurahan = anggota.IDKelurahan;
                    cek.IDProvinsi = anggota.IDProvinsi;
                    cek.IDKota = anggota.IDKota;
                    cek.Alamat = anggota.Alamat;
                }
                else
                {
                    anggota.CreatedOn = DateTime.Now;
                    anggota.MasaBerlakuKartu = DateTime.Now.AddMonths(3);
                    anggota.MasaBerlakuAnggota = DateTime.Now.AddYears(1);
                    db.MstAnggota.Add(anggota);
                }
                try
                {
                    db.SaveChanges();
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }
            }
        }

        public static bool DeleteAnggota(int id)
        {
            using (var db = new PerpustakaanDbContext())
            {
                var cek = db.MstAnggota.FirstOrDefault(n => n.ID == id);
                if (cek != null)
                {
                    db.MstAnggota.Remove(cek);
                    try
                    {
                        db.SaveChanges();
                        return true;
                    }
                    catch (Exception)
                    {
                        return false;
                        //  throw;
                    }
                }
                return false;

            }
        }

        public MstAnggota GetAnggotaByID(int id)
        {
            using (var db = new PerpustakaanDbContext())
            {
                var cek = db.MstAnggota.FirstOrDefault(n => n.ID == id);
                if (cek != null)
                {
                    return cek;
                }
                return null;
            }
        }
    }
}

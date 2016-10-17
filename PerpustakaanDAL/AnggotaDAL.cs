using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PerpustakaanModel;
using Perpustakaan.ViewModel;
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
                    cek.Email = anggota.Email;
                }
                else
                {
                    anggota.KodeAnggota = AutoNumberDAL.KodeAnggotaAutoNumber();
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

        public static bool SimpanAnggotaIuran(MstAnggota anggota, List<IuranViewModel> iurans)
        {
            List<IuranViewModel> form = new List<IuranViewModel>();
            using (var db = new PerpustakaanDbContext())
            {
                int idHead = 0;
                var lisHead = db.TrScnHeader.ToList();
                if (lisHead.Count > 0)
                {
                    idHead = lisHead[lisHead.Count - 1].ID;
                }
                idHead += 1;
                var header = new TrScnHeader() 
                {
                    ID = idHead,
                    CreatedOn = DateTime.Now,
                    NoRegistrasi = AutoNumberDAL.IuranNoRegAutoNumber(),
                    ModifiedOn = DateTime.Now
                };

                var cek = db.MstAnggota.FirstOrDefault(n => n.ID == anggota.ID);
                if (cek != null)
                {
                    header.IDAnggota = cek.ID;
                    cek.Nama = anggota.Nama;
                    var masaAnggota = iurans.FirstOrDefault(n => n.ID == 1);
                    if(masaAnggota != null)
                    {
                        cek.MasaBerlakuAnggota =DateTime.Now.AddMonths(3);
                    }
                    var masaKartu = iurans.FirstOrDefault(n => n.ID == 2);
                    if (masaKartu != null)
                    {
                        cek.MasaBerlakuKartu = DateTime.Now.AddYears(1);
                    }
                   
                    cek.ModifiedBy = anggota.ModifiedBy;
                    cek.ModifiedOn = DateTime.Now;
                    cek.NoTelepon = anggota.NoTelepon;
                    cek.IDKecamatan = anggota.IDKecamatan;
                    cek.IDKelurahan = anggota.IDKelurahan;
                    cek.IDProvinsi = anggota.IDProvinsi;
                    cek.IDKota = anggota.IDKota;
                    cek.Alamat = anggota.Alamat;
                    cek.Email = anggota.Email;
                    //panggil fungsi 
                }
                else
                {
                    int id = 0;
                    var lis = db.MstAnggota.ToList();
                    if (lis.Count > 0)
                    {
                        id = lis[lis.Count - 1].ID;
                    }
                    id += 1;
                    anggota.ID = id;
                    header.ID = id;
                    anggota.KodeAnggota = AutoNumberDAL.KodeAnggotaAutoNumber();
                    anggota.CreatedOn = DateTime.Now;
                    anggota.MasaBerlakuKartu = DateTime.Now.AddMonths(3);
                    anggota.MasaBerlakuAnggota = DateTime.Now.AddYears(1);
                    db.MstAnggota.Add(anggota);
                    //for(int i=0;i<iuran.TipeIuran.Count;i++)
                }
                db.TrScnHeader.Add(header);
                var list = new List<TrScnDetail>();
                foreach (var item in iurans)
                {
                    var scn = new TrScnDetail()
                    {
                        HeaderID = header.ID,
                        IDTipeIuran = item.ID,
                        CreatedOn = DateTime.Now,
                        ModifiedOn=DateTime.Now
                    };
                    list.Add(scn);
                }
                db.TrScnDetail.AddRange(list);
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

        public static MstAnggota GetAnggotaByID(int ID)
        {
            using (var db = new PerpustakaanDbContext())
            {
                var cek = db.MstAnggota.FirstOrDefault(n => n.ID == ID);
                if (cek != null)
                {
                    return cek;
                }
                return null;
            }
        }


        public static List<MstAnggota> searchAnggotaByNama(string nama)
        {

            using (var db = new PerpustakaanDbContext())
            {
                var cek = db.MstAnggota.Where(n => n.Nama.Contains(nama)).ToList();
                return cek;

            }



        }

        public static List<MstAnggota> searchAnggotaByTelp(string telp)
        {
            using (var db = new PerpustakaanDbContext())
            {
                var cek = db.MstAnggota.Where(n => n.NoTelepon.Contains(telp)).ToList();
                return cek;
            }
        }

        public static List<MstAnggota> searchAnggotaByKode(string kode)
        {
            using (var db = new PerpustakaanDbContext())
            {
                var cek = db.MstAnggota.Where(n => n.KodeAnggota.Contains(kode)).ToList();
                return cek;
            }

        }

        public static List<MstAnggota> searchAnggotaByEmail(string email)
        {
            using (var db = new PerpustakaanDbContext())
            {
                var cek = db.MstAnggota.Where(n => n.Email.Contains(email)).ToList();
                return cek;
            }

        }

        public static List<MstAnggota> searchAnggotaByAlamat(string alamat)
        {
            using (var db = new PerpustakaanDbContext())
            {
                var cek = db.MstAnggota.Where(n => n.Alamat.Contains(alamat)).ToList();
                return cek;
            }

        }

       
        
        public static MstAnggota GetAnggotaBySearch(string kode, string nama)
        {
            using (var db = new PerpustakaanDbContext())
            {
                var cek = db.MstAnggota.FirstOrDefault(n => n.KodeAnggota == kode && n.Nama == nama);
                if (cek != null)
                {
                    return cek;
                }
                return null;
            }
        }
    }
}
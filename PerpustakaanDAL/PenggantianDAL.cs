using PerpustakaanModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity;

namespace PerpustakaanDAL
{
    public class PenggantianDAL
    {
        public static List<Penggantian> GetPenggantianBuku()
        {
            using (var db = new PerpustakaanDbContext())
            {
                var list = new List<Penggantian>();
                var headerpeng = db.TrRpcHeader.ToList();
                foreach (var item in headerpeng)
                {
                    var detPeng = db.TrRpcDetail.Where(n => n.IDOpsiPenggantian == 1 && n.HeaderID == item.ID);
                    if (detPeng.Count() > 0)
                    {
                        var anggota = db.MstAnggota.FirstOrDefault(n => n.ID == item.IDAnggota);
                        var penggantian = new Penggantian()
                        {
                            ID = item.ID,
                            NamaAnggota = anggota.Nama,
                            NoRegistrasi = item.NoRegistrasi,
                            Tanggal = Convert.ToDateTime(item.Tanggal)
                        };
                        list.Add(penggantian);
                    }
                }
                return list;
            }
        }

        public static List<Penggantian> GetPenggantian()
        {
            using (var db = new PerpustakaanDbContext())
            {
                var list = new List<Penggantian>();
                var headerpeng = db.TrRpcHeader.ToList();
                foreach (var item in headerpeng)
                {
                    var anggota = db.MstAnggota.FirstOrDefault(n => n.ID == item.IDAnggota);
                        var penggantian = new Penggantian()
                        {
                            ID = item.ID,
                            NamaAnggota = anggota.Nama,
                            NoRegistrasi = item.NoRegistrasi,
                            Tanggal = Convert.ToDateTime(item.Tanggal)
                        };
                        list.Add(penggantian);
                }
                return list;
            }
        }

        public static List<Penggantian> GetPenggantianTunai()
        {
            using (var db = new PerpustakaanDbContext())
            {
                var list = new List<Penggantian>();
                var headerpeng = db.TrRpcHeader.ToList();
                foreach (var item in headerpeng)
                {
                    var detPeng = db.TrRpcDetail.Where(n => n.IDOpsiPenggantian == 2 && n.HeaderID == item.ID);
                    if (detPeng.Count() > 0)
                    {
                        var anggota = db.MstAnggota.FirstOrDefault(n => n.ID == item.IDAnggota);
                        var penggantian = new Penggantian()
                        {
                            ID = item.ID,
                            IDAnggota = anggota.ID,
                            NamaAnggota = anggota.Nama,
                            NoRegistrasi = item.NoRegistrasi,
                            Tanggal = Convert.ToDateTime(item.Tanggal)
                        };
                        list.Add(penggantian);
                    }


                }
                return list;
            }
        }

        public static Penggantian GetPenggantianByID(int id)
        {
            using (var db = new PerpustakaanDbContext())
            {
                var cek = db.TrRpcHeader.FirstOrDefault(n => n.ID == id);
                if (cek != null)
                {
                    var anggota = db.MstAnggota.FirstOrDefault(n => n.ID == cek.IDAnggota);
                    if (anggota != null)
                    {
                        var peng = new Penggantian()
                        {
                            ID = cek.ID,
                            IDAnggota=anggota.ID,
                            NoRegistrasi = cek.NoRegistrasi,
                            NamaAnggota = anggota.Nama,
                            Tanggal = DateTime.Now
                        };
                        return peng;
                    }
                    return null;
                }
                return null;
            }
        }

        public static bool SimpanPenggantian(TrRpcHeader header, List<TrRpcDetail> details, List<TrReturnDetail> detailReturn)
        {
            using (var db = new PerpustakaanDbContext())
            {
                var listHeader = db.TrRpcHeader.ToList();
                
                int id = 1;
                if (listHeader.Count > 0)
                {
                    id = listHeader[listHeader.Count - 1].ID + 1;
                }
                header.NoRegistrasi = AutoNumberDAL.PenggantianBukuNoRegAutoNumber();
                header.ID = id;
                header.IDAnggota = header.IDAnggota;
                header.Tanggal = header.Tanggal;
                header.NoReferensi = header.NoReferensi;
                header.CreatedOn = DateTime.Now;
                header.CreatedBy = header.CreatedBy;
                header.ModifiedOn = DateTime.Now;
                db.TrRpcHeader.Add(header);
                foreach (var item in details)
                {                    
                    int iddetails = 1;
                    if (details.Count > 0)
                    {
                        iddetails = details[details.Count - 1].ID + 1;
                    }
                    item.HeaderID = id;
                    item.ID = iddetails;
                    item.IDBuku = item.IDBuku;
                    item.Alasan = item.Alasan;
                    item.IDOpsiPenggantian = item.IDOpsiPenggantian;
                    item.HargaPenggantian = item.HargaPenggantian;
                    item.BiayaAdmin = item.BiayaAdmin;
                    item.CreatedOn = DateTime.Now;
                    item.CreatedBy = header.CreatedBy;
                    item.ModifiedOn = DateTime.Now;
                }
                db.TrRpcDetail.AddRange(details);
                foreach (var item in detailReturn)
                {
                    var cek = db.TrReturnDetail.FirstOrDefault(n => n.ID == item.ID && n.IDBuku == item.IDBuku);
                    if (cek != null)
                    {
                        cek.SudahDiganti = true;
                    }

                }
                try
                {
                    db.SaveChanges();
                    return true;
                }
                catch (Exception)
                {
                    
                    throw;
                }
            }
            
        }

        public static List<Penggantian> GetPengembalian()
        {
            using(var db = new PerpustakaanDbContext())
            {
                var list = new List<Penggantian>();
                var headerganti = db.TrReturnHeader.ToList();
                foreach (var item in headerganti)
                {
                    var detailganti = db.TrReturnDetail.Where(n => n.LaporKehilangan == true && n.SudahDiganti == false);
                    if (detailganti.Count() > 0)
                    {
                        var anggota = db.MstAnggota.FirstOrDefault(n => n.ID == item.IDAnggota);
                        var penggantian = new Penggantian()
                        {
                            ID = item.ID,
                            IDAnggota = anggota.ID,
                            NamaAnggota = anggota.Nama,
                            NoReferensi = item.NoReferensi,                            
                        };
                        list.Add(penggantian);
                    }                    
                }
                return list;
            }           
        }

        public static Penggantian GetPengembalianById(int id)
        {
            using (PerpustakaanDbContext db = new PerpustakaanDbContext())
            {
                var cek = db.TrReturnHeader.FirstOrDefault(n => n.ID == id);
                if (cek != null)
                {
                    var anggota = db.MstAnggota.FirstOrDefault(n => n.ID == cek.IDAnggota);
                    if (anggota != null)
                    {
                        var penggantian = new Penggantian()
                    {
                        ID = cek.ID,
                        IDAnggota = anggota.ID,
                        NamaAnggota = anggota.Nama,
                        NoReferensi = cek.NoRegistrasi,
                    };
                    return penggantian;
                    }
                }
                return null;
            }
        }

        //untuk mengambil data buku yang akan diganti
        public static List<Penggantian> GetBukuHilang(int id)
        {
            List<Penggantian> result = new List<Penggantian>();
            using (PerpustakaanDbContext db = new PerpustakaanDbContext())
            {                
                var header = db.TrReturnHeader.FirstOrDefault(n => n.ID == id);
                var detail = db.TrReturnDetail.Where(n => n.HeaderID == id && n.LaporKehilangan == true);
                foreach (var item in detail)
                {                
                    var dal = new BukuDAL();
                    var buku = dal.GetBukuByID(item.IDBuku);                    
                    var penggantian = new Penggantian()
                    {
                        IDdetail = item.ID,
                        IDBuku = buku.ID,
                        KodeBuku = buku.Kode,
                        JudulBuku = buku.JudulBuku,
                        HargaPenggantian = buku.Value,
                        BiayaAdmin = 5000
                    };
                    result.Add(penggantian);                
                }
                return result;
            }
        }
                
        
    }
}

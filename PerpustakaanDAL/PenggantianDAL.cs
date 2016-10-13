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

        public bool SimpanPenggantian(TrRpcHeader header, List<TrRpcDetail> details, List<TrReturnDetail> detailReturn)
        {
            using (var db = new PerpustakaanDbContext())
            {
                var listHeader = db.TrPlcHeader.ToList();
                var id = listHeader[listHeader.Count - 1].ID + 1;
                header.NoRegistrasi = AutoNumberDAL.PenggantianBukuNoRegAutoNumber();
                header.ID = id;
                header.CreatedOn = DateTime.Now;
                header.ModifiedOn = DateTime.Now;
                db.TrRpcHeader.Add(header);
                foreach (var item in details)
                {
                    item.HeaderID = id;
                    item.CreatedOn = DateTime.Now;
                    item.ModifiedOn = DateTime.Now;
                }
                db.TrRpcDetail.AddRange(details);
                foreach (var item in detailReturn)
                {
                    item.SudahDiganti = true;
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
            List<Penggantian> result = new List<Penggantian>();
            using (PerpustakaanDbContext db = new PerpustakaanDbContext())
            {
                
                 
                result =(from Rtr in db.TrReturnHeader
                             join nama in db.MstAnggota on Rtr.IDAnggota equals nama.ID
                             
                             select new
                             {
                                 ID = Rtr.ID,
                                 NoRegistrasi = Rtr.NoRegistrasi,
                                 NamaAnggota = nama.Nama,
                                 Tanggal =DateTime.Now
                             }).ToList().
                                 Select(x=> new Penggantian()
                                 {
                                     ID = x.ID,
                                     NoRegistrasi = x.NoRegistrasi,
                                     NamaAnggota =x.NamaAnggota,
                                     Tanggal = x.Tanggal
                                 }).ToList();
                
            }
            return result;
        }

    }
}

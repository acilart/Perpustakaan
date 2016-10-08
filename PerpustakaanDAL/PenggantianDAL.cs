using PerpustakaanModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

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

        public Penggantian GetPenggantianByID(int id)
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

    }
}

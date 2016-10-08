using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PerpustakaanDAL
{
    public class PenggantianDAL
    {
        public List<Penggantian> GetPenggantian() 
        {
            using (var db = new PerpustakaanDbContext())
            {
                var list = new List<Penggantian>();
                var headerpeng = db.TrRpcHeader.ToList();
                foreach (var item in headerpeng)
                {
                    var detPeng = db.TrRpcDetail.Where(n => n.IDOpsiPenggantian == 1 && n.HeaderID== item.ID);
                    if(detPeng.Count()>0)
                    {
                        var anggota = db.MstAnggota.FirstOrDefault(n => n.ID == item.IDAnggota);
                        var penggantian = new Penggantian()
                        {
                            ID = item.ID,
                            NamaAnggota = anggota.Nama,
                            NoRegistrasi = item.NoRegistrasi,
                            Tanggal = item.Tanggal
                        };
                        list.Add(penggantian);
                    }
                    
                    
                }
                return list;
            }
        }


    }
}

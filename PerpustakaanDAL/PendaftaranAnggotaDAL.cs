using PerpustakaanModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerpustakaanDAL
{
   public class PendaftaranAnggotaDAL
    {
       public bool SimpanPendaftaran(MstAnggota anggota, TrScnHeader header, List<TrScnDetail> details)
       {
           using (var db = new PerpustakaanDbContext())
           {
               anggota.CreatedOn = DateTime.Now;
               anggota.ModifiedOn = DateTime.Now;
               anggota.KodeAnggota = AutoNumberDAL.KodeAnggotaAutoNumber();
               var nama = anggota.Nama.Split(' '); 
               anggota.Password = nama[0] + DateTime.Now.Month.ToString("MM") + DateTime.Now.Day.ToString("dd");
               db.MstAnggota.Add(anggota);

                var id = db.TrScnHeader.ToList().Count + 1;
                header.ID = id;
               header.CreatedOn = DateTime.Now;
               header.ModifiedOn = DateTime.Now;
               header.NoRegistrasi = AutoNumberDAL.IuranNoRegAutoNumber();
               db.TrScnHeader.Add(header);

               foreach (var item in details)
               {
                   item.HeaderID = id;
                   item.CreatedOn = DateTime.Now;
                   item.ModifiedOn = DateTime.Now;
               }
               db.TrScnDetail.AddRange(details);

               try
               {
                   db.SaveChanges();
                   return true;
               }
               catch (Exception)
               {
                   return false;
                   throw;
               }
           }
       }
    }
}

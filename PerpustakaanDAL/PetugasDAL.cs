using Perpustakaan.ViewModel;
using PerpustakaanModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerpustakaanDAL
{
    public class PetugasDAL
    {
        public static MstPetugas GetPetugasByID(int id)
        {
            using (var db=new PerpustakaanDbContext())
            {
                return db.MstPetugas.FirstOrDefault(n => n.ID == id);
            }
        }

        public static bool InsertPetugas(PetugasViewModel baru)
        {
            bool result = true;
            try
            {
                MstPetugas petugas = new MstPetugas();
                petugas.ID = baru.ID;
                petugas.Kode = baru.Kode;
                petugas.Nama = baru.Nama;
                petugas.Alamat = baru.Alamat;
                petugas.Email = baru.Email;
                petugas.Password = baru.Password;
                petugas.NoTelepon = baru.NoTelepon;

                using (PerpustakaanDbContext db = new PerpustakaanDbContext())
                {
                    var existPetugas = (
                        from data in db.MstPetugas
                        where data.ID == baru.ID
                        select data).FirstOrDefault();
                    if (existPetugas != null)
                    {
                        existPetugas.Kode = baru.Kode;
                        existPetugas.Nama = baru.Nama;
                        existPetugas.Alamat = baru.Alamat;
                        existPetugas.Email = baru.Email;
                        existPetugas.Password = baru.Password;
                        existPetugas.NoTelepon = baru.NoTelepon;
                    }
                    else
                    {
                        db.MstPetugas.Add(petugas);
                    }
                    db.SaveChanges();
                }
            }
            catch
            {
                result = false;
            }
            return result;
        }

    }
}

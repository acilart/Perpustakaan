using PerpustakaanModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerpustakaanDAL
{
    public class LoginDAL
    {

        public static MstPetugas GetPetugasByEmailPass(string email, string password)
        {
            using (var db = new PerpustakaanDbContext())
            {
                var cek = db.MstPetugas.FirstOrDefault(n => n.Email == email && n.Password == password);
                if (cek != null)
                {
                    return cek;
                }
                return null;
            }
        }

        public static MstAnggota GetAnggotaByEmail(string email, string password)
        {
            using (var db = new PerpustakaanDbContext())
            {
                var cek = db.MstAnggota.FirstOrDefault(n => n.Email == email);
                if (cek != null)
                {
                    return cek;
                }
                return null;
            }
        }
    }
}

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
        public MstPetugas GetPetugasByID(int id)
        {
            using (var db=new PerpustakaanDbContext())
            {
                return db.MstPetugas.FirstOrDefault(n => n.ID == id);
            }
        }

        public static MstPetugas GetPropinsiByEmailPass(string email, string password)
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
    }
}

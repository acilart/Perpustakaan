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

    }
}

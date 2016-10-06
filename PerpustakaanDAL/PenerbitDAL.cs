using PerpustakaanModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerpustakaanDAL
{
    public class PenerbitDAL
    {
        public static List<MstPenerbit> GetPenerbit()
        {
            using (var db= new PerpustakaanDbContext())
            {
                return db.MstPenerbit.ToList();
            }
        }

        public static MstPenerbit GetPenerbitByID(int id)
        {
            using (var db = new PerpustakaanDbContext())
            {
                return db.MstPenerbit.FirstOrDefault(n=>n.ID == id);
            }

        }
    }
}

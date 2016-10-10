using PerpustakaanModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerpustakaanDAL
{
    public class CabinetDAL
    {
        public List<MstCabinet> GetAllCabinet()
        {
            using (var db= new PerpustakaanDbContext())
            {
                return db.MstCabinet.ToList();
            }
        }

        public MstCabinet GetCabinetByID(int id)
        {
            using (var db = new PerpustakaanDbContext())
            {
                return db.MstCabinet.FirstOrDefault(n=>n.ID == id);
            }
        }

        
    }
}

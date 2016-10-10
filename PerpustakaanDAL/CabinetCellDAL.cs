using PerpustakaanModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerpustakaanDAL
{
    public class CabinetCellDAL
    {
        public static List<MstCabinetCell> GetAllCabinetCell()
        {
            using (var db=new PerpustakaanDbContext())
            {
                return db.MstCabinetCell.ToList();
            }
        }

        public MstCabinetCell GetCellByID( int id)
        {
            using (var db = new PerpustakaanDbContext())
            {
                return db.MstCabinetCell.FirstOrDefault(n=>n.ID == id);
            }
        }

        public static List<MstCabinetCell> GetCabineCellAvailableByIdRow(int id)
        {
            using (var db=new PerpustakaanDbContext())
            {
                return db.MstCabinetCell.Where(n => n.IDBaris == id && n.Kosong > 0).ToList();
            }
        }
    }
}

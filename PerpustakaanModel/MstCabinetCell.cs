using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerpustakaanModel
{
    [Table("T_MST_CABINET_CELL")]
    public class MstCabinetCell
    {
        public int ID { get; set; }
        public int IDBaris { get; set; }
         [MaxLength(2)]
        public string Kode { get; set; }
        public int Kapasitas { get; set; }
        public int Terisi { get; set; }
        public int Kosong { get; set; }
    
    }
}

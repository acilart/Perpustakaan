using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerpustakaanModel
{
    [Table("T_MST_CABINET")]
    public class MstCabinet
    {
        public int ID { get; set; }
        public string Kode { get; set; }
        public Nullable<int> Kapasitas { get; set; }
    }
}

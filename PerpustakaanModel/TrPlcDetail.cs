using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerpustakaanModel
{
    [Table("T_R_PLC_DETAIL")]
    public class TrPlcDetail
    {
        public int ID { get; set; }
        public Nullable<int> HeaderID { get; set; }

        public string JudulBuku { get; set; }
        [MaxLength(20)]
        public string ISBN { get; set; }
        public string Pengarang { get; set; }
        public Nullable<int> Lokasi { get; set; }
        public Nullable<decimal> NilaiBuku { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }

    }
}

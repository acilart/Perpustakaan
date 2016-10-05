using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerpustakaanModel
{
    [Table("T_R_PLC_HEADER")]
    public class TrPlcHeader
    {
        public int ID { get; set; }
        public Nullable<int> IDSumberBuku { get; set; }
        public Nullable<System.DateTime> Tanggal { get; set; }
        [MaxLength(20)]
        public string NoRegistrasi { get; set; }
        [MaxLength(20)]
        public string NoReferensi { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }

    }
}

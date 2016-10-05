using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerpustakaanModel
{
    [Table("T_R_RPC_DETAIL")]
    public class TrRpcDetail
    {
        public int ID { get; set; }
        public Nullable<int> HeaderID { get; set; }
        public Nullable<int> IDBuku { get; set; }
        [MaxLength(50)]
        public string Alasan { get; set; }
        public Nullable<int> IDOpsiPenggantian { get; set; }
        public Nullable<decimal> HargaPenggantian { get; set; }
        public Nullable<decimal> BiayaAdmin { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }

    }
}

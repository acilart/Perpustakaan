using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerpustakaanModel
{
    [Table("T_R_DENDAHEADER")]
    public class TrDendaHeader
    {
        public int ID { get; set; }
        public Nullable<int> IDAnggota { get; set; }
        public string NoRegistrasi { get; set; }
        public string NoReferensi { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }
    
    }
}

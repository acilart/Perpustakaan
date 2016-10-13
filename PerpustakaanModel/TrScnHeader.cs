using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerpustakaanModel
{
    [Table("T_R_SCN_HEADER")]
    public class TrScnHeader
    {
        public int ID { get; set; }
           [MaxLength(20)]
        public string NoRegistrasi { get; set; }
        public Nullable<int> IDAnggota { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
    }
}

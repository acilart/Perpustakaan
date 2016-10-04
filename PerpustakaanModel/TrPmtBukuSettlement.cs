using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerpustakaanModel
{
    [Table("T_R_PMT_BUKU_SETTLEMENT")]
    public class TrPmtBukuSettlement
    {
        public int ID { get; set; }
        public int IDPMTDetail { get; set; }
        public Nullable<int> PembayaranKe { get; set; }
        public Nullable<decimal> Jumlah { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }
    
    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerpustakaanModel
{
    [Table("T_R_RETURN_DETAIL")]
    public class TrReturnDetail
    {
        public int ID { get; set; }
        public int HeaderID { get; set; }
        public int IDBuku { get; set; }
        public Nullable<bool> LaporKehilangan { get; set; }
        public Nullable<bool> SudahDiganti { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }
        public Nullable<bool> Denda { get; set; }
        public Nullable<bool> SudahDibayar { get; set; }
    
    }
}

﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerpustakaanModel
{
    [Table("T_R_PMT_BUKU_DETAIL")]
    public class TrPmtBukuDetail
    {
        public int ID { get; set; }
        public int HeaderID { get; set; }
        public int IDBuku { get; set; }
        public Nullable<decimal> Value { get; set; }
        public Nullable<bool> IsCompleted { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }

        [NotMapped]
        public Nullable<decimal> JumlahBayar { get; set; }

        [NotMapped]
        public int PembayaranKe { get; set; }
    }
}

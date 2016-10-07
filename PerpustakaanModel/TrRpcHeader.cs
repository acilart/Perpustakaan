﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerpustakaanModel
{
    [Table("T_R_RPC_HEADER")]
    public class TrRpcHeader
    {
        public int ID { get; set; }
        public Nullable<int> IDAnggota { get; set; }
           [MaxLength(20)]
        public string NoRegistrasi { get; set; }
           [MaxLength(20)]
        public string NoReferensi { get; set; }
        public Nullable<System.DateTime> Tanggal { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }
    }
}

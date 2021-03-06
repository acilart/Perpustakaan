﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerpustakaanModel
{
    [Table("T_MST_CABINET_ROW")]
    public class MstCabinetRow
    {
        public int ID { get; set; }
        public int IDRak { get; set; }
         [MaxLength(2)]
        public string Kode { get; set; }
        public Nullable<int> Kapasitas { get; set; }
    }
}

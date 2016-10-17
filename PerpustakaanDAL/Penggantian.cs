using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PerpustakaanDAL
{
    public class Penggantian
    {
        public int ID { get; set; }

        public int IDdetail { get; set; }
        public int IDAnggota { get; set; }
        public string NoRegistrasi { get; set; }
        public string NoReferensi { get; set; }
        public string NamaAnggota { get; set; }
        public DateTime Tanggal { get; set; }

        //prop untuk buku yang hilang
        public int IDBuku { get; set; }
        public string KodeBuku { get; set; }
        public string JudulBuku { get; set; }
      
        public string Alasan { get; set; }
        public Nullable<int> IDOpsiPenggantian { get; set; }
        public Nullable<decimal> HargaPenggantian { get; set; }
        public Nullable<decimal> BiayaAdmin { get; set; }


    }
}

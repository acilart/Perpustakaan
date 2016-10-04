using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations.Schema;

namespace PerpustakaanModel
{
   [Table("T_MST_ANGGOTA")]
    public class MstAnggota
    {
        public int ID { get; set; }
        public string KodeAnggota { get; set; }
        public string Nama { get; set; }
        public string Alamat { get; set; }
        public Nullable<int> IDProvinsi { get; set; }
        public Nullable<int> IDKota { get; set; }
        public Nullable<int> IDKecamatan { get; set; }
        public Nullable<int> IDKelurahan { get; set; }
        public string Email { get; set; }
        public string NoTelepon { get; set; }
        public System.DateTime MasaBerlakuKartu { get; set; }
        public System.DateTime MasaBerlakuAnggota { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }
        public Nullable<int> ModifiedBy { get; set; }

    }
}

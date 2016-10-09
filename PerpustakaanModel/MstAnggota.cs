using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace PerpustakaanModel
{
    [Table("T_MST_ANGGOTA")]
    public class MstAnggota
    {
        public int ID { get; set; }

        [MaxLength(20)]
        public string KodeAnggota { get; set; }
        [MaxLength(50)]
        public string Nama { get; set; }
        [MaxLength(50)]
        public string Password { get; set; }
        public string Alamat { get; set; }
        public Nullable<int> IDProvinsi { get; set; }
        public Nullable<int> IDKota { get; set; }
        public Nullable<int> IDKecamatan { get; set; }
        public Nullable<int> IDKelurahan { get; set; }
        [MaxLength(50)]
        public string Email { get; set; }
        [MaxLength(20)]
        public string NoTelepon { get; set; }
        public System.DateTime MasaBerlakuKartu { get; set; }
        public System.DateTime MasaBerlakuAnggota { get; set; }
        public DateTime? CreatedOn { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }
        public Nullable<int> ModifiedBy { get; set; }



    }
}

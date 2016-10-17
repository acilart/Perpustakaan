using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerpustakaanModel
{
    [Table("T_R_RETURN_HEADER")]
    public class TrReturnHeader
    {
        public int ID { get; set; }
           [MaxLength(20)]
        public string NoRegistrasi { get; set; }
           [MaxLength(20)]
        public string NoReferensi { get; set; }
        public Nullable<int> IDAnggota { get; set; }
        public Nullable<System.DateTime> TanggalPinjam { get; set; }

        public Nullable<System.DateTime> TanggalKembali { get; set; }
        public Nullable<System.DateTime> TanggalDikembalikan { get; set; }
        
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }
        public Nullable<bool> ModifiedBy { get; set; }
        public Nullable<bool> Denda { get; set; }
        public Nullable<int> SudahDibayar { get; set; }

        [NotMapped]
        public int IDBorrow { get; set; }
    }
}

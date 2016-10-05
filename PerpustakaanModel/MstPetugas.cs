using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerpustakaanModel
{
    [Table("T_MST_PETUGAS")]
    public class MstPetugas
    {
        public int ID { get; set; }
        [MaxLength(10)]
        public string Kode { get; set; }
        [MaxLength(50)]
        public string Nama { get; set; }
        [MaxLength(50)]
        public string Alamat { get; set; }
        [MaxLength(20)]
        public string Email { get; set; }

        public string Password { get; set; }

        [MaxLength(20)]
        public string NoTelepon { get; set; }
    }
}

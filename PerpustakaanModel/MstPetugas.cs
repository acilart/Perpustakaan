using System;
using System.Collections.Generic;
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
        public string Kode { get; set; }
        public string Nama { get; set; }
        public string Alamat { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string NoTelepon { get; set; }
    }
}

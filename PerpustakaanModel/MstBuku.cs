using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerpustakaanModel
{
    [Table("T_MST_BUKU")]
    public class MstBuku
    {
        public int ID { get; set; }
        public int IDKategori { get; set; }
        public int IDPenerbit { get; set; }
         [MaxLength(20)]
        public string Kode { get; set; }
        public string JudulBuku { get; set; }
         [MaxLength(50)]
        public string ISBN { get; set; }
        public string Pengarang { get; set; }
        public Nullable<int> Lokasi { get; set; }
        public Nullable<bool> Aktif { get; set; }
        public Nullable<decimal> Value { get; set; }
        public Nullable<int> IDSumberBuku { get; set; }
    
    }
}

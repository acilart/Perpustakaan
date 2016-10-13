using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Perpustakaan.ViewModel
{
    public class BrwHeaderViewModel
    {
        public int ID { get; set; }
        public string NoRegistrasi { get; set; }
        public string NoReferensi { get; set; }
        public Nullable<int> IDAnggota { get; set; }
        public string NamaAnggota { get; set; }
        public Nullable<System.DateTime> TanggalPinjam { get; set; }
        public Nullable<System.DateTime> TanggalKembali { get; set; }
    }
}

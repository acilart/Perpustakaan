using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Perpustakaan.ViewModel
{
    public class PengembalianViewModel
    {
        public string NamaAnggota { get; set; }
        public int ID { get; set; }
        public Nullable<int> IDAnggota { get; set; }
        public string NoReferensi { get; set; }
        public DateTime TanggalPinjam { get; set; }
        public DateTime TanggalKembali { get; set; }
        public DateTime TanggalDikembalikan { get; set; }

        //ini property untuk tampilan di form pengembalian
        public int IDBuku { get; set; }
        public int Terlambat { get; set; }
        public bool IsKehilangan { get; set; }
        public string Judul { get; set; }
        public string KodeMstBuku { get; set; }
        public double denda { get; set; }
    }
}

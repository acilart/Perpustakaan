using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Perpustakaan.ViewModel
{
    public class PembayaranDendaViewModel
    {
        public int ID { get; set; }
        public string NoReferensi { get; set; }
        public string NamaAnggota { get; set; }
        public DateTime TanggalPinjam { get; set; }
        public Nullable<int> IDAnggota { get; set; }
        public DateTime TanggalKembali { get; set; }
        public DateTime TanggalDikembalikan { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Perpustakaan.ViewModel
{
    public class ListPinjamanViewModel
    {
        public int ID { get; set; }
        public string NoRegistrasi { get; set; }
        public string  Nama { get; set; }
        public Nullable<System.DateTime> TglPinjam { get; set; }
        public Nullable<System.DateTime> TglKembali { get; set; }
        public int JumlahBuku { get; set; }
        public string KodeBuku { get; set; }
        public string JudulBuku { get; set; }
        public DateTime TglTelat { get; set; }
        public int Denda { get; set; }
        public int Terlambat { get; set; }
        public int IDAnggota { get; set; }


       
    }
}

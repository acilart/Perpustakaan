using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Perpustakaan.ViewModel
{
    public class LemariViewModel
    {
        public string Lokasi { get; set; }
        public string Deskripsi { get; set; }
        public int IDCell { get; set; }
        public int Kapasitas { get; set; }
        public int Terisi { get; set; }
        public int Kosong { get; set; }

    }
}

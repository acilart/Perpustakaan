using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerpustakaanDAL
{
    public class Pembayaran
    {
        public string KodeBuku { get; set; }
        public string JudulBuku { get; set; }
        public int IDBuku { get; set; }
        public string ISBN { get; set; }
        public int NilaiBuku { get; set; }
        public int PembayaranSebelumnya { get; set; }
        public int Sisa { get; set; }
        public int Bayar { get; set; }
        public bool Completed { get; set; }
    }
}

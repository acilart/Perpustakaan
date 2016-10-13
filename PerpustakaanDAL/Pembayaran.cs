using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerpustakaanDAL
{
    public class Pembayaran
    {
        public int IDDetail { get; set; }
        public int IDPembayaran { get; set; }
        public string KodeBuku { get; set; }
        public string JudulBuku { get; set; }
        public int IDBuku { get; set; }
        public string ISBN { get; set; }
        public double NilaiBuku { get; set; }
        public double PembayaranSebelumnya { get; set; }
        public double Sisa { get; set; }
        public double Bayar { get; set; }
        public bool Completed { get; set; }
    }
}

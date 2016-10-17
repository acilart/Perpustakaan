using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Perpustakaan.ViewModel
{
    public class IuranViewModel
    {
        public int ID { get; set; }
        public string TipeIuran { get; set; }
        public string MasaBerlaku { get; set; }
        public decimal Jumlah { get; set; }

    }
}

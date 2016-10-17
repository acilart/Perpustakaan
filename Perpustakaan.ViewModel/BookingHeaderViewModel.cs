using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Perpustakaan.ViewModel
{
    public class BookingHeaderViewModel
    {
        public int IDBooking { get; set; }
        public int IDAnggota { get; set; }
        public string NamaAnggota { get; set; }
        public string NoBooking { get; set; }
        public DateTime TanggalPinjam { get; set; }
        public DateTime TanggalKembali { get; set; }

    }
}

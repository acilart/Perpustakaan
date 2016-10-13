using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
namespace PerpustakaanModel
{
    [Table("T_R_BOOK_HEADER")]
    public class TrBookingHeader
    {
        public int ID { get; set; }
        [MaxLength(20)]
        public string BookingNo { get; set; }
        public Nullable<int> IDAnggota { get; set; }
        public Nullable<System.DateTime> TanggalBooking { get; set; }
        public Nullable<System.DateTime> TanggalPinjam { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public Nullable<bool> Active { get; set; }
    }
}

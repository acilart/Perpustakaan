using Perpustakaan.ViewModel;
using PerpustakaanDAL;
using PerpustakaanModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace PerpustakaanWeb.Service
{
    /// <summary>
    /// Summary description for PeminjamanService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class PeminjamanService : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        //[WebMethod]
        //public List<TrBrwHeader> GetAllHeader()
        //{
        //    return PeminjamanDAL.GetAllHeader();
        //}
        [WebMethod]
        public List<MstAnggota> GetAllAnggota()
        {
            return AnggotaDAL.GetAllAnggota();
        }

        [WebMethod]
        public MstAnggota GetAnggotaByID(int id)
        {
            return AnggotaDAL.GetAnggotaByID(id);
        }
        //[WebMethod]
        //public BrwHeaderViewModel GetPeminjamanByID(int id)
        //{
        //    return PeminjamanDAL.GetPeminjamanByID(id);
        //}

        [WebMethod]
        public List<MstBuku> GetBukuAvailable()
        {
            return BukuDAL.GetBukuAvailable();
        }

        [WebMethod]
        public MstBuku GetBukuByID(int id)
        {
            return new BukuDAL().GetBukuByID(id);
        }

        [WebMethod]
        public bool SimpanPeminjaman(TrBrwHeader header, List<TrBrwDetail> details)
        {
            return new PeminjamanDAL().SimpanPeminjaman(header, details);
        }

        [WebMethod]
        public List<BookingViewModel> GetBookingAktifByID(int id)
        {
            var dal = new BookingDAL();
            return dal.GetBookingAktifByID(id);

        }

        [WebMethod]
        public List<TrBookingHeader> GetBookingHeaderAktifByIDAnggota(int id)
        {
            var dal = new BookingDAL();
            return dal.GetBookingHeaderAktifByIDAnggota(id);
        }

        [WebMethod]
        public bool SimpanPeminjamanBook(TrBookingHeader book, List<TrBookingDetail> details)
        {
            var dal = new PeminjamanDAL();
            return dal.SimpanPeminjamanBook(book, details);
        }

        [WebMethod]
        public BookingHeaderViewModel GetHeaderViewModelByID(int id)
        {
            var dal = new BookingDAL();
            return dal.GetHeaderViewModelByID(id);
        }
    }
}

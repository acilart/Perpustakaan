﻿using PerpustakaanDAL;
using PerpustakaanModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Perpustakaan.ViewModel;

namespace PerpustakaanWeb.Service
{
    /// <summary>
    /// Summary description for BookingService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class BookingService : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public List<MstBuku> GetBuku()
        {
            return BukuDAL.GetAllBuku();
        }

        [WebMethod]
        public List<MstBuku> GetBukuAvailable()
        {
            return BukuDAL.GetBukuAvailable();
        }

        [WebMethod]
        public MstBuku GetBukuAvailableByID(int id)
        {
            return BukuDAL.GetBukuAvailableByID(id);
        }

        [WebMethod]
        public MstAnggota GetAnggotaByID(int id)
        {
            return AnggotaDAL.GetAnggotaByID(id);
        }

        [WebMethod]
        public bool SimpanBooking(TrBookingHeader header, List<TrBookingDetail> details)
        {
            return BookingDAL.SimpanBooking(header,details);
        }

        [WebMethod]
        public bool RemoveDetailBukuBookingList(int details)
        {
            return BookingDAL.RemoveDetailBukuBookingList(details);
        }

        [WebMethod]
        public List<BookingViewModel> GetSelectedBookingAktifByID(int ID)
        {
            return BookingDAL.GetSelectedBookingAktifByID(ID);
        }

        [WebMethod]
        public BookingHeaderViewModel GetHeaderViewModelByID(int ID)
        {
            return BookingDAL.GetHeaderViewModelByID(ID);
        }

        [WebMethod]
        public BookingHeaderViewModel GetSelectedHeaderViewModelByID(int ID)
        {
            return BookingDAL.GetSelectedHeaderViewModelByID(ID);
        }

       
    }
}

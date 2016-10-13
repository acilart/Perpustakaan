using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using PerpustakaanModel;
using PerpustakaanDAL;
namespace PerpustakaanWeb.Service
{
    /// <summary>
    /// Summary description for PembayaranBuku
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class PembayaranBuku : System.Web.Services.WebService
    {
        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public List<Penggantian> GetPenggantian()
        {
            return PenggantianDAL.GetPenggantian();
        }

        [WebMethod]
        public List<Pembayaran> GetPembayaranByID(int ID)
        {
            return PembayaranBukuDAL.GetPembayaranByID(ID);
        }

        [WebMethod]
        public Penggantian GetPenggantianByID(int ID)
        {
            return PenggantianDAL.GetPenggantianByID(ID);
        }

        [WebMethod]
        public bool SimpanPembayaran(TrPmtBukuHeader header, List<TrPmtBukuDetail> details)
        {
            return PembayaranBukuDAL.SimpanPembayaran(header, details);
        }

    }
}

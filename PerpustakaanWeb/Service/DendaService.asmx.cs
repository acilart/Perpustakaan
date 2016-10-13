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
    /// Summary description for DendaService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class DendaService : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }
        [WebMethod]
        public List<PembayaranDendaDAL> GetPengembalian()
        {
            return PembayaranDendaDAL.GetPengembalian();
        }

        [WebMethod]
        public List<PembayaranDendaDAL> GetPengembalianBySearch(string search)
        {
            return PembayaranDendaDAL.GetPengembalianBySearch(search);
        }
        
        [WebMethod]
        public PembayaranDendaDAL GetPeminjamanById(int id)
        {
            return PembayaranDendaDAL.GetPeminjamanById(id);
        }

        [WebMethod]
        public bool SimpanPembayaranDenda(TrDendaHeader header,List<TrDendaDetail> details, TrReturnHeader retHeader)
        {
            return PembayaranDendaDAL.SimpanPembayaranDenda(header, details, retHeader);
        }
    }
}

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
    /// Summary description for PenggantianService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class PenggantianService : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }
        [WebMethod]
        public List<Penggantian> GetPengembalian()
        {
            return PenggantianDAL.GetPengembalian();
        }

        [WebMethod]
        public Penggantian GetPengembalianById(int id)
        {
            return PenggantianDAL.GetPengembalianById(id);
        }

        [WebMethod]
        public List<Penggantian> GetBukuHilang(int id)
        {
            return PenggantianDAL.GetBukuHilang(id);
        }
        
        [WebMethod]
        public bool SimpanPenggantian(TrRpcHeader header, List<TrRpcDetail> details, List<TrReturnDetail> detailReturn)
        {
            return PenggantianDAL.SimpanPenggantian(header, details, detailReturn);
        }
    }
}

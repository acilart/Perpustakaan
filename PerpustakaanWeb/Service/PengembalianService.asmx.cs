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
    /// Summary description for PengembalianService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class PengembalianService : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public List<PengembalianDAL> GetPeminjaman()
        {
            return PengembalianDAL.GetPeminjaman();
        }

        [WebMethod]
        public List<PengembalianDAL> GetPeminjamanByID(int id)
        {
            return PengembalianDAL.GetPeminjamanByID(id);
        }

        [WebMethod]
        public List<PengembalianDAL> GetPeminjamanBySearch(string Search)
        {
            return PengembalianDAL.GetPeminjamanBySearch(Search);
        }

        [WebMethod]
        public List<PengembalianDAL> GetBukuPinjam(int id)
        {
            return PengembalianDAL.GetBukuPinjam(id);
        }

        [WebMethod]
        public bool SimpanPengembalian(TrReturnHeader header, List<TrReturnDetail> detail)
        {
            return PengembalianDAL.SimpanPengembalian(header, detail);
        }
    }
}

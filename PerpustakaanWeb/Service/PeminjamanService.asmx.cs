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

        [WebMethod]
        public List<MstAnggota> GetAllAnggota()
        {
            return AnggotaDAL.GetAllAnggota();
        }

        [WebMethod]
        public MstAnggota GetAnggotaById(int id)
        {
            return AnggotaDAL.GetAnggotaByID(id);
        }

        [WebMethod]
        public List<MstBuku> GetBukuAvailable()
        {
            return BukuDAL.GetBukuAvailable();
        }

        [WebMethod]
        public List<MstBuku> GetAllBuku()
        {
            return BukuDAL.GetAllBuku();
        }

        [WebMethod]
        public MstBuku GetBukuByID(int id)
        {
            return new BukuDAL().GetBukuByID(id);
        }

    }
}

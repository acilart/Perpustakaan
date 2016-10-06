using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using PerpustakaanDAL;
using PerpustakaanModel;

namespace PerpustakaanWeb.Service
{
    /// <summary>
    /// Summary description for AnggotaOnline
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]

    public class AnggotaOnline : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public bool simpanAnggota(MstAnggota anggota)
        {

            return AnggotaDAL.SimpanAnggota(anggota);
        }

        [WebMethod]
        public List<MstProvinsi> getPropinsi()
        {
            return ProvinsiDAL.GetAllPropinsi();
        }


        [WebMethod]
        public List<MstKota> getKota(int id)
        {
            return KotaDAL.GetAllKotaByProvID(id);
        }

        [WebMethod]
        public List<MstKecamatan> getKecamatan(int id)
        {
            return KecamatanDAL.GetAllKecamatanbyKotaID(id);
        }


    }
}

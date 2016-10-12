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
    /// Summary description for AnggotaService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class AnggotaService : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        //Buat input Baru
        [WebMethod]
        public List<IuranViewModel> GetIuranNonDenda()
        {
            var dal = new IuranDAL();
            return dal.GetIuranNonDenda();
        }


        [WebMethod]
        public List<MstProvinsi> GetAllPropinsi()
        {
            return ProvinsiDAL.GetAllPropinsi();
        }

        [WebMethod]
        public List<MstKota> GetAllKotaByProvID(int id)
        {
            return KotaDAL.GetAllKotaByProvID(id);
        }

        [WebMethod]
         public List<MstKecamatan> GetAllKecByKotaID(int id)
        {
            return KecamatanDAL.GetAllKecamatanbyKotaID(id);
        }

        [WebMethod]
        public bool SimpanAnggota(MstAnggota anggota)
        {
            return AnggotaDAL.SimpanAnggota(anggota);
        }

        //[WebMethod]
        //public List<IuranViewModel> GetIuranById(int id)
        //{
        //    return IuranDAL.GetIuranNonDendaByIdAnggota(id);
        //}

    }
}

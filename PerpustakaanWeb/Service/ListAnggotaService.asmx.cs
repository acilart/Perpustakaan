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
    /// Summary description for ListAnggotaService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class ListAnggotaService : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }



        [WebMethod]
        public List<MstAnggota> getAnggota() {

            return AnggotaDAL.GetAllAnggota();
        }

        [WebMethod]
        public MstAnggota getAnggotaByID(String ID){

            return AnggotaDAL.GetAnggotaByID(int.Parse(ID));
        
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
        [WebMethod]

        public bool hapusAnggota(int id) {

            return AnggotaDAL.DeleteAnggota(id);
        }

        [WebMethod]
        public bool updateAnggota(MstAnggota anggota)
        {

            return AnggotaDAL.SimpanAnggota(anggota);
        }

        [WebMethod]
        public List<MstAnggota> searchAnggotaByNama(string nama)
        {

            return AnggotaDAL.searchAnggotaByNama(nama);
        }

        
        [WebMethod]
        public List<MstAnggota> searchAnggotaByTelp(string telp)
        {

            return AnggotaDAL.searchAnggotaByTelp(telp);
        }


        [WebMethod]
        public List<MstAnggota> searchAnggotaByKode(string kode)
        {

            return AnggotaDAL.searchAnggotaByKode(kode);
        }

        [WebMethod]
        public List<MstAnggota> searchAnggotaByEmail(string email)
        {

            return AnggotaDAL.searchAnggotaByEmail(email);
        }

        [WebMethod]
        public List<MstAnggota> searchAnggotaByAlamat(string alamat) {
             return AnggotaDAL.searchAnggotaByAlamat(alamat);
        }
    }
}

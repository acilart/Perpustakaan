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
    /// Summary description for PetugasService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class PetugasService : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public bool InsertPetugas(PetugasViewModel baru)
        {
            return PetugasDAL.InsertPetugas(baru);
        }

        [WebMethod]

        public MstPetugas GetPetugasByID(int id)
        {
            return PetugasDAL.GetPetugasByID(id);
        }
    }
}

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
    /// Summary description for InputBukuService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class InputBukuService : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public List<MstKategori> GetKategori()
        {
            return KategoriBukuDAL.GetAllKategori();
        }

        [WebMethod]
        public MstKategori GetKategoriByID(int ID)
        {
            return KategoriBukuDAL.GetKategoriByID(ID);
        }

        [WebMethod]
        public List<MstPenerbit> GetPenerbit()
        {
            return PenerbitDAL.GetPenerbit();
        }

        [WebMethod]
        public MstPenerbit GetPenerbitByID(int ID)
        {
            return PenerbitDAL.GetPenerbitByID(ID);
        }

        [WebMethod]
        public string AutoNumber()
        {
            return AutoNumberDAL.KodeAnggotaAutoNumber();
        }
    }
}

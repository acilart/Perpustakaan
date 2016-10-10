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
    /// Summary description for LoginService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class LoginService : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod(EnableSession=true)]
        public MstPetugas GetPetugasByEmailPass(string email, string password)
        {
            return LoginDAL.GetPetugasByEmailPass(email, password);
        }

        [WebMethod(EnableSession=true)]
        public MstAnggota GetAnggotaByEmail(string email, string password)
        {
            return LoginDAL.GetAnggotaByEmail(email, password);
        }
    }
}

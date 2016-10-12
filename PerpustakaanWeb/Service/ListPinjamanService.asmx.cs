using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using PerpustakaanModel;
using Perpustakaan.ViewModel;
using PerpustakaanDAL;

namespace PerpustakaanWeb.Service
{
    /// <summary>
    /// Summary description for ListPinjamanService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class ListPinjamanService : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public List<ListPinjamanViewModel> getList()
        {
            return ListPeminjamanDAL.getList();
        }



        [WebMethod]
        public List<ListPinjamanViewModel> getListDetail(int ID)
        {
            return ListPeminjamanDAL.getListDetail(ID);
        }

        [WebMethod]
        public List<ListPinjamanViewModel> searchByNama(string nama)
        {
            return ListPeminjamanDAL.searchByNama(nama);
        }

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using PerpustakaanDAL;
using PerpustakaanModel;
using Perpustakaan.ViewModel;
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
        public MstBuku GetBukuByID(int ID)
        {
            var dal = new BukuDAL();
            return dal.GetBukuByID(ID);
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

        [WebMethod]
        public List<LemariViewModel> GetLemariAvailable()
        {
            var dal = new LemariDAL();
            return dal.GetLemariAvailable();
        }

        [WebMethod]
        public LemariViewModel GetLemariByIDCell(int ID)
        {
            var dal = new LemariDAL();
            return dal.GetLemariByIDCell(ID);
        }

        [WebMethod]
        public bool SimpanLemari()
        {
            var dal = new LemariDAL();
            return dal.InisialisasiDataLemari();
        }

        [WebMethod]
        public bool SimpanBuku(MstBuku buku)
        {
            return BukuDAL.SimpanBuku(buku);
        }

        [WebMethod]
        public List<MstOpsiPenggantian> GetOpsiPenggaintian()
        {
            return OpsiPenggantianDAL.GetOpsi();
        }

        [WebMethod]
        public List<Penggantian> GetPenggantianBuku()
        {
           return PenggantianDAL.GetPenggantianBuku();
        }

        [WebMethod]
        public List<Penggantian> GetPenggantianTunai()
        {
            return PenggantianDAL.GetPenggantianTunai();
        }


        [WebMethod]
        public Penggantian GetPenggantianByID(int ID)
        {
            return PenggantianDAL.GetPenggantianByID(ID);
        }

        [WebMethod]
        public List<MstBuku> GetBukuNonPlaced()
        {
            return BukuDAL.GetBukuNonPlaced();
        }
        [WebMethod]
        public List<MstBuku> GetBukuHilangByIDPenggantianHeader(int ID)
        {
            return PenyimpananBukuDAL.GetBukuHilangByIDPenggantianHeader(ID);
        }

        [WebMethod]
        public List<MstSumberBuku> GetSumberBuku()
        {
            var dal = new SumberBukuDAL();
            return dal.GetAllSumberBuku();
        }
    }
}

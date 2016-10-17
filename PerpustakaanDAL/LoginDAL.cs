using PerpustakaanModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace PerpustakaanDAL
{
    public class LoginDAL
    {

        public static MstPetugas GetPetugasByEmailPass(string email, string password)
        {
            using (var db = new PerpustakaanDbContext())
            {
                var cek = db.MstPetugas.FirstOrDefault(n => n.Email == email && n.Password == password);
                if (cek != null)
                {
                    //ini untuk ngedaftarain session diisi oleh email (nilai default)
                    HttpContext.Current.Session["Email"] = cek.Email;
                    HttpContext.Current.Session["ID"] = cek.ID;
                    HttpContext.Current.Session["Role"] = "petugas";
                    return cek;
                }

                return null;
            }
        }

        public static MstAnggota GetAnggotaByEmail(string email, string password)
        {
            using (var db = new PerpustakaanDbContext())
            {
                var cek = db.MstAnggota.FirstOrDefault(n => n.Email == email && n.Password == password);
                if (cek != null)
                {
                    HttpContext.Current.Session["Email"] = cek.Email;
                    HttpContext.Current.Session["ID"] = cek.ID;
                    HttpContext.Current.Session["Role"] = "anggota";
                    return cek;
                }
                return null;
            }
        }
    }
}

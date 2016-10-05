using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PerpustakaanModel;
namespace PerpustakaanDAL
{
    public class AutoNumberDAL
    {
        public static string KodeAnggotaAutoNumber()
        {
            var tmp = "";
            using (var db = new PerpustakaanDbContext())
            {
                var cek = db.MstAnggota.Where(n => n.KodeAnggota.Contains(DateTime.Now.ToString("yyyy"))).LastOrDefault();
                if (cek != null)
                {
                    var urut = cek.KodeAnggota.Substring(cek.KodeAnggota.Length - 5, 5);
                    var i = int.Parse(urut) + 1;
                    var zero = urut.Substring(0,urut.Length - i.ToString().Length);
                    tmp = "A" + DateTime.Now.ToString("yyyy") + zero + i;
                }
                else
                {
                    tmp = "A" + DateTime.Now.ToString("yyyy") + "00001" ;
                }
            }
            return tmp;
        }

        public static string IuranNoRegAutoNumber()
        {
            var tmp = "";
            using (var db = new PerpustakaanDbContext())
            {
                var cek = db.TrScnHeader.Where(n => n.NoRegistrasi.Contains(DateTime.Now.ToString("yyyyMM"))).LastOrDefault();
                if (cek != null)
                {
                    var urut = cek.NoRegistrasi.Substring(cek.NoRegistrasi.Length - 4, 4);
                    var i = int.Parse(urut) + 1;
                    var zero = urut.Substring(0, urut.Length - i.ToString().Length);
                    tmp = "TRXI" + DateTime.Now.ToString("yyyy") + DateTime.Now.ToString("MM") + zero + i;
                }
                else
                {
                    tmp = "TRXI" + DateTime.Now.ToString("yyyy") + DateTime.Now.ToString("MM") + "0001";
                }
            }
            return tmp;
        }
    }
}

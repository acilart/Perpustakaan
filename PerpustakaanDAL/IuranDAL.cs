using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PerpustakaanModel;
using Perpustakaan.ViewModel;
namespace PerpustakaanDAL
{
    public class IuranDAL
    {
        //Ambil iuran yang tanpa denda...
        public static List<IuranViewModel> GetIuranNonDendaByIdAnggota(int id)
        {
            var list = new List<IuranViewModel>();
            using (var db = new PerpustakaanDbContext())
            {
                var listIuran = db.MstTipeIuran.ToList();
                var anggota = AnggotaDAL.GetAnggotaByID(id);
                if (anggota != null)
                {
                    if (Convert.ToDateTime(anggota.MasaBerlakuKartu) < DateTime.Now)
                    {
                        var tipe1 = listIuran.FirstOrDefault(n => n.ID == 2);
                        var iuranV1 = new IuranViewModel()
                        {
                            ID = tipe1.ID,
                            MasaBerlaku = "1 Tahun",
                            Jumlah = Convert.ToInt16(tipe1.Jumlah),
                            TipeIuran = tipe1.TipeIuran
                        };
                        list.Add(iuranV1);

                    }

                    if (Convert.ToDateTime(anggota.MasaBerlakuAnggota) < DateTime.Now)
                    {
                        var tipe2 = listIuran.FirstOrDefault(n => n.ID == 1);
                        var iuranV1 = new IuranViewModel()
                        {
                            ID = tipe2.ID,
                            MasaBerlaku = "3 Bulan",
                            Jumlah = Convert.ToInt16(tipe2.Jumlah),
                            TipeIuran = tipe2.TipeIuran
                        };
                        list.Add(iuranV1);
                    }
                    return list;
                }
            }
            return list;
        }

        //Untuk ngebantu insert baru
        //public static List<IuranViewModel> GetIuranNonDenda()
        //{
        //    var list = new List<IuranViewModel>();
        //    using (var db = new PerpustakaanDbContext())
        //    {
        //        var listIuran = db.MstTipeIuran.ToList();
        //        if (anggota != null)
        //        {
        //            if (Convert.ToDateTime(anggota.MasaBerlakuKartu) < DateTime.Now)
        //            {
        //                var tipe1 = listIuran.FirstOrDefault(n => n.ID == 2);
        //                var iuranV1 = new IuranViewModel()
        //                {
        //                    ID = tipe1.ID,
        //                    MasaBerlaku = "1 Tahun",
        //                    Jumlah = Convert.ToInt16(tipe1.Jumlah),
        //                    TipeIuran = tipe1.TipeIuran
        //                };
        //                list.Add(iuranV1);

        //            }

        //            if (Convert.ToDateTime(anggota.MasaBerlakuAnggota) < DateTime.Now)
        //            {
        //                var tipe2 = listIuran.FirstOrDefault(n => n.ID == 1);
        //                var iuranV1 = new IuranViewModel()
        //                {
        //                    ID = tipe2.ID,
        //                    MasaBerlaku = "3 Bulan",
        //                    Jumlah = Convert.ToInt16(tipe2.Jumlah),
        //                    TipeIuran = tipe2.TipeIuran
        //                };
        //                list.Add(iuranV1);
        //            }
        //            return list;
        //        }
        //    }
        //    return list;
        //}
    }
}

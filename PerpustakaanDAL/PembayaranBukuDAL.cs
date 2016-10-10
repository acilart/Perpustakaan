using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PerpustakaanModel;
namespace PerpustakaanDAL
{
    public class PembayaranBukuDAL
    {
        public static List<Pembayaran> GetPembayaranByID(int id)
        {
            var list = new List<Pembayaran>();
           
            using (var db = new PerpustakaanDbContext())
            {
                var rpcHeader = db.TrRpcHeader.FirstOrDefault(n => n.ID == id);//ambil header penggantian
                var pmtHeader = db.TrPmtBukuHeader.FirstOrDefault(n => n.NoReferensi == rpcHeader.NoRegistrasi);//ambil header pembayaran sesuai no registrasi yang ada di header penggantian
                if (pmtHeader != null)//cek apakah data header pembayaran ada atau tidak
                {

                    var pmtDetail = db.TrPmtBukuDetail.Where(n => n.HeaderID == pmtHeader.ID);//cek pembayaran detail sesuai id header pembayaran
                    foreach (var detail in pmtDetail)
                    {
                        var bukuDal = new BukuDAL();
                        var buku = bukuDal.GetBukuByID(detail.IDBuku);//cek data buku berdasarkan id buku di detail pembayaran
                        int bayarSebelum = 0;
                        int bayarKe = 0;
                        int sisa = 0;
                        bool completed = false;
                        var pmtSettle = db.TrPmtBukuSettlement.Where(n => n.IDPMTDetail == detail.ID);// cek cicilan pembayaran berdasarkan id detail pembayaran
                        foreach (var settle in pmtSettle)
                        {
                            bayarSebelum += Convert.ToInt16(settle.Jumlah);
                            bayarKe += 1;
                        }
                        bayarKe += 1;
                        sisa = Convert.ToInt16(detail.Value) - bayarSebelum;
                        if (sisa == 0)
                        {
                            completed = true;
                        }
                        #region Instansi Class Pembayaran
                        var pembayar = new Pembayaran()
                        {
                            IDBuku = buku.ID,
                            Bayar = 0,
                            Completed = completed,
                            ISBN = buku.ISBN,
                            JudulBuku = buku.JudulBuku,
                            KodeBuku = buku.Kode,
                            NilaiBuku = Convert.ToInt16(detail.Value),
                            PembayaranSebelumnya = bayarSebelum,
                            Sisa = sisa
                        };
                        #endregion
                        list.Add(pembayar);
                    }
                    return list;
                }
                else
                {
                    var detailRpc = db.TrRpcDetail.Where(n => n.HeaderID == id);
                    foreach (var item in detailRpc)
                    {
                        
                        var buku = new PerpustakaanDbContext().MstBuku.FirstOrDefault(n=>n.ID == item.IDBuku);//cek data buku berdasarkan id buku di detail pembayaran
                        var pembayar = new Pembayaran()
                         {
                             IDBuku = buku.ID,
                             Bayar = 0,
                             Completed = false,
                             ISBN = buku.ISBN,
                             JudulBuku = buku.JudulBuku,
                             KodeBuku = buku.Kode,
                             NilaiBuku = Convert.ToInt16(item.HargaPenggantian) + 5000,
                             PembayaranSebelumnya = 0,
                             Sisa = Convert.ToInt16(item.HargaPenggantian) + 5000
                         };
                        list.Add(pembayar);
                    }
                }
            }
            return list;
        }

        public static bool SimpanPembayaran(TrPmtBukuHeader header,List<TrPmtBukuDetail> details, List<TrPmtBukuSettlement> settle)
        {
            using (var db = new PerpustakaanDbContext())
            {
                #region Header Pembayaran
                #endregion

            }
            return false;
        }
    }
}

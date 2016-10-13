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
                        double bayarSebelum = 0;
                        int bayarKe = 0;
                        double sisa = 0;
                        bool completed = false;
                        var pmtSettle = new PerpustakaanDbContext().TrPmtBukuSettlement.Where(n => n.IDPMTDetail == detail.ID);// cek cicilan pembayaran berdasarkan id detail pembayaran
                        foreach (var settle in pmtSettle)
                        {
                            bayarSebelum += Convert.ToDouble(settle.Jumlah);
                            bayarKe += 1;
                        }
                        bayarKe += 1;
                        sisa = Convert.ToDouble(detail.Value) - bayarSebelum;
                        if (sisa == 0)
                        {
                            completed = true;
                        }
                        #region Instansi Class Pembayaran
                        var pembayar = new Pembayaran()
                        {
                            IDDetail = detail.ID,
                            IDPembayaran = pmtHeader.ID,
                            IDBuku = buku.ID,
                            Bayar = 0,
                            Completed = completed,
                            ISBN = buku.ISBN,
                            JudulBuku = buku.JudulBuku,
                            KodeBuku = buku.Kode,
                            NilaiBuku = Convert.ToDouble(detail.Value),
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
                        double nilai = 0;
                        if (item.IDOpsiPenggantian == 1)
                        {
                            nilai = Convert.ToDouble(item.HargaPenggantian);
                        }
                        var buku = new PerpustakaanDbContext().MstBuku.FirstOrDefault(n => n.ID == item.IDBuku);//cek data buku berdasarkan id buku di detail pembayaran
                        var pembayar = new Pembayaran()
                         {
                             IDBuku = buku.ID,
                             Bayar = 0,
                             Completed = false,
                             ISBN = buku.ISBN,
                             JudulBuku = buku.JudulBuku,
                             KodeBuku = buku.Kode,
                             NilaiBuku = nilai + 5000,
                             PembayaranSebelumnya = 0,
                             Sisa = nilai + 5000
                         };
                        list.Add(pembayar);
                    }
                }
            }
            return list;
        }

        public static bool SimpanPembayaran(TrPmtBukuHeader header, List<TrPmtBukuDetail> details)
        {
            using (var db = new PerpustakaanDbContext())
            {

                var cekHeader = db.TrPmtBukuHeader.FirstOrDefault(n => n.ID == header.ID);
                if (cekHeader == null)
                {
                    #region Header Pembayaran Baru

                    int id = 1;
                    var listHeader = db.TrPmtBukuHeader.ToList();
                    if (listHeader.Count > 0)
                    {
                        id = listHeader[listHeader.Count - 1].ID + 1;
                    }
                    header.Tanggal = DateTime.Now;
                    header.NoRegistrasi = AutoNumberDAL.PembayaranNoRegAutoNumber();
                    header.ID = id;
                    header.CreatedOn = DateTime.Now;
                    header.ModifiedOn = DateTime.Now;
                    db.TrPmtBukuHeader.Add(header);
                    #endregion
                    #region Pembayaran Detail & settlement baru
                    var listDetail = db.TrPmtBukuDetail.ToList();
                    int idDetail = 0;
                    if (listDetail.Count > 0)
                    { idDetail = listDetail[listDetail.Count - 1].ID; }
                    foreach (var item in details)
                    {
                        idDetail += 1;
                        item.HeaderID = id;
                        
                        item.CreatedOn = DateTime.Now;
                        item.ModifiedOn = DateTime.Now;
                        var sett = new TrPmtBukuSettlement()
                        {
                            IDPMTDetail = idDetail,
                            Jumlah = item.JumlahBayar,
                            CreatedOn = DateTime.Now,
                            ModifiedOn = DateTime.Now,
                            PembayaranKe = 1,
                        };
                        db.TrPmtBukuSettlement.Add(sett);
                        db.TrPmtBukuDetail.Add(item);
                    }
                    #endregion

                }
                else
                {
                    #region Update Pembayaran Header
                    cekHeader.ModifiedOn = DateTime.Now;
                    #endregion
                    #region Update Detail Pembayaran
                    var pmtDetail = db.TrPmtBukuDetail.Where(n => n.HeaderID == cekHeader.ID);
                    foreach (var item in pmtDetail)
                    {
                            var sett = new PerpustakaanDbContext().TrPmtBukuSettlement.Where(n => n.IDPMTDetail == item.ID).ToList();
                            var sum = sett.Sum(n => n.Jumlah);
                            item.ModifiedOn = DateTime.Now;
                            var det = details.FirstOrDefault(n => n.ID == item.ID);
                            if (sum + det.JumlahBayar == item.Value)
                            {
                                item.IsCompleted = true;
                            }
                            else
                            {
                                item.IsCompleted = false;
                            }
                    }
                    #endregion
                    #region Tabah Pembayaran Settlement
                    foreach (var item in details)
                    {
                        var sett = new PerpustakaanDbContext().TrPmtBukuSettlement.Where(n => n.IDPMTDetail == item.ID).ToList();
                        var sum = sett.Sum(n => n.Jumlah);
                        var settlement = new TrPmtBukuSettlement()
                                {
                                    IDPMTDetail = item.ID,
                                    Jumlah = item.JumlahBayar,
                                    PembayaranKe = sett.Count + 1,
                                    CreatedOn = DateTime.Now,
                                    ModifiedOn = DateTime.Now,
                                };
                        db.TrPmtBukuSettlement.Add(settlement);
                    }
                    #endregion
                }
                #region Eksekusi
                try
                {
                    db.SaveChanges();
                    return true;
                }
                catch (Exception)
                {
                    return false;
                    throw;
                }
                #endregion


            }
        }
    }
}

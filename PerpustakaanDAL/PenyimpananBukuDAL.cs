using PerpustakaanModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace PerpustakaanDAL
{
    public class PenyimpananBukuDAL
    {

        public static bool SimpanPlcHeader(TrPlcHeader header, List<TrPlcDetail> details)
        {
            using (var db = new PerpustakaanDbContext())
            {
                // Menambah Data TrPlcHeader Ke Database
                #region Simpan Header Penyimpanan Buku
                int id = 1;
                var listHeader = db.TrPlcHeader.ToList();
                if (listHeader.Count > 0)
                {
                    id = listHeader[listHeader.Count - 1].ID + 1;
                }
                header.NoRegistrasi = AutoNumberDAL.PenyimpananBukuNoRegAutoNumber();
                header.ID = id;
                header.Tanggal = DateTime.Now;
                header.CreatedOn = DateTime.Now;
                header.ModifiedOn = DateTime.Now;
                db.TrPlcHeader.Add(header);
                #endregion
                var listStock = new List<TrStock>();
                foreach (var item in details)
                {
                    item.HeaderID = id;
                    //item.CreatedBy = Convert.ToInt16(HttpContext.Current.Session["ID"]);
                    //item.ModifiedBy = Convert.ToInt16(HttpContext.Current.Session["ID"]);
                    item.CreatedOn = DateTime.Now;
                    item.ModifiedOn = DateTime.Now;
                    var stok = new TrStock()
                    {
                        IDBuku = item.IDBuku,
                        InStock = true,
                        CreatedOn = DateTime.Now,
                        ModifiedOn = DateTime.Now
                    };
                    listStock.Add(stok);

                    #region Update Status Buku
                    var buku = db.MstBuku.FirstOrDefault(n => n.ID == item.IDBuku);
                    if (buku != null)
                    {
                        buku.Aktif = true;
                    }
                    #endregion

                    #region Update Kolom Rak
                    var cek = db.MstCabinetCell.FirstOrDefault(n => n.ID == buku.Lokasi);
                    if (cek != null)
                    {
                        cek.Terisi += 1;
                        cek.Kosong -= 1;
                    }
                    #endregion

                }
                db.TrPlcDetail.AddRange(details);
                db.TrStock.AddRange(listStock);
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

        public static List<MstBuku> GetBukuHilangByIDPenggantianHeader(int id)
        {
            using (var db = new PerpustakaanDbContext())
            {
                var detail = db.TrRpcDetail.Where(n => n.IDOpsiPenggantian == 1 && n.HeaderID == id);
                var list = new List<MstBuku>();
                foreach (var item in detail)
                {
                    var dalBuku = new BukuDAL();
                    var buku = dalBuku.GetBukuByID(Convert.ToInt16(item.IDBuku));
                    if (buku != null)
                    {
                        var dal = new LemariDAL();
                        buku.LokasiD = dal.GetLemariByIDCell(Convert.ToInt16(buku.Lokasi)).Lokasi;
                        list.Add(buku);
                    }
                }
                return list;
            }
        }

    }
}

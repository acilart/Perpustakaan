using PerpustakaanModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerpustakaanDAL
{
    public class PenyimpananBukuDAL
    {
        public static bool SimpanPlcHeader(TrPlcHeader header, List<TrPlcDetail> details)
        {
            using (var db=new PerpustakaanDbContext())
            {
                #region Simpan Header Penyimpanan Buku
                var listHeader = db.TrPlcHeader.ToList();
                var id = listHeader[listHeader.Count - 1].ID + 1;
                header.NoRegistrasi = AutoNumberDAL.PenyimpananBukuNoRegAutoNumber();
                header.ID = id;
                header.CreatedOn = DateTime.Now;
                header.ModifiedOn = DateTime.Now;
                db.TrPlcHeader.Add(header);
                #endregion
                var listStock = new List<TrStock>();
                foreach (var item in details)
                {
                    item.HeaderID = id;
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
                    db.SaveChanges();
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
                    var buku = db.MstBuku.FirstOrDefault(x => x.ID == item.IDBuku);
                    if (buku != null)
                    {
                        list.Add(buku);
                    }
                }
                return list;
            }
        }
    }
}

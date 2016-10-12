using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PerpustakaanModel;
namespace PerpustakaanDAL
{
    public class PeminjamanDAL
    {
        public TrBrwHeader GetHeaderByNore(string noReg)
        {
            using (var db = new PerpustakaanDbContext())
            {
                return db.TrBrwHeader.FirstOrDefault(n => n.NoRegistrasi == noReg);
            }
        }

        public bool SimpanPeminjaman(TrBrwHeader header, List<TrBrwDetail> details)
        {
            using (var db = new PerpustakaanDbContext())
            {
                #region Simpan Header Penyimpanan Buku
                int id = 1;
                var listHeader = db.TrPlcHeader.ToList();
                if (listHeader.Count > 0)
                {
                    id = listHeader[listHeader.Count - 1].ID + 1;
                }
                header.NoRegistrasi = AutoNumberDAL.PenyimpananBukuNoRegAutoNumber();
                header.ID = id;
                header.TanggalPinjam = DateTime.Now;
                header.TanggalKembali = DateTime.Now.AddDays(3);
                header.CreatedOn = DateTime.Now;
                header.ModifiedOn = DateTime.Now;
                db.TrBrwHeader.Add(header);
                #endregion
                
                foreach (var item in details)
                {
                    item.HeaderID = id;
                    //item.CreatedBy = Convert.ToInt16(HttpContext.Current.Session["ID"]);
                    //item.ModifiedBy = Convert.ToInt16(HttpContext.Current.Session["ID"]);
                    item.CreatedOn = DateTime.Now;
                    item.ModifiedOn = DateTime.Now;
                    
                    #region Update Stock
                    var cekStock = db.TrStock.FirstOrDefault(n => n.IDBuku == item.IDBuku);
                    if (cekStock != null)
                    {
                        cekStock.InStock = false;
                    }
                    #endregion

                    #region Update Status Buku
                    var buku = db.MstBuku.FirstOrDefault(n => n.ID == item.IDBuku);
                    if (buku != null)
                    {
                        buku.Aktif = false;
                    }
                    #endregion

                    #region Update Kolom Rak
                    var cek = db.MstCabinetCell.FirstOrDefault(n => n.ID == buku.Lokasi);
                    if (cek != null)
                    {
                        cek.Terisi -= 1;
                        cek.Kosong += 1;
                    }
                    #endregion

                }
                db.TrBrwDetail.AddRange(details);
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

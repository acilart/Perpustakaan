using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PerpustakaanModel;
using Perpustakaan.ViewModel;
using System.Web;
namespace PerpustakaanDAL
{
    public class PeminjamanDAL
    {
        public string NamaAnggota { get; set; }
        public int ID { get; set; }
        public Nullable<int> IDAnggota { get; set; }
        public string NoRegistrasi { get; set; }
        public string NoReferensi { get; set; }
        public DateTime TanggalPinjam { get; set; }
        public DateTime TanggalKembali { get; set; }

        public TrBrwHeader GetHeaderByNore(string noReg)
        {
            using (var db = new PerpustakaanDbContext())
            {
                return db.TrBrwHeader.FirstOrDefault(n => n.NoRegistrasi == noReg);
            }
        }
        
        public static List<TrBrwHeader> GetAllHeader()
        {
            using (var db = new PerpustakaanDbContext())
            {
                return db.TrBrwHeader.ToList();
            }
        }

        /////////////////////////////////////////////////////////////////////////////////////////
        public static List<PeminjamanDAL> GetPeminjamanByID(int id)
        {
            using (PerpustakaanDbContext db = new PerpustakaanDbContext())
            {
                var result = (from Brw in db.TrBrwHeader
                              join cat in db.MstAnggota on Brw.IDAnggota equals cat.ID
                              select new
                              {
                                  ID = Brw.ID,
                                  IDAnggota = Brw.IDAnggota,
                                  NoReferensi = Brw.NoReferensi,
                                  NoRegistrasi = Brw.NoRegistrasi,
                                  NamaAnggota = cat.Nama,
                                  TanggalPinjam = Brw.TanggalPinjam,
                                  TanggalKembali = Brw.TanggalKembali
                              }).Where(a => a.ID == id).ToList();

                var list = new List<PeminjamanDAL>();
                foreach (var item in result)
                {
                    var dal = new PeminjamanDAL()
                    {
                        ID = item.ID,
                        IDAnggota = item.IDAnggota,
                        NoRegistrasi = item.NoRegistrasi,
                        NamaAnggota = item.NamaAnggota,
                        TanggalPinjam = Convert.ToDateTime(Convert.ToDateTime(item.TanggalPinjam).ToShortDateString()),
                        TanggalKembali = Convert.ToDateTime(Convert.ToDateTime(item.TanggalKembali).ToShortDateString())
                    };
                    list.Add(dal);
                }
                return list;
            }        
        }

        public bool SimpanPeminjaman(TrBrwHeader header, List<TrBrwDetail> details)
        {
            
            using (var db = new PerpustakaanDbContext())
            {
                #region Simpan Header Penyimpanan Buku
                int id = 1;
                var listHeader = db.TrBrwHeader.ToList();
                if (listHeader.Count > 0)
                {
                    id = listHeader[listHeader.Count - 1].ID + 1;
                }
                header.NoRegistrasi = AutoNumberDAL.PeminjamanBukuNoRegAutoNumber();
                header.ID = id;
                header.TanggalPinjam = DateTime.Now;
                header.TanggalKembali = DateTime.Now.AddDays(3);
                header.CreatedOn = DateTime.Now;
                header.ModifiedOn = DateTime.Now;
                header.Status = false;
                db.TrBrwHeader.Add(header);
                #endregion
                
                foreach (var item in details)
                {
                    //var dal = new BukuDAL();
                    //var buku = dal.GetBukuByID(item.IDBuku);
                    item.HeaderID = id;
                    item.IDBuku = item.IDBuku;
                    //item.CreatedBy = Convert.ToInt16(HttpContext.Current.Session["ID"]);
                    //item.ModifiedBy = Convert.ToInt16(HttpContext.Current.Session["ID"]);
                    item.CreatedOn = DateTime.Now;
                  //  item.CreatedBy = petugas;
                    item.ModifiedOn = DateTime.Now;
                    #region Update Status Buku
                    var buku = db.MstBuku.FirstOrDefault(n => n.ID == item.IDBuku);
                    if (buku != null)
                    {
                        buku.Aktif = false;

                    #endregion

                        #region Update Stock
                        var cekStock = db.TrStock.FirstOrDefault(n => n.IDBuku == item.IDBuku);
                        if (cekStock != null)
                        {
                            cekStock.InStock = false;
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

        public bool SimpanPeminjamanBook(TrBookingHeader header, List<TrBookingDetail> details)
        {
            using (var db = new PerpustakaanDbContext())
            {
                int idBrw = 1;
                #region Update Header Booking
                var headerBooking = db.TrBookingHeader.FirstOrDefault(n => n.ID == header.ID);
                if (headerBooking != null)
                {
                    headerBooking.ModifiedOn = DateTime.Now;
                    headerBooking.Active = false;
                #endregion
                    #region Simpan Peminjaman Header
                  
                    var listHeader = db.TrBookingHeader.ToList();
                    if (listHeader.Count > 0)
                    {
                        idBrw = listHeader[listHeader.Count - 1].ID + 1;
                    }
                    var pinjamHeader = new TrBrwHeader()
                    {
                        IDAnggota = header.IDAnggota,
                        ID = idBrw,
                        TanggalPinjam = DateTime.Now,
                        TanggalKembali = DateTime.Now.AddDays(3),
                        NoReferensi = headerBooking.BookingNo,
                        NoRegistrasi = AutoNumberDAL.PeminjamanBukuNoRegAutoNumber(),
                        CreatedOn = DateTime.Now,
                        ModifiedOn = DateTime.Now
                    };
                    db.TrBrwHeader.Add(pinjamHeader);
                    #endregion
            
                }
                #region Update Detail Boking
                var detailBoking = db.TrBookingDetail.Where(n => n.HeaderID == header.ID);
                foreach (var item in detailBoking)
                {
                    item.Active = false;
                    item.ModifiedOn = DateTime.Now;
                }
                #endregion
              
                #region Simpan Peminjaman Detail
                var listBorrow = new List<TrBrwDetail>();
                foreach (var item in details)
                {
                    #region Update Status Buku
                    var buku = db.MstBuku.FirstOrDefault(n => n.ID == item.IDBuku);
                    if (buku != null)
                    {
                        buku.Aktif = false;

                    #endregion

                        #region Update Stock
                        var cekStock = db.TrStock.FirstOrDefault(n => n.IDBuku == item.IDBuku);
                        if (cekStock != null)
                        {
                            cekStock.InStock = false;
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
                    var det = new TrBrwDetail()
                    {
                        HeaderID = idBrw,
                        IDBuku = item.IDBuku,
                        CreatedOn = DateTime.Now,
                        ModifiedOn = DateTime.Now,
                    };
                    listBorrow.Add(det);
                }
                db.TrBrwDetail.AddRange(listBorrow);
                #endregion
               
                try
                {
                    db.SaveChanges();
                }
                catch (Exception)
                {
                    
                    throw;
                }
            }
            return false;
        }

    }
}

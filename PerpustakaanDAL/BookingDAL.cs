﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PerpustakaanModel;
using Perpustakaan.ViewModel;

namespace PerpustakaanDAL
{
    public class BookingDAL
    {
        public static bool SimpanBooking(TrBookingHeader book, List<TrBookingDetail> details)
        {
            using (var db = new PerpustakaanDbContext())
            {



                var cek = db.TrBookingHeader.FirstOrDefault(n => n.IDAnggota == book.IDAnggota);
                //var ambilNoRef = BorrowHeaderDAL.GetDataById(Convert.ToInt32(book.IDAnggota)).NoReferensi;
                var ambilNoReg = AutoNumberDAL.BookingBukuAutoNumber();


                if (cek != null)
                {
                    cek.Active = false;
                    var det = db.TrBookingDetail.Where(n => n.HeaderID == cek.ID);
                    foreach (var item in det)
                    {
                        item.Active = false;
                    }
                    //db.TrBookingDetail.AddRange(details);




                }
                else
                {
                    int id = 1;
                    var listHeader = db.TrBookingHeader.ToList();
                    if (listHeader.Count > 0)
                    {
                        id = listHeader[listHeader.Count - 1].ID + 1;
                    }

                    book.ID = id;
                    book.BookingNo = ambilNoReg;
                    //cek.NoReferensi = ambilNoRef;
                    book.TanggalBooking = DateTime.Now;
                    book.Active = true;
                    db.TrBookingHeader.Add(book);

                    foreach (var item in details)
                    {
                        item.HeaderID = id;
                        item.Active = true;
                        item.CreatedOn = DateTime.Now;
                        item.ModifiedOn = DateTime.Now;
                    }

                    db.TrBookingDetail.AddRange(details);

                }


                try
                {
                    db.SaveChanges();
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }
            }
        }

        public List<BookingViewModel> GetBookingAktifByID(int id)
        {
            var list = new List<BookingViewModel>();
            using (var db = new PerpustakaanDbContext())
            {
                var det = db.TrBookingDetail.Where(n => n.HeaderID == id);
                foreach (var item in det)
                {
                    var dal = new BukuDAL();
                    var buku = dal.GetBukuByID(item.IDBuku);
                    if (buku != null)
                    {
                        var boking = new BookingViewModel()
                        {
                            IDBuku = buku.ID,
                            IDDetail = item.ID,
                            JudulBuku = buku.JudulBuku,
                            KodeBuku = buku.Kode,
                            Pengarang = buku.Pengarang
                        };
                        list.Add(boking);
                    }
                }
            }
            return list;
        }

        public List<TrBookingHeader> GetBookingHeaderAktifByIDAnggota(int id)
        {
            using (var db = new PerpustakaanDbContext())
            {
                var list = db.TrBookingHeader.Where(n => n.IDAnggota == id &&
                    n.Active == true).ToList();

                return list;
            }
        }

        public static bool RemoveDetailBukuBooking(TrBookingHeader book, List<TrBookingDetail> details)
        {
            using (var db = new PerpustakaanDbContext())
            { 
                var cek = db.TrBookingHeader.FirstOrDefault(n => n.IDAnggota == book.IDAnggota);
                //var ambilNoRef = BorrowHeaderDAL.GetDataById(Convert.ToInt32(book.IDAnggota)).NoReferensi;
                var ambilNoReg = AutoNumberDAL.BookingBukuAutoNumber();
                if (cek != null)
                {
                    cek.Active = false;
                    var det = db.TrBookingDetail.Where(n => n.HeaderID == cek.ID);
                    foreach (var item in det)
                    {
                        item.Active = false;
                    }
                    //db.TrBookingDetail.AddRange(details);
                }
                else
                {
                    int id = 1;
                    var listHeader = db.TrBookingHeader.ToList();
                    if (listHeader.Count > 0)
                    {
                        id = listHeader[listHeader.Count - 1].ID + 1;
                    }

                    book.ID = id;
                    book.BookingNo = ambilNoReg;
                    //cek.NoReferensi = ambilNoRef;
                    book.TanggalBooking = DateTime.Now;
                    book.Active = true;
                    db.TrBookingHeader.Add(book);

                    foreach (var item in details)
                    {
                        item.HeaderID = id;
                        item.Active = true;
                        item.CreatedOn = DateTime.Now;
                        item.ModifiedOn = DateTime.Now;
                    }

                    db.TrBookingDetail.AddRange(details);

                }


                try
                {
                    db.SaveChanges();
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }
            }
        }

        public BookingHeaderViewModel GetHeaderViewModelByID(int id)
        {
            using (var db = new PerpustakaanDbContext())
            {
                var cek = db.TrBookingHeader.FirstOrDefault(n => n.ID == id);
                if (cek != null)
                {
                    var view = new BookingHeaderViewModel()
                    {
                        NoBooking = cek.BookingNo,
                        IDBooking = cek.ID,
                        TanggalKembali = DateTime.Now.AddDays(3),
                        TanggalPinjam = DateTime.Now
                    };
                    return view;
                }
                return null;
            }
        }
    
    
    }
}

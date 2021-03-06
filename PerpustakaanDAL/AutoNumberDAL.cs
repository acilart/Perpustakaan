﻿using System;
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

                var date = DateTime.Now.ToString("yyyy");
                var cek = db.MstAnggota.Where(n => n.KodeAnggota.Contains(date)).ToList();
                if (cek.Count > 0)

                {
                    var item = cek[cek.Count - 1];
                    var urut = item.KodeAnggota.Substring(item.KodeAnggota.Length - 5, 5);
                    var i = int.Parse(urut) + 1;
                    var zero = urut.Substring(0, urut.Length - i.ToString().Length);
                    tmp = "A" + DateTime.Now.ToString("yyyy") + zero + i;
                }
                else
                {
                    tmp = "A" + DateTime.Now.ToString("yyyy") + "00001";
                }
            }
            return tmp;
        }

        public static string KodeBukuAutoNumber()
        {
            var tmp = "";
            using (var db = new PerpustakaanDbContext())
            {
                var date = DateTime.Now.ToString("ddMMyyyy");
                var count = db.MstBuku.Count();
                var cek = db.MstBuku.Where(n => n.Kode.Contains(date)).ToList();
                if (cek.Count > 0)
                {
                    var urut = "000";
                    var i = count + 1;
                    var zero = urut.Substring(0, urut.Length - i.ToString().Length);
                    tmp = DateTime.Now.ToString("ddMMyyyy") + zero + i;
                }
                else
                {
                    tmp = DateTime.Now.ToString("ddMMyyyy") + "001";
                }
            }
            return tmp;
        }

        public static string IuranNoRegAutoNumber()
        {
            var tmp = "";
            using (var db = new PerpustakaanDbContext())
            {
                var date = DateTime.Now.ToString("yyyyMM");
                var cek = db.TrScnHeader.Where(n => n.NoRegistrasi.Contains(date)).ToList();

                if (cek.Count > 0)
                {
                    var item = cek[cek.Count - 1];
                    var urut = item.NoRegistrasi.Substring(item.NoRegistrasi.Length - 4, 4);
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

        public static string PenyimpananBukuNoRegAutoNumber()
        {
            var tmp = "";
            using (var db = new PerpustakaanDbContext())
            {
                var date = DateTime.Now.ToString("yyyyMM");
                var cek = db.TrPlcHeader.Where(n => n.NoRegistrasi.Contains(date)).ToList();

                if (cek.Count > 0)
                {
                    var item = cek[cek.Count - 1];
                    var urut = item.NoRegistrasi.Substring(item.NoRegistrasi.Length - 4, 4);
                    var i = int.Parse(urut) + 1;
                    var zero = urut.Substring(0, urut.Length - i.ToString().Length);
                    tmp = "PLC" + DateTime.Now.ToString("yyyy") + DateTime.Now.ToString("MM") + zero + i;
                }
                else
                {
                    tmp = "PLC" + DateTime.Now.ToString("yyyy") + DateTime.Now.ToString("MM") + "0001";
                }
            }
            return tmp;
        }

        public static string PengembalianBukuNoRegAutoNumber()
        {
            var tmp = "";
            using (var db = new PerpustakaanDbContext())
            {
                var date = DateTime.Now.ToString("yyyyMM");
                var cek = db.TrReturnHeader.Where(n => n.NoRegistrasi.Contains(date)).ToList();

                if (cek.Count > 0)
                {
                    var item = cek[cek.Count - 1];
                    var urut = item.NoRegistrasi.Substring(item.NoRegistrasi.Length - 4, 4);
                    var i = int.Parse(urut) + 1;
                    var zero = urut.Substring(0, urut.Length - i.ToString().Length);
                    tmp = "RTR" + DateTime.Now.ToString("yyyy") + DateTime.Now.ToString("MM") + zero + i;
                }
                else
                {
                    tmp = "RTR" + DateTime.Now.ToString("yyyy") + DateTime.Now.ToString("MM") + "0001";
                }
            }
            return tmp;
        }

        public static string PembayaranNoRegAutoNumber()
        {
            var tmp = "";
            using (var db = new PerpustakaanDbContext())
            {
                var date = DateTime.Now.ToString("yyyyMM");
                var cek = db.TrPmtBukuHeader.Where(n => n.NoRegistrasi.Contains(date)).ToList();

                if (cek.Count > 0)
                {
                    var item = cek[cek.Count - 1];
                    var urut = item.NoRegistrasi.Substring(item.NoRegistrasi.Length - 4, 4);
                    var i = int.Parse(urut) + 1;
                    var zero = urut.Substring(0, urut.Length - i.ToString().Length);
                    tmp = "PMT" + DateTime.Now.ToString("yyyy") + DateTime.Now.ToString("MM") + zero + i;
                }
                else
                {
                    tmp = "PMT" + DateTime.Now.ToString("yyyy") + DateTime.Now.ToString("MM") + "0001";
                }
            }
            return tmp;
        }

        public static string PembayaranDendaNoRegAutoNumber()
        {
            var tmp = "";
            using (var db = new PerpustakaanDbContext())
            {
                var date = DateTime.Now.ToString("yyyyMM");
                var cek = db.TrDendaHeader.Where(n => n.NoRegistrasi.Contains(date)).ToList();

                if (cek.Count > 0)
                {
                    var item = cek[cek.Count - 1];
                    var urut = item.NoRegistrasi.Substring(item.NoRegistrasi.Length - 4, 4);
                    var i = int.Parse(urut) + 1;
                    var zero = urut.Substring(0, urut.Length - i.ToString().Length);
                    tmp = "PMT" + DateTime.Now.ToString("yyyy") + DateTime.Now.ToString("MM") + zero + i;
                }
                else
                {
                    tmp = "PMT" + DateTime.Now.ToString("yyyy") + DateTime.Now.ToString("MM") + "0001";
                }
            }
            return tmp;
        }

        public static string PeminjamanBukuNoRegAutoNumber()
        {
            var tmp = "";
            using (var db = new PerpustakaanDbContext())
            {
                var date = DateTime.Now.ToString("yyyyMM");
                var cek = db.TrBrwHeader.Where(n => n.NoRegistrasi.Contains(date)).ToList();

                if (cek.Count > 0)
                {
                    var item = cek[cek.Count - 1];
                    var urut = item.NoRegistrasi.Substring(item.NoRegistrasi.Length - 4, 4);
                    var i = int.Parse(urut) + 1;
                    var zero = urut.Substring(0, urut.Length - i.ToString().Length);
                    tmp = "BRW" + DateTime.Now.ToString("yyyy") + DateTime.Now.ToString("MM") + zero + i;
                }
                else
                {
                    tmp = "BRW" + DateTime.Now.ToString("yyyy") + DateTime.Now.ToString("MM") + "0001";
                }
            }
            return tmp;
        }

        public static string PenggantianBukuNoRegAutoNumber()
        {
            var tmp = "";
            using (var db = new PerpustakaanDbContext())
            {
                var date = DateTime.Now.ToString("yyyyMM");
                var cek = db.TrRpcHeader.Where(n => n.NoRegistrasi.Contains(date)).ToList();

                if (cek.Count > 0)
                {
                    var item = cek[cek.Count - 1];
                    var urut = item.NoRegistrasi.Substring(item.NoRegistrasi.Length - 4, 4);
                    var i = int.Parse(urut) + 1;
                    var zero = urut.Substring(0, urut.Length - i.ToString().Length);
                    tmp = "RPC" + DateTime.Now.ToString("yyyy") + DateTime.Now.ToString("MM") + zero + i;
                }
                else
                {
                    tmp = "RPC" + DateTime.Now.ToString("yyyy") + DateTime.Now.ToString("MM") + "0001";
                }
            }
            return tmp;
        }


        public static string BookingBukuAutoNumber()
        {
            var tmp = "";
            using (var db = new PerpustakaanDbContext())
            {
                var date = DateTime.Now.ToString("yyyyMM");
                var cek = db.TrBookingHeader.Where(n => n.BookingNo.Contains(date)).ToList();

                if (cek.Count > 0)
                {
                    var item = cek[cek.Count - 1];
                    var urut = item.BookingNo.Substring(item.BookingNo.Length - 4, 4);
                    var i = int.Parse(urut) + 1;
                    var zero = urut.Substring(0, urut.Length - i.ToString().Length);
                    tmp = "BOOK" + DateTime.Now.ToString("yyyy") + DateTime.Now.ToString("MM") + zero + i;
                }
                else
                {
                    tmp = "BOOK" + DateTime.Now.ToString("yyyy") + DateTime.Now.ToString("MM") + "0001";
                }
            }
            return tmp;
        }


    }
}

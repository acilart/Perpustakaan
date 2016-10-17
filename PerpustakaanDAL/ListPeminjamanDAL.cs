using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Perpustakaan.ViewModel;
using PerpustakaanModel;
using System.Data.Entity.Validation;


namespace PerpustakaanDAL
{
    public class ListPeminjamanDAL
    {
        public static List<ListPinjamanViewModel> getList() {

        
            var list = new List<ListPinjamanViewModel>();

            using (var db = new PerpustakaanDbContext())
            {
                var brwHeadDAL = new BorrowHeaderDAL();
                var pinjam = brwHeadDAL.GetAllData();

                foreach (var item in pinjam)
	                {
                        var ambilbukuDAL = BorrowDetailDAL.GetAllDataByID(item.ID).Count();
	                    var ambilnamaDAL = AnggotaDAL.GetAnggotaByID(item.ID).Nama;
                    var listpinjam = new ListPinjamanViewModel()
                    {
                        ID = item.ID,
                        NoRegistrasi = item.NoRegistrasi,
                        Nama = ambilnamaDAL,
                        TglKembali = item.TanggalKembali,
                        TglPinjam = item.TanggalPinjam,
                        JumlahBuku = ambilbukuDAL

                    };
                    list.Add(listpinjam);
	               }
   
            }

            return list;
        }

        public static  ListPinjamanViewModel getListAnggotaOnly(int ID)
        {


            var list = new ListPinjamanViewModel();

            using (var db = new PerpustakaanDbContext())
            {
                var brwHeadDAL = new BorrowHeaderDAL();
                var pinjam = brwHeadDAL.GetDataByIdAnggota(ID);

                if (pinjam!=null)
                {
                    var ambilbukuDAL = BorrowDetailDAL.GetAllDataByID(pinjam.ID).Count();
                    var ambilnamaDAL = AnggotaDAL.GetAnggotaByID(ID).Nama;
                    var listpinjam = new ListPinjamanViewModel()
                    {
                        ID = pinjam.ID,
                        NoRegistrasi = pinjam.NoRegistrasi,
                        Nama = ambilnamaDAL,
                        TglKembali = pinjam.TanggalKembali,
                        TglPinjam = pinjam.TanggalPinjam,
                        JumlahBuku = ambilbukuDAL

                    };

                    return listpinjam; 
                }
                return null;
                    

            }

          
        }

        public static List<ListPinjamanViewModel> getListDetail(int ID)
        {
            var list = new List<ListPinjamanViewModel>();
            using (var db = new PerpustakaanDbContext())
            {

                var brwHeadDAL = new BorrowHeaderDAL();
                var headTglKembali = brwHeadDAL.GetDataByIdonly(ID).TanggalKembali;
                var headTglPinjam = brwHeadDAL.GetDataByIdonly(ID).TanggalPinjam;
 
                var brwDetailDAL = new BorrowDetailDAL();
                var pinjam = brwDetailDAL.GetDataByID(ID);


                foreach (var item in pinjam)
                {
                   
                    var ts = new TimeSpan();
                    //ts = DateTime.Now.Subtract(Convert.ToDateTime(headTglKembali));
                    
                    ts = Convert.ToDateTime(headTglKembali).Subtract(DateTime.Now);
                    
                    string ambiljudulDAL = "";
                    string ambilkodebukuDAL = "";
                    var buku = BukuDAL.GetBukuPinjam(item.IDBuku);
                    if (buku != null)
                    {
                        ambiljudulDAL = buku.JudulBuku;
                        ambilkodebukuDAL = buku.Kode;
                    }

                    var listpinjam = new ListPinjamanViewModel()
                    {
                        KodeBuku = ambilkodebukuDAL,
                        JudulBuku = ambiljudulDAL,
                        Terlambat = ts.Days,
                        Denda =  ts.Days * 5000
                     
                    };
                    list.Add(listpinjam);
                }

            }

            return list;
        }

        public static List<ListPinjamanViewModel> searchByNo(string No){

            var list = new List<ListPinjamanViewModel>();

            using (var db = new PerpustakaanDbContext())
            {
                var brwHeadDAL = new BorrowHeaderDAL();
                var pinjam = brwHeadDAL.GetAllData();
                
                foreach (var item in pinjam)
                {
                    var ambilbukuDAL = BorrowDetailDAL.GetAllDataByID(item.ID).Count();
                    var ambilnamaDAL = AnggotaDAL.GetAnggotaByID(item.ID).Nama;

                    var listpinjam = new ListPinjamanViewModel()
                    {
                        ID = item.ID,
                        NoRegistrasi = item.NoRegistrasi,
                        Nama = ambilnamaDAL,
                        TglKembali = item.TanggalKembali,
                        TglPinjam = item.TanggalPinjam,
                        JumlahBuku = ambilbukuDAL
                    };

                    list.Add(listpinjam);
    
                }

            }

            return list.Where(n=>n.NoRegistrasi.ToUpper().Contains(No.ToUpper())).ToList();
        }
        
        public static List<ListPinjamanViewModel> searchByNama(string nama)
        {

            var list = new List<ListPinjamanViewModel>();

            using (var db = new PerpustakaanDbContext())
            {
                
                
                var brwHeadDAL = new BorrowHeaderDAL();
                var pinjam = brwHeadDAL.GetAllData();
                
                foreach (var item in pinjam)
                {
                    var ambilbukuDAL = BorrowDetailDAL.GetAllDataByID(item.ID).Count();
                    var ambilnamaDAL = AnggotaDAL.GetAnggotaByID(item.ID).Nama;
                    var listpinjam = new ListPinjamanViewModel()
                    {
                        ID = item.ID,
                        NoRegistrasi = item.NoRegistrasi,
                        Nama = ambilnamaDAL,
                        TglKembali = item.TanggalKembali,
                        TglPinjam = item.TanggalPinjam,
                        JumlahBuku = ambilbukuDAL
                    };

                    list.Add(listpinjam);


                }

            }

            return list.Where(n=>n.Nama.ToUpper().Contains(nama.ToUpper())).ToList();
        }


    }
}

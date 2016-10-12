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

        public static List<ListPinjamanViewModel> getListDetail(int ID)
        {
            var list = new List<ListPinjamanViewModel>();
            using (var db = new PerpustakaanDbContext())
            {
               
                var brwDetailDAL = new BorrowDetailDAL();
                var pinjam = brwDetailDAL.GetDataByID(ID);

                foreach (var item in pinjam)
                {
                    string ambiljudulDAL = "";
                    string ambilkodebukuDAL = "";
                    var buku =  BukuDAL.GetBukuPinjam(item.IDBuku);
                    if(buku!=null){
                        ambiljudulDAL = buku.JudulBuku;
                        ambilkodebukuDAL = buku.Kode;
                    }
                    
                    var listpinjam = new ListPinjamanViewModel()
                    {
                        KodeBuku= ambilkodebukuDAL,
                        JudulBuku = ambiljudulDAL
                        

                    };
                    list.Add(listpinjam);
                }

            }

            return list;
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

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Perpustakaan.ViewModel;
using PerpustakaanModel;
namespace PerpustakaanDAL
{
    public class LemariDAL
    {
        public List<LemariViewModel> GetLemariAvailable()
        {
            var list = new List<LemariViewModel>();
            using (var db = new PerpustakaanDbContext())
            {
                var cabDal = new CabinetDAL();
                var cabinet = cabDal.GetAllCabinet();
                
                foreach (var item in cabinet)
                {
                    var rows = CabinetRowDAL.GetAllCabinetRowByIdCabinet(item.ID);
                    foreach (var row in rows)
                    {
                        var cells = CabinetCellDAL.GetCabineCellAvailableByIdRow(row.ID);
                        foreach (var cell in cells)
                        {
                            var lemari = new LemariViewModel()
                            {
                                Lokasi = item.Kode + ", " + row.Kode + ", " + cell.Kode,
                                Deskripsi = "Lemari " + item.Kode + ", Baris " + row.Kode + ", Kolom " + cell.Kode,
                                Kapasitas = cell.Kapasitas,
                                Terisi = cell.Terisi,
                                Kosong = cell.Kosong
                            };
                            list.Add(lemari);
                        }
                    }
                }
            }
            return list;  
        }
    }
}

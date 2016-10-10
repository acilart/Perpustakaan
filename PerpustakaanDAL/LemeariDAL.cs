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
                                IDCell=cell.ID,
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

        public LemariViewModel GetLemariByIDCell(int id)
        {
            using (var db = new PerpustakaanDbContext())
            {
                var cellDAL = new CabinetCellDAL();
                var cell = cellDAL.GetCellByID(id);
                if (cell != null)
                {
                    var rowDAL = new CabinetRowDAL();
                    var row = rowDAL.GetRowByID(cell.IDBaris);
                    if (row != null)
                    {
                        var cabDAL = new CabinetDAL();
                        var cab = cabDAL.GetCabinetByID(row.IDRak);
                        if (cab != null)
                        {
                            var lemari = new LemariViewModel()
                            {
                                IDCell = cell.ID,
                                Deskripsi = "Lemari " + cab.Kode + ", Baris " + row.Kode + ", Kolom " + cell.Kode
                            };
                            return lemari;
                        }
                        return null;
                    }
                    return null;
                }
                return null;
            }
        }

        public bool InisialisasiDataLemari()
        {
            using (var db = new PerpustakaanDbContext())
            {
               // var listCab = db.MstCabinet.ToList();
                var listRow = db.MstCabinetRow.ToList();
                var listCell = new List<MstCabinetCell>();
                string[] array3 = { "A", "B", "C", "D" };
                //for (int i = 0; i < 4; i++)
                //{
                //    var cab = new MstCabinet()
                //    {
                //        Kode = array3[i],
                //        Kapasitas = 200

                //    };
                //    listCab.Add(cab);
                //}

                //foreach (var item in listCab)
                //{
                //    for (int x = 0; x < listCab.Count; x++)
                //    {
                //        var row = new MstCabinetRow()
                //        {
                //            IDRak = item.ID,
                //            Kode = item.Kode + x,
                //            Kapasitas = 50
                //        };
                //        listRow.Add(row);
                //    }

                //}

                foreach (var item in listRow)
                {
                    for (int i = 0; i < 2; i++)
                    {
                        var cell = new MstCabinetCell()
                        {
                            IDBaris = item.ID,
                            Kode = "K" + (i + 1),
                            Kapasitas = 25,
                            Terisi = 0,
                            Kosong = 25
                        };
                        listCell.Add(cell);
                    }
                }


               // db.MstCabinet.AddRange(listCab);
                //db.MstCabinetRow.AddRange(listRow);
                db.MstCabinetCell.AddRange(listCell);
                try
                {
                    db.SaveChanges();
                    return true;
                }
                catch (DbEntityValidationException)
                {
                    return false;
                    // throw;
                }
            }

        }
    }
}

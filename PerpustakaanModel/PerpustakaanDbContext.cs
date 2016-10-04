using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;


namespace PerpustakaanModel
{
    public class PerpustakaanDbContext : DbContext
    {

        public PerpustakaanDbContext()
            : base("name=PerpusConn")
        {

        }
        public virtual DbSet<MstAnggota> MstAnggota { get; set; }
        public virtual DbSet<MstBuku> MstBuku { get; set; }
        public virtual DbSet<MstCabinet> MstCabinet { get; set; }
        public virtual DbSet<MstCabinetCell> MstCabinetCell { get; set; }
        public virtual DbSet<MstCabinetRow> MstCabinetRow { get; set; }
        public virtual DbSet<MstKategori> MstKategori { get; set; }
        public virtual DbSet<MstKecamatan> MstKecamatan { get; set; }
        public virtual DbSet<MstKelurahan> MstKelurahan { get; set; }
        public virtual DbSet<MstKota> MstKota { get; set; }
        public virtual DbSet<MstOpsiPenggantian> MstOpsiPenggantian { get; set; }
        public virtual DbSet<MstPenerbit> MstPenerbit { get; set; }
        public virtual DbSet<MstPetugas> MstPetugas { get; set; }
        public virtual DbSet<MstProvinsi> MstProvinsi { get; set; }
        public virtual DbSet<MstSumberBuku> MstSumberBuku { get; set; }
        public virtual DbSet<MstTipeIuran> MstTipeIuran { get; set; }
        public virtual DbSet<TrBrwDetail> TrBrwDetail { get; set; }
        public virtual DbSet<TrBrwHeader> TrBrwHeader { get; set; }
        public virtual DbSet<TrDendaDetail> TrDendaDetail { get; set; }
        public virtual DbSet<TrDendaHeader> TrDendaHeader { get; set; }
        public virtual DbSet<TrPlcDetail> TrPlcDetail { get; set; }
        public virtual DbSet<TrPlcHeader> TrPlcHeader { get; set; }
        public virtual DbSet<TrPmtBukuDetail> TrPmtBukuDetail { get; set; }
        public virtual DbSet<TrPmtBukuHeader> TrPmtBukuHeader { get; set; }
        public virtual DbSet<TrPmtBukuSettlement> TrPmtBukuSettlement { get; set; }
        public virtual DbSet<TrReturnDetail> TrReturnDetail { get; set; }
        public virtual DbSet<TrReturnHeader> TrReturnHeader { get; set; }
        public virtual DbSet<TrRpcDetail> TrRpcDetail { get; set; }
        public virtual DbSet<TrRpcHeader> TrRpcHeader { get; set; }
        public virtual DbSet<TrScnDetail> TrScnDetail { get; set; }
        public virtual DbSet<TrScnHeader> TrScnHeader { get; set; }
        public virtual DbSet<TrStock> TrStock { get; set; }
    }

}


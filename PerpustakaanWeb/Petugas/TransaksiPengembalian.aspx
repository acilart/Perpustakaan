<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TransaksiPengembalian.aspx.cs" Inherits="PerpustakaanWeb.Petugas.TransaksiPengembalian" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="box box-info">
        <div class="box-header">
            <h2>Form Pengembalian</h2>
        </div>
        <div class="box-body">
            <%--<form>--%>
                
                <div class="form-horizontal">
                    
                    <div class="form-group">                       
                        <label class="control-label col-md-2" for="NoRef">No Referensi</label>
                        <div class="input-group col-md-10">
                            <input class="form-control text-box single-line" id="NoRef" name="NoRef" type="text" value="" readonly/>
                            <span class="field-validation-valid text-danger" data-valmsg-for="NoRef" data-valmsg-replace="true"></span>
                            <span class="input-group-btn">
                                <button type="button" name="search" id="search-btn" class="btn btn-flat">
                                     <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                </button>                                
                            </span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="NoReg">No Registrasi</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="NoReg" name="NoReg" type="text" value="" readonly/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="Nama">Nama Anggota</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="Nama" name="Nama" type="text" value="" readonly />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="TglPinjam">Tanggal Pinjam</label>
                        <div class="col-md-10">
                            <input class="form-control single-line" id="TglPinjam" name="TglPinjam" type="text"  />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="TglKembali">Tanggal Kembali</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="TglKembali" name="TglKembali" type="text" value="" readonly />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="TglDikembalikan">Tanggal Dikembalikan</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="TglDikembalikan" name="TglDikembalikan" type="text" value="" readonly />
                        </div>
                    </div>

                </div>
            </form>
            <%--<div>
                <a href="/Anggota">Back to List</a>
            </div>--%>
        </div>
    </div>

    <%-- ini untuk table buku yang dipinjam --%>
    <div class="box">
        <div class="box-header with-border">
            <h3 class="box-title">List Buku Pinjaman</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <table class="table table-bordered">
               <thead>
                <tr>
                    <th style="width: 10%">Kode Buku</th>
                    <th style="width: 60%">Judul Buku</th>
                    <th style="width: 10%">Laporan Kehilangan</th>
                    <th style="width: 10%">Terlambat(Hari)</th>
                    <th style="width: 10%">Denda(Rp)</th>
                </tr>   
               </thead> 
               <tbody id="buku-borrow">                          
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>12000</td>
                </tr>
                </tbody>
            </table>
        </div>
        <!-- /.box-body -->
        <div class="box-footer clearfix">
            <input type="submit" value="Clear" class="btn btn-primary" />
            <input type="submit" value="Save" class="btn btn-primary" />
        </div>
    </div>
    <!-- /.box -->
    
    <%--MODAL NO REFERENSI POPUP--%>
    <div class="modal" id="modal-borrow" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span></button>
                    <h4>Data Peminjaman Buku</h4>                
                </div>
           <div class="modal-body">
               <input id="borrowID" type="hidden" />
               <div class="row">
                   <div class="col-md-4">
                       <input type="text" id="search-borrow" class="form-control" />
                   </div>
               </div>
               <div class="col-md-12">
                   <table class="table table-striped text-center">
                       <thead>
                           <tr>
                               <th>No</th>
                               <th>No Referensi</th>
                               <th>Nama Anggota</th>
                               <th></th>                              
                           </tr>
                       </thead>
                       <tbody id="data-borrow">                           
                       </tbody>
                   </table>
               </div>
           </div>                
           </div>                     
        </div>
    </div>

    <script src="../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <%-- SCRIPT --%>
    <script>

        //untuk munculin pop up modal-borrow
        $('#search-btn').click(function () {
            $('#modal-borrow').modal('show');
            LoadBorrow();
        })
        
        //untuk munculin data di modal
        function LoadBorrow() {
            $.ajax({
                url: '../Service/PengembalianService.asmx/GetPeminjaman',
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json;charset=utf-8',
                success: function (data){
                var listborrow = "";
                var Icount = 0;
                $.each(data.d, function (index, item) {
                    listborrow += '<tr>' +
                        '<td>' + ++Icount + '</td>' +
                        '<td>' + item.NoReferensi + '</td>' +
                        '<td>' + item.NamaAnggota + '</td>' +
                        '<td> <input type="button" text="Pilih" value="Choose" class="btn btn-primary" onclick="Choose(' + item.ID + ')"/>' + '</td>' +
                             '</tr>'
                });
                $('#data-borrow').html(listborrow);
        }
            })
        }


        // untuk ngeload data yang dipilih di modal untuk masuk ke form peminjaman
        function Choose(Id) {           
            $.ajax({
                url: '../Service/PengembalianService.asmx/GetPeminjamanByID',
                type: 'POST',
                data:'{"id":"' + Id + '"}',
                dataType: 'JSON',
                contentType: 'application/json;charset=utf-8',
                success: function (data) {
                    var listborrow = "";
                    var Icount = 0;
                    $.each(data.d, function (index, item) {
                        var HariIni = new Date();
                      
                        var datepinjam = new Date(parseInt((item.TanggalPinjam).replace(/[^\d]/g, '')));
                        var datekembali = new Date(parseInt((item.TanggalKembali).replace(/[^\d]/g, '')));
                       
                        $("#NoRef").val(item.NoReferensi);
                        
                        $("#Nama").val(item.NamaAnggota);
                        $("#TglPinjam").val(datepinjam);
                        $("#TglKembali").val(datekembali);
                        $("#TglDikembalikan").val(HariIni);
                        LoadBukuPinjam();
                        $('#modal-borrow').modal('hide');                        
                    });;                   
                }
            })
        }

        //fungsi untuk text box pencarian nomor referensi peminjaman
        $('#search-borrow').keyup(function () {
            var searchValue = $('#search-borrow').val();
            LoadDataSearch(searchValue);
        });
        //fungsi untuk mencari di pop up peminjaman
        function LoadDataSearch(searchValue) {
            $.ajax({
                url: '../Service/PengembalianService.asmx/GetPeminjamanBySearch',
                type: 'POST',
                data: '{"Search":"' + searchValue + '"}',
                dataType: 'JSON',
                contentType: 'application/json;charset=utf-8',
                success: function (data) {
                    var listborrow = "";
                    var Icount = 0;
                    $.each(data.d, function (index, item) {
                        listborrow += '<tr>' +
                            '<td>' + ++Icount + '</td>' +
                            '<td>' + item.NoReferensi + '</td>' +
                            '<td>' + item.NamaAnggota + '</td>' +
                            '<td> <input type="button" text="Pilih" value="Choose" class="btn btn-primary" onclick="Choose(' + item.ID + ')"/>' + '</td>' +
                                 '</tr>'
                    });
                    $('#data-borrow').html(listborrow);
                }
            })
        }

        //fungsi untuk menampilkan buku yang di pinjam
        function LoadBukuPinjam(id) {
            $.ajax({
                url: '../Service/PengembalianService.asmx/GetBukuPinjam',
                data: '{"id":"' + id + '"}',
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json;charset=utf-8',
                success: function (data) {
                    var listbuku = '';
                    $.each(data.d, function (index, item) {
                        listbuku += '<tr>' +
                            '<td>' + item.KodeMstBuku + '</td>' +
                            '<td>' + item.Judul + '</td>'+
                            '</tr>'
                    });
                    $('#buku-borrow').html(listbuku);
                }
            })
        }
        

    </script>
    
</asp:Content>

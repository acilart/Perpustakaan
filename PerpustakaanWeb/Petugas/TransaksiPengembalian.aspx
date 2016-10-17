<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterPetugas.Master" AutoEventWireup="true" CodeBehind="TransaksiPengembalian.aspx.cs" Inherits="PerpustakaanWeb.Petugas.TransaksiPengembalian" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <% if (HttpContext.Current.Session["Email"] != null && HttpContext.Current.Session["ID"] != null && HttpContext.Current.Session["Role"].ToString() == "petugas")
        { %>

    <link href="../dist/css/datepicker3.css" rel="stylesheet" />
    <div class="box box-info">
        <div class="box-header">
            <h2>Form Pengembalian</h2>
        </div>
        <div class="box-body">
<form name="Form1">
                <div class="form-horizontal">
                    <input id="ReturnID" type="hidden" />
                    <input id="BorrowID" type="hidden" />
                    <div class="form-group">
                        <label class="control-label col-md-2" for="NoRef">No Referensi</label>
                        <div class="input-group col-md-10">
                            <input class="form-control text-box single-line" id="NoRef" name="NoRef" type="text" value="" readonly />
                            <span class="field-validation-valid text-danger" data-valmsg-for="NoRef" data-valmsg-replace="true"></span>
                            <span class="input-group-btn">
                                <button type="button" name="search" id="search-borr" class="btn btn-flat">
                                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                </button>
                            </span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="NoReg">No Registrasi</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="NoReg" name="NoReg" type="text" value="" readonly />
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
                            <input class="form-control single-line" id="TglPinjam" name="TglPinjam" type="text" readonly />
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
                        <div class="input-group-date col-md-10">
                            <input class="form-control col-md-10" id="TglDikembalikan" name="TglDikembalikan" type="text" value="" readonly />
                            
                        </div>
                    </div>

                </div>
            </form>
            <%--<div>
                <a href="/Anggota">Back to List</a>
            </div>--%>
        </div></div>

    <%-- ini untuk table buku yang dipinjam --%>
    <div class="box">
        <div class="box-header with-border">
            <h3 class="box-title">List Buku Pinjaman</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <table class="table table-bordered text-center">
                <thead>
                    <tr>
                        <th class="hidden">ID BUKU</th>
                        <th style="width: 10%" class="text-center">Kode Buku</th>
                        <th style="width: 60%" class="text-center">Judul Buku</th>
                        <th style="width: 10%" class="text-center">Laporan Kehilangan</th>
                        <th style="width: 10%" class="text-center">Terlambat(Hari)</th>
                        <th style="width: 10%" class="text-center">Denda(Rp)</th>
                    </tr>
                </thead>
                <tbody id="buku-borrow">
                                       
                </tbody>
            </table>
        </div>
        <!-- /.box-body -->
        <div class="box-footer clearfix">
            <button type="button" name="search" id="btn-clear" value="clear" class="btn btn-primary">Clear</button>
            <input  type="button" value="Save" class="btn btn-primary" onclick="SavePengembalian()" />
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
                    <div class="col-md-12">
                        <table class="table table-striped text-center">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>No Registrasi</th>
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
    <script src="../dist/js/bootstrap-datepicker.js"></script>


  
    
    <%-- SCRIPT --%>
    <script>

        //untuk datepicker di tanggal pengembalian 
        //$('#TglDikembalikan').datepicker({
        //    format : "dd/MM/yyyy",
        //    autoclose: true 
        //});
        var tglppinjam;
        var tglkembali;       

        //untuk munculin pop up modal-borrow
        $('#search-borr').click(function () {
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
                                     
                    $.each(data.d, function (index, item) {                      
                        tglpinjam = item.TanggalPinjam;
                        tglkembali = item.TanggalKembali;
                        TglDikembalikan = new Date();
                        $('#BorrowID').val(Id);
                        $("#ReturnID").val(item.IDAnggota);
                        $("#NoRef").val(item.NoReferensi);                        
                        $("#Nama").val(item.NamaAnggota);
                        $("#TglPinjam").val(convertDate(tglpinjam));
                        $("#TglKembali").val(convertDate(tglkembali));
                        $("#TglDikembalikan").val(convertDateNow(TglDikembalikan));                     
                        $('#modal-borrow').modal('hide');                        
                    });;                   
                }
            })




            $.ajax({
                url: '../Service/PengembalianService.asmx/GetBukuPinjam',
                data: '{"id":"' + Id + '"}',
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json;charset=utf-8',
                success: function (data) {
                    var listbuku = '';
                    var totaldenda = 0;
                    $.each(data.d, function (index, item) {
                        listbuku += '<tr>' +
                            '<td>' + item.KodeMstBuku + '</td>' +
                            '<td>' + item.Judul + '</td>' +
                            '<td><input type="checkbox" id="cb' + item.IDBuku + '">' + '</td>' + //value satu untuk kehilangan buku
                            '<td>' + item.Terlambat + '</td>' +
                            '<td>' + item.denda + '</td>' +
                            '<td><input type="hidden" value="' + item.IDBuku + '"/></td>' +
                            '</tr>';
                        totaldenda = (totaldenda + item.denda)
                    });
                    $('#buku-borrow').html(listbuku);
                    $('#buku-borrow').append('<tr><td></td><td>Jumlah</td><td></td><td></td><td>' + totaldenda + '</td><td></td></tr>');
                }
            })







        }

        //fungsi untuk text box pencarian nomor referensi peminjaman
        //$('#search-borrow').keyup(function () {
        //    var searchValue = $('#search-borrow').val();
        //    LoadDataSearch(searchValue);
        //});
        ////fungsi untuk mencari di pop up peminjaman
        //function LoadDataSearch(searchValue) {
        //    $.ajax({
        //        url: '../Service/PengembalianService.asmx/GetPeminjamanBySearch',
        //        type: 'POST',
        //        data: '{"Search":"' + searchValue + '"}',
        //        dataType: 'JSON',
        //        contentType: 'application/json;charset=utf-8',
        //        success: function (data) {
        //            var listborrow = "";
        //            var Icount = 0;
        //            $.each(data.d, function (index, item) {

        //                listborrow += '<tr>' +
        //                    '<td>' + ++Icount + '</td>' +
        //                    '<td>' + item.NoReferensi + '</td>' +
        //                    '<td>' + item.NamaAnggota + '</td>' +
        //                    '<td> <input type="button" text="Pilih" value="Choose" class="btn btn-primary" onclick="Choose(' + item.ID + ')"/>' + '</td>' +
        //                         '</tr>'
        //            });
        //            $('#data-borrow').html(listborrow);
        //        }
        //    })
        //}
 
                

        //fungsi simpan
        function SavePengembalian() {
            var header = {};
            header.IdAnggota = $("#ReturnID").val();
            header.IDBorrow = $('#BorrowID').val();
            header.NoReferensi = $('#NoRef').val();            
            var TanggalPinjam = $("#TglPinjam").val();
            var TanggalKembali = $("#TglKembali").val();
            var TanggalDikembalikan = $("TglDikembalikan").val();
            header.TanggalPinjam = convertDate(TanggalPinjam);
            header.TanggalKembali = convertDate(TanggalKembali);
            header.TanggalDikembalikan = convertDateNow(TanggalDikembalikan);
            header.CreatedBy = '<%= Session["ID"] %>';

            var list = [];
            $("#buku-borrow tr").each(function () {              
                var data = {};
                var cek = $('#cb' + $(this).find("td:nth-child(6)").find("input[type=hidden]").val()).is(":checked");
                data.IDBuku = $(this).find('td:nth-child(6)').find("input[type=hidden]").val();
                data.SudahDiganti = false;
                data.SudahDibayar = false;
                if ($(this).find("td:nth-child(5)").text() != 0) {                    
                    header.Denda = true;
                    header.SudahDibayar = 0;
                }
                else {
                    header.Denda = false;
                }
                data.LaporKehilangan = cek;
                list.push(data);
            });
            var param = { header: header, detail: list };
            $.ajax({
                url: '../Service/PengembalianService.asmx/SimpanPengembalian',
                data: JSON.stringify(param),
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json;charset=utf-8',
                success: function (response) {
                    alert("Transaksi Pengembalian Berhasil Disimpan");
                }
            })
            
        }


        //fungsi untuk mengubah tampilan di dalam form dengan format dd-mm-yy
        function convertDate(tanggal) {

            var dateString = tanggal.substr(6);
            var currentTime = new Date(parseInt(dateString));
            var month = currentTime.getMonth() + 1;
            var day = currentTime.getDate();
            var year = currentTime.getFullYear();
            var date = month + "/" + day + "/" + year;
            return date;
        }
        //fungsi convert tanggal khusus tanggal system
        function convertDateNow(tanggal) {            
            var currentTime = new Date();
            var month = currentTime.getMonth() + 1;
            var day = currentTime.getDate();
            var year = currentTime.getFullYear();
            var date = month + "/" + day + "/" + year;
            return date;
        }
        


        //fungsi clearfiled
     
        $("#btn-clear").click(function () {
         
            $('#BorrowID').val('');
            $("#ReturnID").val('');
            $("#NoRef").val('');
            $("#Nama").val('');
            $("#TglPinjam").val('');
            $("#TglKembali").val('');
            $("#TglDikembalikan").val('');

            $("#buku-borrow").html(null);
        });
       
      
        $(document).ready(function () {
            Choose(Id);
        });

        


    </script>
    <%
      }
        else
        {
            Response.Redirect("../LoginAnggota.aspx");
        }
                    %>
</asp:Content>

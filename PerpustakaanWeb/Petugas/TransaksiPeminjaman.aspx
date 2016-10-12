<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="TransaksiPeminjaman.aspx.cs" Inherits="PerpustakaanWeb.Petugas.TransaksiPeminjaman" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--1.AMBIL DATA NO REGISTRASI DAN NO REFERENSI
    2.AMBIL VALUE DARI CHECKBOX DAN DI CONFIRM
    3.SAVE KE TABEL ANGGOTA, BRW HEADER, DAN BRW DETAIL (TERMASUK UPDATE STOCK)
    4.VALIDASI FORM--%>

    <div class="box box-info">
        <div class="box-header">
            <h2>Form Peminjaman</h2>
        </div>
        <div class="box-body">
            <form id="formAnggota" method="post">
                <div class="form-horizontal">

                    <div class="form-group">
                        <label class="control-label col-md-2" for="Nama">Nama</label>
                        <div class="input-group col-md-10">
                            <input class="form-control text-box single-line" id="Nama" name="Nama" type="text" value="" readonly />
                            <span class="field-validation-valid text-danger" data-valmsg-for="Nama" data-valmsg-replace="true"></span>
                            <span class="input-group-btn">
                                <button type="button" name="search" id="search-btn" class="btn btn-flat">
                                    <span class="btn btn-search">Search</span>
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
                        <label class="control-label col-md-2" for="NoRef">No Referensi</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="NoRef" name="NoRef" type="text" value="" readonly />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="TglPinjam">Tanggal Pinjam</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="TglPinjam" name="TglPinjam" type="date" value="" readonly />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="TglKembali">Tanggal Kembali</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="TglKembali" name="TglKembali" type="date" value="" readonly />
                        </div>
                    </div>

                </div>
                <input type="button" id="btn-tambah" value="Tambah Pinjaman" class="btn btn-primary" />
            </form>

        </div>
    </div>

     <div class="box">
        <div class="box-header with-border">
            <h3 class="box-title">List Buku Pinjaman</h3>
            <input type="submit" value="Tambah" class="btn btn-primary" style="float: right;" />
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <table class="table table-bordered">
                <tr>
                    <th style="width: 5%">No</th>
                    <th style="width: 13%">Kode Buku</th>
                    <th style="width: 50%">Judul Buku</th>
                    <th style="width: 20%">Pengarang</th>
                    <th style="width: 12%">Action</th>
                </tr>
                <tr id="contoh">
                    
                </tr>
            </table>
        </div>
        <!-- /.box-body -->
        <div class="box-footer clearfix">
            <input type="submit" value="Clear" class="btn btn-primary" />
            <input type="submit" value="Save" class="btn btn-primary" />
            <ul class="pagination pagination-sm no-margin pull-right">
                <li><a href="#">&laquo;</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">&raquo;</a></li>
            </ul>
        </div>
    </div>
    <!-- /.box -->

    <%--MODAL ANGGOTA POPUP--%>
    <div class="modal" id="modal-anggota" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4>Daftar Anggota Perpustakaan</h4>
                </div>
                <div class="modal-body">
                    <input id="anggotaID" type="hidden" />

                    <div class="row">
                        <br />
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" id="txt-anggotaS" class="form-control" />
                                </div>
                                <div class="col-md-2">
                                    <button type="button" id="search-anggota" class="btn btn-primary">Search</button>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="col-md-12">
                        <table class="table table-striped text-center">
                            <thead>
                                <tr>
                                    <th>Kode Anggota</th>
                                    <th>Nama Anggota</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id="data-anggota">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--MODAL BUKU POPUP--%>
    <div class="modal" id="modal-buku" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4>Daftar Anggota Perpustakaan</h4>
                </div>
                <div class="modal-body">
                    <input id="bukuID" type="hidden" />

                    <div class="row">
                        <br />
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" id="txt-bukuS" class="form-control" />
                                </div>
                                <div class="col-md-2">
                                    <button type="button" id="search-buku" class="btn btn-default">Search</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <table class="table table-striped text-center">
                            <thead>
                                <tr>
                                    <th>Kode Buku</th>
                                    <th>Judul Buku</th>
                                    <th>Pengarang</th>
                                    <th>Pilih</th>
                                </tr>
                            </thead>
                            <tbody id="data-buku">
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="box-footer clearfix" style="float:right;">
                            <input type="button" value="Cancel" class="btn btn-primary" />
                            <input type="button" id="confirm" value="Confirm" class="btn btn-primary" />
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    <script src="../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            LoadAnggota();
            LoadBuku();

        });

        $("#formAnggota").submit(function (e) {
            e.preventDefault();
            var LogId = $('#dlogin').val();

            if (LogId == 'Petugas') {
                //console.log('petugas');
                cekPassPetugas();
            }
            else {
                //console.log('anggota');
                cekPassAnggota();
            }
        })


        //------------------------DAFTAR ANGGOTA-----------------------//
        function LoadAnggota() {
            $.ajax({
                url: '../Service/PeminjamanService.asmx/GetAllAnggota',
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var listAnggota = '';
                    $.each(data.d, function (index, item) {
                        listAnggota += '<tr>' +
                            '<td>' + item.KodeAnggota + '</td>' +
                            '<td>' + item.Nama + '</td>' +
                            '<td><div class="row"><div class="col-md-5"><input type="button" value="Select" class="btn btn-default" onclick="pilih(' + item.ID + ')"/></div></div></td>' +
                            '</tr>'
                    });
                    $("#data-anggota").html(listAnggota);
                }
            });
        };

        function pilih(id) {
            $.ajax({
                url: '../Service/PeminjamanService.asmx/GetAnggotaById',
                data: '{id: ' + id + '}',
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var AnggotaById = '';
                    var tglPinjam = new Date();
                    var tglKembali = new Date();
                    var date = tglKembali.setDate(tglKembali.getDate() + 3);
                    AnggotaById += '<tr>' +
                    $("#Nama").val(data.d.Nama);
                    //$("#NoReg").val(item.NoRegistrasi);
                    //$("#NoRef").val(item.NoReferensi);
                    $("#TglPinjam").val(tglPinjam);
                    $("#TglKembali").val(tglKembali);

                }
            });
            $('#modal-anggota').modal('hide');
        }

        //------------------------DAFTAR BUKU-----------------------//

        function LoadBuku() {
            $.ajax({
                url: '../Service/PeminjamanService.asmx/GetBukuAvailable',
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var listBuku = '';
                    $.each(data.d, function (index, item) {
                        listBuku += '<tr>' +
                            '<td>' + item.Kode + '</td>' +
                            '<td>' + item.JudulBuku + '</td>' +
                            '<td>' + item.Pengarang + '</td>' +
                            '<td><div class="row"><div class="col-md-5"><input type="checkbox" id="checkBuku" value="' + item.ID + '" name="selectbuku" class="btn btn-success"/></div></div></td>' +
                            '</tr>'
                    });
                    $("#data-buku").html(listBuku);
                }
            });
        };

        //$('#checkBuku').click(function (){

        //    var checked = this.checked;
        //    if (checked==true) {
        //        alert('akua')
        //    }

        //});

        function check() {
            var allVals = [];
            $('#data-buku :checked').each(function () {
                allVals.push($(this).val());
            });
            $('#contoh').val(allVals);
        }

        $(function () {
            $('#data-buku input').click(check);
            check();
        });

        function pilihBuku(id) {
            $.ajax({
                url: '../Service/PeminjamanService.asmx/GetBukuById',
                data: '{id: ' + id + '}',
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    $.each(data.d, function (index, item) {
                        var newBook = '<tr id="judul-' + item.ID + '">' +
                            '<td>' + item.Kode + '</td>' +
                            '<td>' + item.JudulBuku + '</td>' +
                            '<td>' + item.Pengarang + '</td>' +
                            "<td><input type='button' value='Delete' class='btn btn-danger' onclick='hapusBuku(" + item.ID + ")'/></td>" +
                            "</tr>";
                        $("#data-buku").append(newBook);
                        return true;
                    });
                }
            });
            $('#modal-buku').modal('hide');
        }


        function hapusBuku(id) {
            var judulId = '#judul-' + id.toString();
            $(judulId).remove();
        };

        //function simpanBuku() {
        //    var pinjamHeader = {};
        //    pinjamHeader.IDAnggota = $("#AnggotaId").val();
        //    pinjamHeader.TanggalPinjam = $("#cal-Tanggal-Pinjam").val();
        //    pinjamHeader.TanggalKembali = $("#cal-Tanggal-Kembali").val();
        //    pinjamHeader.IDBuku = [];

        //    $("#list-buku").children().each(function (index, item) {
        //        var listId = item.id.replace("judul-", "");
        //        pinjamHeader.IDBuku.push(listId);
        //    });

        //    $.ajax({
        //        url: '../Services/PinjamService.asmx/InsertPinjam',
        //        data: '{brwHeader: ' + JSON.stringify(pinjamHeader) + '}',
        //        type: 'POST',
        //        dataType: 'JSON',
        //        contentType: 'application/json; charset=utf-8',
        //        success: function (response) {
        //            alert("Buku berhasil disimpan.");
        //        }
        //    });
        //};



        //---------------------------SEARCH---------------------------//

        function loadSearchAnggota(searchValue) {
            $.ajax({
                url: '../Service/PeminjamanService.asmx/GetAnggotaBySearch',
                data: JSON.stringify(param),
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json; charset=utf-8',
                success: function (dataAnggota) {
                    var listAnggota = "";
                    var iCount = 0;
                    $.each(dataAnggota.d, function (index, item) {
                        listAnggota += '<tr>' +
                                '<td>' + ++iCount + '</td>' +
                                '<td>' + item.KodeAnggota + '</td>' +
                                '<td>' + item.Nama + '</td>' +
                                '<td><div class="row"><div class="col-md-5"><input type="button" value="Select" class="btn btn-default" onclick="pilih(' + item.ID + ')"/></div></div></td>' +
                            '</tr>'
                    });

                    $('#data-anggota').html(listAnggota);
                }
            });
        }

        //-----------------------------MODAL POP UP------------------------//
        $('#search-btn').click(function () {
            $('#modal-anggota').modal('show');
        });


        //$('#txt-anggotaS').keyup(function () {
        //    var searchValue = $('#txt-anggotaS').val();
        //    loadSearchAnggota(searchValue);
        //});

        $('#search-anggota').click(function () {
            var searchValue = $('#txt-anggotaS').val();
            loadSearchAnggota(searchValue);
        });

        $('#btn-tambah').click(function () {
            $('#modal-buku').modal('show');
        })

        //search - anggota
        //data - anggota
        //modal - buku
        //search - buku
        //data - buku
        //txt - bukuS
        //txt - anggotaS


    </script>
</asp:Content>

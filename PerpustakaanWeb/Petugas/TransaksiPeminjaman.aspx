<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterPetugas.Master" AutoEventWireup="true" CodeFile="TransaksiPeminjaman.aspx.cs" Inherits="PerpustakaanWeb.Petugas.TransaksiPeminjaman" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--
    2.VALIDASI CHECKBOX BUKU, YANG SUDAH TERPILIH TIDAK ADA DI TABEL
    3.VALIDASI ANGGOTA PUNYA KARTU ATAU NGGA
        3. BUTTON HAPUS
        4. BUTTON CLEAR
    4.VALIDASI FORM, SEBELUM SUBMIT DATA HARUS TERISI SEMUA--%>

    <div class="box box-info">
        <div class="box-header">
            <h2>Form Peminjaman</h2>
        </div>
        <div class="box-body">
            <form id="formAnggota">
                <div class="form-horizontal">
                    <input id="BorrowID" type="hidden" />
                    <div class="form-group">
                        <label class="control-label col-md-2" for="Nama">Nama</label>
                        <div class="input-group col-md-10">
                            <input class="form-control text-box single-line required" id="Nama" name="Nama" type="text" value="" readonly />
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
                <input type="button" id="btn-tambah" value="Tambah Buku" class="btn btn-primary" />
            </form>

        </div>
    </div>

     <div class="box">
        <div class="box-header with-border">
            <h3 class="box-title">List Buku Pinjaman</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <table class="table table-bordered">
                <tr>
                    <th>No</th>
                    <th>Kode Buku</th>
                    <th>Judul Buku</th>
                    <th>Pengarang</th>
                    <th>Action</th>
                </tr>
                <tr id="contoh">
                    
                </tr>
            </table>
        </div>
        <!-- /.box-body -->
        <div class="box-footer clearfix" style="float:right;">
            <input type="button" value="Clear" class="btn btn-primary" />
            <input type="button" value="Save" class="btn btn-primary" onclick="simpanBuku()"/>
            <ul class="pagination pagination-sm no-margin pull-right" style="float:left;">
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
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                            <button type="button" id="confirm" class="btn btn-primary" onclick="pilihBuku()" data-dismiss="modal">Ok</button>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    <script src="../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../dist/js/jquery.validate.js"></script>
    <script>

        $('#btn-tambah').click(function () {
            $("#formAnggota").validate({
                rules: {
                    Nama: "required"
                },
                messages: {
                    Nama: "Please choose Anggota for Nama"
                }

            })
        });

        $(document).ready(function () {
            LoadAnggota();
            LoadBuku();
        });

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
                            '<td><input type="hidden" value="' + item.ID + '"/></td>' +
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
                url: '../Service/PeminjamanService.asmx/GetAnggotaByID',
                type: 'POST',
                data: '{"id":"' + id + '"}',
                dataType: 'JSON',
                contentType: 'application/json;charset=utf-8',
                success: function (data) {

                        var datePinjam = new Date();
                        var dateKembali = new Date();
                        var dateK = dateKembali.setDate(dateKembali.getDate() + 3);
                        $("#Nama").val(data.d.Nama);
                        $("#TglPinjam").val(datePinjam.format("dd-MMM-yyyy"));
                        $("#TglKembali").val(dateKembali.format("dd-MMM-yyyy"));
                        $("#anggotaID").val(data.d.ID);
                    $('#data-anggota').modal('hide');
                }
            })
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
                            '<td><input type="hidden" value="' + item.ID + '"/></td>' +
                            '<td><input type="checkbox" id="cb' + item.ID + '" value="0">' + '</td>' +
                            '</tr>'
                    });
                    $("#data-buku").html(listBuku);
                }
            });
        };

        function pilihBuku() {
            var list = [];
            $("#data-buku tr").each(function () {
                var data = {};

                var cek = $('#cb' + $(this).find("td:nth-child(4)").find("input[type=hidden]").val()).is(":checked");
                //var cek = $('#cb' + $(this).find("td:nth-child(4)").val()).is(":checked");
                data.IDBuku = $(this).find("td:nth-child(4)").find("input[type=hidden]").val();
                alert(data.IDBuku);
                data.JudulBuku = $(this).find('td:nth-child(2)').text();
                data.Kode = $(this).find('td:nth-child(1)').text();
                data.Pengarang = $(this).find('td:nth-child(3)').text();
                //alert(cek);
                if (cek == true) {
                    list.push(data);}
            })
                $.each(list, function (index, item) {
                    var newBook = '<tr id="judul-' + item.IDBuku + '">' +
                          '<td><input type="hidden" value="' + item.IDBuku + '"/></td>' +
                            '<td>' + item.Kode + '</td>' +
                            '<td>' + item.JudulBuku + '</td>' +
                            '<td>' + item.Pengarang + '</td>' +
                            "<td><input type='button' value='Delete' class='btn btn-danger' onclick='hapusBuku(" + item.ID + ")'/></td>" +
                            "</tr>";
                    alert(item.IDBuku);
                    $("#contoh").append(newBook);
            });
            $('#modal-buku').modal('hide');
        }



        function hapusBuku(id) {
            var judulId = '#judul-' + id.toString();
            $(judulId).remove();
        }

        function simpanBuku() {
            var header = {};
            header.IDAnggota = $("#anggotaID").val();
            header.NoRegistrasi = $("#NoReg").val();
            var list = [];

            $("#contoh tr").each(function () {
                var data = {};
                data.IDBuku = $(this).find("td:nth-child(1)").find("input[type=hidden]").val();
                list.push(data);
            })
            var param = { header: header, details: list };
            $.ajax({
                url: '../Service/PeminjamanService.asmx/SimpanPeminjaman',
                data: JSON.stringify(param),
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json;charset=utf-8',
                success: function (response) {
                    alert("Transaksi Peminjaman Berhasil Disimpan");
                }
            })
        }


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

        $('#confirm').click(function () {
           
            var list = [];
            var header = {};
            header.IDSumberBuku = $("#sumber").val();
            header.Tanggal = $("#IDPenerbit").val();
            header.NoReferensi = $("#NoRef").val();


            $("#data-buku-baru tr").each(function () {
                var data = {};

                data.IDBuku = $(this).find('td:nth-child(8)').find("input[type=hidden]").val();
                data.JudulBuku = $(this).find('td:nth-child(2)').text();
                data.ISBN = $(this).find('td:nth-child(3)').text();
                data.Pengarang = $(this).find('td:nth-child(4)').text();
                data.Lokasi = $(this).find('td:nth-child(7)').find("input[type=hidden]").val();
                data.NilaiBuku = $(this).find('td:nth-child(5)').text();
                list.push(data);

            });

            var param = { header: header, details: list };
            $.ajax({
                url: '../Service/InputBukuService.asmx/SimpanPenyimpananBuku',
                type: 'POST',
                data: JSON.stringify(param),
                contentType: 'application/json; charset=utf-8',
                datatype: "json",
                success: function (response) {
                    alert("Data Penyimpanan Berhasil Disimpan..");
                    window.location.reload();
                }
            });
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

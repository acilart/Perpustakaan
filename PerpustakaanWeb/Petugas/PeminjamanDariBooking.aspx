<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterPetugas.Master" AutoEventWireup="true" CodeBehind="PeminjamanDariBooking.aspx.cs" Inherits="PerpustakaanWeb.Petugas.PeminjamanDariBooking" %>

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
                    <input id="BookingID" type="hidden" />
                    <input id="AnggotaID" type="hidden" />

                    <%--search textbox anggota--%>
                    <div class="form-group">
                        <label class="control-label col-md-2" for="Nama">Nama</label>
                        <div class="input-group col-md-10">
                            <input class="form-control text-box single-line required" id="Nama" name="Nama" type="text" value="" readonly />
                            <span class="field-validation-valid text-danger" data-valmsg-for="Nama" data-valmsg-replace="true"></span>
                            <span class="input-group-btn">
                                <button type="button" name="search" id="search-btn" class="btn btn-default glyphicon glyphicon-search" data-toggle="modal" data-target="#modal-anggota"/>
                            </span>
                                
                            </span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="NoReg">No Registrasi</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="NoReg" name="NoReg" type="text" value="" readonly />
                        </div>
                    </div>

                    <%--search textbox booking--%>
                    <div class="form-group">
                        <label class="control-label col-md-2" for="NoBooking">No Referensi</label>
                        <div class="input-group col-md-3">
                            <input class="form-control text-box single-line" id="NoBooking" name="NoBooking" type="text" value="" readonly />
                            <span class="field-validation-valid text-danger" data-valmsg-for="NoRef" data-valmsg-replace="true"></span>
                            <span class="input-group-btn">
                                <button class="btn btn-default glyphicon glyphicon-search" type="button" onclick="pilihBooking()" data-toggle="modal" data-target="#modal-booking" />
                            </span>
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
                <thead> <tr>
                    <th>No</th>
                    <th>Kode Buku</th>
                    <th>Judul Buku</th>
                    <th>Pengarang</th>
                    <th>Action</th>
                </tr></thead>
            <tbody id="data-peminjaman">

            </tbody>               
            </table>
        </div>
        <!-- /.box-body -->
        <div class="box-footer clearfix" style="float: right;">
            <input type="button" value="Clear" class="btn btn-primary" />
            <input type="button" value="Save" class="btn btn-primary" onclick="simpanBuku()" />
            <%-- <ul class="pagination pagination-sm no-margin pull-right" style="float:left;">
                <li><a href="#">&laquo;</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">&raquo;</a></li>
            </ul>--%>
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

    <%--MODAL BOOKING POPUP--%>
    <div class="modal" id="modal-booking" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4>Daftar Anggota Perpustakaan</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <br />
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" id="txt-boking" class="form-control" />
                                </div>
                                <div class="col-md-2">
                                    <button type="button" id="search-boking" class="btn btn-primary">Search</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <table class="table table-striped text-center">
                            <thead>
                                <tr>
                                    <th>No Booking</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id="data-booking">
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
                        <div class="box-footer clearfix" style="float: right;">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                            <button type="button" id="confirm" class="btn btn-primary" onclick="pilihBuku()" data-dismiss="modal">Ok</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script src="../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../Scripts/jquery-3.1.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
  
    <script>
        var listChecked = [];
        var listUnchecked = [];
        $(document).ready(function () {
            LoadAnggota();
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
                            '<td><div class="row"><div class="col-md-5"><input type="button" value="Select" class="btn btn-default" data-dismiss="modal" onclick="pilih(' + item.ID + ')"/></div></div></td>' +
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
                    //$("#TglPinjam").val(datePinjam.format("dd-MMM-yyyy"));
                    //$("#TglKembali").val(dateKembali.format("dd-MMM-yyyy"));
                    $("#AnggotaID").val(data.d.ID);
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
            //Cek CreatedOn dulu

            $("#data-buku tr").each(function () {
                var data = {};
                var cek = $('#cb' + $(this).find("td:nth-child(4)").find("input[type=hidden]").val()).is(":checked");
                data.IDBuku = $(this).find("td:nth-child(4)").find("input[type=hidden]").val();
                data.JudulBuku = $(this).find('td:nth-child(2)').text();
                data.Kode = $(this).find('td:nth-child(1)').text();
                data.Pengarang = $(this).find('td:nth-child(3)').text();
                if (cek == true) {
                    listChecked.push(data);
                }
                else {
                    listUnchecked.push(data);
                }
            })
            $("#data-peminjaman tr").remove();
            $.each(listChecked, function (index, item) {
                var newBook = '<tr id="id' + item.IDBuku + '">' +
                      '<td><input type="hidden" value="' + item.IDBuku + '"/></td>' +
                        '<td>' + item.Kode + '</td>' +
                        '<td>' + item.JudulBuku + '</td>' +
                        '<td>' + item.Pengarang + '</td>' +
                        "<td><input type='button' value='Delete' class='btn btn-danger' onclick='hapusBuku(" + item.IDBuku + ")'/></td>" +
                        "</tr>";
                $("#data-peminjaman").append(newBook);

            });
            $('#modal-buku').modal('hide');

        }

        function pilihBooking() {
            var id = $("#AnggotaID").val();
         
            $.ajax({
                url: '../Service/PeminjamanService.asmx/GetBookingHeaderAktifByIDAnggota',
                type: 'POST',
                data: '{"id":"' + id + '"}',
                dataType: 'JSON',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var listBooking = '';
                    $.each(data.d, function (index, item) {
                        listBooking += '<tr>' +
                            '<td>' + item.BookingNo + '</td>' +
                            '<td><input type="hidden" value="' + item.ID + '"/></td>' +
                            ' <td> <input type="button" class="btn btn-successs" value="Pilih" data-dismiss="modal" id="btnEdit" onClick="PilihHeader(' + item.ID + ')" /></td>' +
                            '</tr>'
                    });
                    $("#data-booking").html(listBooking);
                }
            });
        }

        function hapusBuku(ID) {
            var kodeBuku = '#id' + ID;
            $(kodeBuku).each(function () {
                var data = {};
                data.IDBuku = $(this).find("td:nth-child(1)").find("input[type=hidden]").val();
                data.JudulBuku = $(this).find('td:nth-child(3)').text();
                data.Kode = $(this).find('td:nth-child(2)').text();
                data.Pengarang = $(this).find('td:nth-child(4)').text();
                listUnchecked.push(data);
            })
            $(kodeBuku).remove();
            listChecked = [];
            $("#data-peminjaman tr").each(function () {
                var data = {};
                data.IDBuku = $(this).find("td:nth-child(1)").find("input[type=hidden]").val();
                data.JudulBuku = $(this).find('td:nth-child(3)').text();
                data.Kode = $(this).find('td:nth-child(2)').text();
                data.Pengarang = $(this).find('td:nth-child(4)').text();
                listChecked.push(data);
            })
        }

        function simpanBuku() {
            var header = {};
            header.IDAnggota = $("#anggotaID").val();
            header.BookingNo = $("#NoBooking").val();
            header.ID = $("#BookingID").val();
            var list = [];

            $("#data-peminjaman tr").each(function () {
                var data = {};
                data.IDBuku = $(this).find("td:nth-child(1)").find("input[type=hidden]").val();
                data.ID = $(this).find("td:nth-child(6)").find("input[type=hidden]").val();
                list.push(data);
            })
            var param = { book: header, details: list };
            $.ajax({
                url: '../Service/PeminjamanService.asmx/SimpanPeminjamanBook',
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
       
        function LoadBukuFilt() {

            //data-buku di remove
            //cek kalau unchecked ada, tampilin yg unchecked
            $("#data-buku tr").remove();
            if (listUnchecked.length > 0) {
                var listBuku = '';
                $.each(listUnchecked, function (index, item) {

                    listBuku += '<tr id="selectedID' + item.IDBuku + '">' +
                        '<td>' + item.Kode + '</td>' +
                        '<td>' + item.JudulBuku + '</td>' +
                        '<td>' + item.Pengarang + '</td>' +
                        '<td><input type="hidden" value="' + item.IDBuku + '"/></td>' +
                        '<td><input type="checkbox" id="cb' + item.IDBuku + '" value="0">' + '</td>' +
                        '</tr>'

                });
                $("#data-buku").html(listBuku);
            }
            if(listChecked.length > 0 && listUnchecked.length < 1) {
                $.ajax({
                    url: '../Service/PeminjamanService.asmx/GetBukuAvailable',
                    type: 'POST',
                    dataType: 'JSON',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var listBuku = '';
                        $.each(data.d, function (index, item) {
                            listBuku += '<tr id="selectedID' + item.ID + '">' +
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
            }
            $('#modal-buku').modal('show');
            listUnchecked = [];
        }

        function PilihHeader(ID) {
            TampilHeader(ID);
            $("#BookingID").val(ID);
            $.ajax({
                url: '../Service/PeminjamanService.asmx/GetBookingAktifByID',
                data: '{id:' + ID + '}',
                type: 'POST',
                dataType: 'JSON',

                contentType: 'application/json; charset=utf-8',
                success: function (dataAnu) {
                    var listProp = "";
                    $.each(dataAnu.d, function (index, item) {
                        listProp += '<tr id="id' + item.IDBuku + '">' +
                       '<td><input type="hidden" value="' + item.IDBuku + '"/></td>' +
                        '<td>' + item.KodeBuku + '</td>' +
                        '<td>' + item.JudulBuku + '</td>' +
                        '<td>' + item.Pengarang + '</td>' +
                        '<td><input type="button" value="Delete" class="btn btn-danger" onclick="hapusBuku(' + item.IDBuku + ')"/></td>' +
                        '<td><input type="hidden" value="' + item.IDDetail + '"/></td>' +
                '</tr>';

                    });

                    $("#data-peminjaman").html(listProp);
                }
            });
        }

        function TampilHeader(ID) {
            $.ajax({
                url: '../Service/PeminjamanService.asmx/GetHeaderViewModelByID',
                type: 'POST',
                data: '{"id":"' + ID + '"}',
                dataType: 'JSON',
                contentType: 'application/json;charset=utf-8',
                success: function (data) {
                    $("#NoBooking").val(data.d.NoBooking);
                    $("#TglPinjam").val(CurrentDate(data.d.TanggalPinjam));
                    $("#TglKembali").val(CurrentDate(data.d.TanggalKembali));
                }
            })
        }
      
        $('#search-anggota').click(function () {
            var searchValue = $('#txt-boking').val();
            loadSearchAnggota(searchValue);
        });

        function CurrentDate(tgl) {

            var currentTime;
            if (tgl == null) {
                currentTime = new Date();

            } else {
                var dateString = tgl.substr(6);
                currentTime = new Date(parseInt(dateString));
            }

            var month = currentTime.getMonth() + 1;
            var day = currentTime.getDate();
            var year = currentTime.getFullYear();
            var date = day + "-" + month + "-" + year;

            if (tgl == null) {
                $("#txt-tgl-booking").val(date);
            } else {
                return date;
            }
        }

        $("#btn-tambah").click(function () {
            //var list = [];
            LoadBukuFilt();
        })
    </script>
</asp:Content>

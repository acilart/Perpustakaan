<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterPetugas.Master" AutoEventWireup="true" CodeFile="TransaksiPeminjaman.aspx.cs" Inherits="PerpustakaanWeb.Petugas.TransaksiPeminjaman" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <% if (HttpContext.Current.Session["Email"] != null && HttpContext.Current.Session["ID"] != null && HttpContext.Current.Session["Role"].ToString() == "petugas")
       { %>
    <%--
    1. CEK CREATED ON, JIKA < 3 BULAN HANYA BOLEH PINJAM 1 (get anggota by lama anggota..)
    2. BUTTON CLEAR, CEK CHECKBOX BUG
    3. VALIDASI FORM, REQUIRED LIST BUKU SUBMIT DATA HARUS TERISI SEMUA--%>

    <div class="box box-info">
        <div class="box-header">
            <h2>Form Peminjaman</h2>
        </div>
        <div class="box-body">
            <form id="formAnggota" action="#" method="POST">
                <div class="form-horizontal">
                    <input id="BorrowID" type="hidden" />
                    <div class="form-group">
                        <label class="control-label col-md-2" for="Nama">Nama</label>
                        <div class="input-group col-md-10">
                            <input class="form-control text-box single-line required" id="Nama" name="Nama" type="text" readonly required />
                            <span class="field-validation-valid text-danger" data-valmsg-for="Nama" data-valmsg-replace="true"></span>
                            <span class="input-group-btn">
                                <button type="button" name="search" id="search-btn" class="btn btn-flat" onclick="LoadAnggota()">
                                    <span class="fa fa-search"></span>
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
                <thead>
                    <tr>
                        <%--<td>No</td>--%>
                        <td>Kode Buku</td>
                        <td>Judul Buku</td>
                        <td>Pengarang</td>
                        <td>Action</td>
                    </tr>
                </thead>
                <tbody id="contoh">
                </tbody>
            </table>

            <input type="submit" value="Save" class="btn btn-primary" onclick="simpanBuku()" style="float: right;" />
            <input type="button" value="Clear" class="btn btn-primary" style="float: right;" />&nbsp;&nbsp;

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
                                    <th></th>
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
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../dist/js/jquery.validate.js"></script>
    <script>
        var listChecked = [];
        var listUnchecked = [];
        var bukuAnggota = false;
        // var No = '1';


        $("#formAnggota").validate({
            rules: {
                Nama: "required"
            },
            messages: {
                Nama: "Please choose one member",
            }

        });


        $("#btn-tambah").click(function () {
            //var list = [];
            LoadBukuFilt();
            $('#modal-buku').modal('show');
        }
        );

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
            $("#modal-anggota").modal("show");
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
                    $("#TglPinjam").val(datePinjam);
                    $("#TglKembali").val(dateKembali);
                    $("#anggotaID").val(data.d.ID);
                    cekCreatedOn(data.d.ID);
                }
            })
            $('#modal-anggota').modal('hide');
            
        }

        //------------------------DAFTAR BUKU-----------------------//
        //FILTER BUKU
        function LoadBukuFilt() {
            //CEK YANG KURANG 3 BULAN DARI CREATED ON  GA BISA NAMBAH LAGI???

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
            else {
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
        
        function cekCreatedOn(id) {
            $.ajax({
                url: '../Service/PeminjamanService.asmx/GetLamaAnggotaByID',
                type: 'POST',
                data: '{"id":"' + id + '"}',
                dataType: 'JSON',
                contentType: 'application/json;charset=utf-8',
                success: function (data) {
                    //KONVERSI DATE 3 BULAN sebelumnya
                   if (data.d > 90) {
                        bukuAnggota = true;
                    } else {
                        bukuAnggota = false;
                    }
                }
            })
        }

<<<<<<< .mine
        //VALIDASI JIKA SUDAH DI PILIH TIDAK BISA LOAD BUKU
        function pilihBuku() {
            
            //JIKA BUKUANGGOTA BERNILAI TRUE, MAKA BISA MEMILIH LEBIH DARI SATU
            if (bukuAnggota == true) {
||||||| .r117
            //VALIDASI JIKA SUDAH DI PILIH TIDAK BISA LOAD BUKU
            function pilihBuku() {
                //Cek CreatedOn dulu
                
=======
<<<<<<< .mine
                var cek = $('#cb' + $(this).find("td:nth-child(4)").find("input[type=hidden]").val()).is(":checked");
                //var cek = $('#cb' + $(this).find("td:nth-child(4)").val()).is(":checked");
                data.IDBuku = $(this).find("td:nth-child(4)").find("input[type=hidden]").val();
                data.JudulBuku = $(this).find('td:nth-child(2)').text();
                data.Kode = $(this).find('td:nth-child(1)').text();
                data.Pengarang = $(this).find('td:nth-child(3)').text();
                //alert(cek);
                if (cek == true) {
                    list.push(data);}
            })
                $.each(list, function (index, item) {
                    var newBook = '<tr id="judul-' + item.IDBuku + '">' +
||||||| .r95
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
=======
            //VALIDASI JIKA SUDAH DI PILIH TIDAK BISA LOAD BUKU
            function pilihBuku() {
                //Cek CreatedOn dulu
                
>>>>>>> .r129
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
<<<<<<< .mine
||||||| .r117
                $("#contoh tr").remove();
                $.each(listChecked, function (index, item) {
                    var newBook = '<tr id="id' + item.IDBuku + '">' +
                          '<td><input type="hidden" value="' + item.IDBuku + '"/></td>' +
                            '<td>' + item.Kode + '</td>' +
                            '<td>' + item.JudulBuku + '</td>' +
                            '<td>' + item.Pengarang + '</td>' +
                            "<td><input type='button' value='Delete' class='btn btn-danger' onclick='hapusBuku(" + item.IDBuku + ")'/></td>" +
                            "</tr>";
                    $("#contoh").append(newBook);
                
                });
                $('#modal-buku').modal('hide');

=======
                $("#contoh tr").remove();
                $.each(listChecked, function (index, item) {
                    var newBook = '<tr id="id' + item.IDBuku + '">' +
>>>>>>> .r120
                          '<td><input type="hidden" value="' + item.IDBuku + '"/></td>' +
                            '<td>' + item.Kode + '</td>' +
                            '<td>' + item.JudulBuku + '</td>' +
                            '<td>' + item.Pengarang + '</td>' +
                            "<td><input type='button' value='Delete' class='btn btn-danger' onclick='hapusBuku(" + item.IDBuku + ")'/></td>" +
                            "</tr>";
<<<<<<< .mine
                   
||||||| .r95
                    alert(item.IDBuku);
=======
>>>>>>> .r120
                    $("#contoh").append(newBook);
                
                });
                $('#modal-buku').modal('hide');

>>>>>>> .r129
            }
            else {
                $("#data-buku tr").click(function (data) {
                    var cek = $('#cb' + $(this).find("td:nth-child(4)").find("input[type=hidden]").val()).is(":checked");
                    data.d.IDBuku = $(this).find("td:nth-child(4)").find("input[type=hidden]").val();
                    data.d.JudulBuku = $(this).find('td:nth-child(2)').text();
                    data.d.Kode = $(this).find('td:nth-child(1)').text();
                    data.d.Pengarang = $(this).find('td:nth-child(3)').text();
                    if (cek == true) {
                        if (data > 2) {
                            alert("You Can't Have More Books");
                        } else {
                            listChecked.push(data);
                        }
                    }
                    else {
                        listUnchecked.push(data);
                    }
                })
            }

            $("#contoh tr").remove();
            $.each(listChecked, function (index, item) {
                var newBook = '<tr id="id' + item.IDBuku + '">' +
                      '<td><input type="hidden" value="' + item.IDBuku + '"/></td>' +
                        '<td>' + item.Kode + '</td>' +
                        '<td>' + item.JudulBuku + '</td>' +
                        '<td>' + item.Pengarang + '</td>' +
                        "<td><input type='button' value='Delete' class='btn btn-danger' onclick='hapusBuku(" + item.IDBuku + ")'/></td>" +
                        "</tr>";
                $("#contoh").append(newBook);

            });
            $('#modal-buku').modal('hide');

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
            $("#contoh tr").each(function () {
                var data = {};
                data.IDBuku = $(this).find("td:nth-child(1)").find("input[type=hidden]").val();
                data.JudulBuku = $(this).find('td:nth-child(3)').text();
                data.Kode = $(this).find('td:nth-child(2)').text();
                data.Pengarang = $(this).find('td:nth-child(4)').text();
                listChecked.push(data);
            })
        }

        function simpanBuku(e) {
            e.preventDefault();

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
                    window.location.reload();
                }
            })
        }


        //---------------------------SEARCH---------------------------//

        function loadSearchAnggota(searchValue) {
            $.ajax({
                url: '../Service/PeminjamanService.asmx/searchAnggotaByNama',
                data: '{"nama":"' + searchValue + '"}',
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json; charset=utf-8',
                success: function (dataAnggota) {
                    var listAnggota = "";
                    $.each(dataAnggota.d, function (index, item) {
                        listAnggota += '<tr>' +
                                '<td>' + item.Nama + '</td>' +
                                '<td><div class="row"><div class="col-md-5"><input type="button" value="Select" class="btn btn-default" onclick="pilih(' + item.ID + ')"/></div></div></td>' +
                            '</tr>'
                    });

                    $('#data-anggota').html(listAnggota);
                }
            });
        }

<<<<<<< .mine
        function loadSearchBuku(searchValue) {
            $.ajax({
                url: '../Service/PeminjamanService.asmx/searchBukuByNama',
                data: '{"buku":"' + searchValue + '"}',
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json; charset=utf-8',
                success: function (dataBuku) {
                    var listBuku = "";
                    $.each(dataBuku.d, function (index, item) {
                        listBuku += '<tr id="selectedID' + item.ID + '">' +
                            '<td>' + item.Kode + '</td>' +
                            '<td>' + item.JudulBuku + '</td>' +
                            '<td>' + item.Pengarang + '</td>' +
                            '<td><input type="hidden" value="' + item.ID + '"/></td>' +
                            '<td><input type="checkbox" id="cb' + item.ID + '" value="0">' + '</td>' +
                            '</tr>'
                    });

                    $('#data-buku').html(listBuku);
                }
||||||| .r117
            $('#search-anggota').click(function () {
                var searchValue = $('#txt-anggotaS').val();
                loadSearchAnggota(searchValue);
=======
<<<<<<< .mine
            //var param = { header: header, details: list };
            //$.ajax({
            //    url: '../Service/InputBukuService.asmx/SimpanPenyimpananBuku',
            //    type: 'POST',
            //    data: JSON.stringify(param),
            //    contentType: 'application/json; charset=utf-8',
            //    datatype: "json",
            //    success: function (response) {
            //        alert("Data Penyimpanan Berhasil Disimpan..");
            //        window.location.reload();
            //    }
            //});
||||||| .r95
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
=======
            $('#search-anggota').click(function () {
                var searchValue = $('#txt-anggotaS').val();
                loadSearchAnggota(searchValue);
>>>>>>> .r129
            });
<<<<<<< .mine
        }
||||||| .r117
=======
>>>>>>> .r120
>>>>>>> .r129

        //-----------------------------MODAL POP UP------------------------//

        $('#txt-anggotaS').keypress(function () {
            var searchValue = $('#txt-anggotaS').val();
            loadSearchAnggota(searchValue);
        });

        $('#search-anggota').click(function () {
            var searchValue = $('#txt-anggotaS').val();
            loadSearchAnggota(searchValue);
        });

        $('#txt-bukuS').keypress(function () {
            var searchValue = $('#txt-bukuS').val();
            loadSearchBuku(searchValue);
        });

        $('#search-buku').click(function () {
            var searchValue = $('#txt-bukuS').val();
            loadSearchBuku(searchValue);
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

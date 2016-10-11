<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PenyimpananBuku.aspx.cs" Inherits="PerpustakaanWeb.Petugas.PenyimpananBuku1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="box box-info">
        <div class="box-header">
            <h2>Form Penyimpanan Buku</h2>
        </div>
        <div class="box-body">
            <form action="/Anggota/Create" method="post">
                <input name="__RequestVerificationToken" type="hidden" value="wcv9Q8y4GQ_x4bT7YRs85r6txf4MRvFtu3KUuz2Zf9jrA5dDYWSR46ZvsMmytRd1fCGU-m_R6wTCMy2A89rYe-54x__sqULvGAnS1GBxXfI1" />
                <div class="form-horizontal">

                    <div class="form-group">
                        <label class="control-label col-md-2" for="sumber">Sumber Buku</label>
                        <div class="col-md-10">
                            <td>
                                <select class="form-control" data-val="true" id="sumber" name="sumber">
                                </select></td>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="NoRef">No Referensi</label>
                        <div class="input-group col-md-3">
                            <input class="form-control text-box single-line" id="NoRef" name="NoRef" type="text" value="" readonly />
                            <span class="field-validation-valid text-danger" data-valmsg-for="NoRef" data-valmsg-replace="true"></span>
                            <span class="input-group-btn">
                                <button class="btn btn-default glyphicon glyphicon-search" type="button" data-toggle="modal" data-target="#modal-penggantian" />
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
                        <label class="control-label col-md-2" for="Tgl">Tanggal</label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" class="form-control text-box single-line" ID="Tgl" name="Tgl" type="date" value="" ReadOnly="true" />
                        </div>
                    </div>

                </div>
            </form>
        </div>
    </div>

    <%--JIKA MELAKUKAN LAPORAN KEHILANGAN--%>
    <div class="box">
        <div class="box-header with-border">
            <h3 class="box-title">Daftar Buku yang dilaporkan hilang</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th style="width: 10%">Kode Buku</th>
                        <th style="width: 35%">Judul Buku</th>
                        <th style="width: 20%">ISBN</th>
                        <th style="width: 15%">Pengarang</th>
                        <th style="width: 10%">Nilai Buku(Rp)</th>
                        <th style="width: 10%">Lokasi</th>
                    </tr>
                </thead>
                <tbody id="data-buku-penggantian">
                </tbody>

            </table>
        </div>
        <!-- /.box-body -->
    </div>
    <!-- /.box -->



    <%--JIKA INPUT BUKU BARU--%>
    <div class="box">
        <div class="box-header with-border">
            <input value="Insert" class="btn btn-primary" data-toggle="modal" data-target="#modal-buku" />
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <table class="table table-bordered" id="tabel-buku">
                <thead>
                    <tr>
                        <th style="width: 10%">Kode Buku</th>
                        <th style="width: 25%">Judul Buku</th>
                        <th style="width: 20%">ISBN</th>
                        <th style="width: 15%">Pengarang</th>
                        <th style="width: 10%">Nilai Buku(Rp)</th>
                        <th style="width: 10%">Lokasi</th>
                        <th style="width: 10%">Action</th>
                    </tr>
                </thead>
                <tbody id="data-buku-baru">
                </tbody>
            </table>
        </div>
        <!-- /.box-body -->
        <div class="box-footer clearfix">
            <input type="submit" value="Clear" class="btn btn-primary" />
            <input id="btn-save" value="Save" class="btn btn-primary" />
        </div>
    </div>
    <!-- /.box -->

    <!-- Modal Penggantian-->
    <div id="modal-penggantian" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Data Penggantian Buku</h4>
                </div>
                <div class="modal-body">
                    <div>
                        <table class="table table-striped table-bordered table-responsive col-md-12">
                            <thead>
                                <tr>
                                    <th>NoRegistrasi</th>
                                    <th>NamaAnggota</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody id="data-penggantian">
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <!-- Modal Buku-->
    <div id="modal-buku" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Data Buku</h4>
                </div>
                <div class="modal-body">
                    <div>
                        <table class="table table-striped table-bordered table-responsive col-md-12">
                            <thead>
                                <tr>
                                    <th style="width: 10%">Kode Buku</th>
                                    <th style="width: 35%">Judul Buku</th>
                                    <th style="width: 20%">ISBN</th>
                                    <th style="width: 15%">Pengarang</th>
                                    <th style="width: 10%">Nilai Buku(Rp)</th>
                                    <th style="width: 10%">Lokasi</th>
                                </tr>
                            </thead>
                            <tbody id="data-buku">
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <script src="../Scripts/jquery-1.10.2.js"></script>
    <script src="../Scripts/bootstrap.js"></script>
    <script>
        function loadDataPenggantian() {
            $.ajax({
                url: '../Service/InputBukuService.asmx/GetPenggantianBuku',
                type: 'POST',
                dataType: 'JSON',

                contentType: 'application/json; charset=utf-8',
                success: function (dataAnu) {
                    var listProp = "";
                    $.each(dataAnu.d, function (index, item) {
                        listProp += '<tr>' +
                        '<td>' + item.NoRegistrasi + '</td>' +
                        '<td>' + item.NamaAnggota + '</td>' +
                        '<td>' + item.Tanggal + '</td>' +
                       ' <td> <input type="button" class="btn btn-successs" value="Pilih" data-dismiss="modal" id="btnEdit" onClick="PilihPenggantian(' + item.ID + ')" /></td>' +
                '</tr>';

                    });

                    $('#data-penggantian').html(listProp);
                }
            });
        }

        function PilihPenggantian(ID) {
            loadBukuPenggantian(ID);
            $.ajax({
                url: '../Service/InputBukuService.asmx/GetPenggantianByID',
                data: '{ID:' + ID + '}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'JSON',
                type: 'POST',
                success: function (penggantian) {
                    $('#NoRef').val(penggantian.d.NoRegistrasi);
                    $("#Tanggal").val(penggantian.d.Tanggal);
                }
            });

        }

        function loadBukuPenggantian(ID) {
            $.ajax({
                url: '../Service/InputBukuService.asmx/GetBukuHilangByIDPenggantianHeader',
                data: '{ID:' + ID + '}',
                type: 'POST',
                dataType: 'JSON',

                contentType: 'application/json; charset=utf-8',
                success: function (dataAnu) {
                    var listProp = "";
                    $.each(dataAnu.d, function (index, item) {
                        listProp += '<tr>' +
                        '<td>' + item.Kode + '</td>' +
                        '<td>' + item.JudulBuku + '</td>' +
                        '<td>' + item.ISBN + '</td>' +
                       '<td>' + item.Pengarang + '</td>' +
                        '<td>' + item.Value + '</td>' +
                        '<td>' + item.LokasiD + '</td>' +
                '</tr>';

                    });

                    $('#data-buku-penggantian').html(listProp);
                }
            });
        }

        function loadBukuBaru(ID) {
            $.ajax({
                url: '../Service/InputBukuService.asmx/GetBukuByID',
                data: '{ID:' + ID + '}',
                type: 'POST',
                dataType: 'JSON',

                contentType: 'application/json; charset=utf-8',
                success: function (dataAnu) {
                    var listProp = "";
                    $.each(dataAnu.d, function (index, item) {
                        listProp += '<tr>' +
                        '<td>' + item.Kode + '</td>' +
                        '<td>' + item.JudulBuku + '</td>' +
                        '<td>' + item.ISBN + '</td>' +
                       '<td>' + item.Pengarang + '</td>' +
                        '<td>' + item.Value + '</td>' +
                        '<td>' + item.LokasiD + '</td>' +
                       '<td><input type="hidden" id="lokasi" value="' + item.Lokasi + '"/></td>' +
                       '<td><input type="hidden" id="idbuku" value="' + item.ID + '"/></td>' +
                         ' <td> <input type="button" class="btn btn-successs" value="Pilih" data-dismiss="modal" id="btnEdit" onClick="HapusBuku(' + item.ID + ')" /></td>' +
                '</tr>';

                    });

                    $('#data-buku-baru').html(listProp);
                }
            });
        }

        function loadDataSumberBuku() {
            $.ajax({
                url: '../Service/InputBukuService.asmx/GetSumberBuku',
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json; charset=utf-8',
                success: function (dataAnu) {
                    var listProp = "";
                    $.each(dataAnu.d, function (index, item) {
                        listProp += '<option value="' + item.ID + '">' + item.Deskripsi + '</option>';

                    });

                    $('#sumber').html(listProp);
                }
            });
        }

        $('#btn-save').click(function () {
            var list = [];
            var header = {};
            buku.IDSumberBuku = $("#sumber").val();
            buku.Tanggal = $("#IDPenerbit").val();
            buku.NoReferensi = $("#NoRef").val();
           

            $("#data-buku-baru tr").each(function () {
                var data = {
                    IDBuku: 0,
                    JudulBuku: "",
                    ISBN:"",
                    Lokasi: 0,
                    Pengarang:"",
                    NilaiBuku: 0
                   
                };

                data.IDBuku = $(this).find('td:nth-child(6)').find('input[type=hiden]').val();
                data.JudulBuku = $(this).find('td:nth-child(2)').text();
                data.ISBN = $(this).find('td:nth-child(3)').text();
                data.Pengarang = $(this).find('td:nth-child(4)').text();
                data.Lokasi = $(this).find('td:nth-child(7)').find('input[type=hiden]').val();
                data.NilaiBuku = $(this).find('td:nth-child(5)').val();
                list.push(data);

            });

            var param = { header: header, details: list };
            $.ajax({
                url: '../Service/InputBukuService.asmx/SimpanBuku',
                type: 'POST',
                data: JSON.stringify(param),
                contentType: 'application/json; charset=utf-8',
                datatype: "json",
                success: function (response) {
                    alert("Data Penyimpanan Berhasil Disimpan..");
                    window.location.reload();
                }
            });
        })

        function loadDataBuku() {
            $.ajax({
                url: '../Service/InputBukuService.asmx/GetBukuNonPlaced',
                type: 'POST',
                dataType: 'JSON',

                contentType: 'application/json; charset=utf-8',
                success: function (dataAnu) {
                    var listProp = "";
                    $.each(dataAnu.d, function (index, item) {
                        listProp += '<tr>' +
                       '<td>' + item.Kode + '</td>' +
                        '<td>' + item.JudulBuku + '</td>' +
                        '<td>' + item.ISBN + '</td>' +
                       '<td>' + item.Pengarang + '</td>' +
                        '<td>' + item.Value + '</td>' +
                        '<td>' + item.LokasiD + '</td>' +
                       ' <td> <input type="button" class="btn btn-successs" value="Pilih" data-dismiss="modal" id="btnEdit" onClick="PilihBuku(' + item.ID + ')" /></td>' +
                '</tr>';

                    });

                    $('#data-buku').html(listProp);
                }
            });
        }

        function PilihBuku(ID) {
            loadBukuPenggantian(ID);
            $.ajax({
                url: '../Service/InputBukuService.asmx/GetBukuByID',
                data: '{ID:' + ID + '}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'JSON',
                type: 'POST',
                success: function (penggantian) {
                    listProp += '<tr>' +
                       '<td>' + item.Kode + '</td>' +
                        '<td>' + item.JudulBuku + '</td>' +
                        '<td>' + item.ISBN + '</td>' +
                       '<td>' + item.Pengarang + '</td>' +
                        '<td>' + item.Value + '</td>' +
                        '<td>' + item.LokasiD + '</td>' +
                       ' <td> <input type="button" class="btn btn-danger" value="Hapus" id="btnEdit" onClick="HapusBuku(' + item.ID + ')" /></td>' +
                '</tr>';
                }
            });
            $('#data-buku-baru').html(listProp);
        }

        $(document).ready(function () {
            loadDataSumberBuku();
            loadDataPenggantian();
        });

    </script>
</asp:Content>

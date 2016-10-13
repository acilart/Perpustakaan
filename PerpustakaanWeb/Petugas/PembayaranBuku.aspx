<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterPetugas.Master" AutoEventWireup="true" CodeBehind="PembayaranBuku.aspx.cs" Inherits="PerpustakaanWeb.Petugas.PembayaranBuku" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="box box-info">
        <div class="box-header">
            <h2>Form Pembayaran Buku</h2>
        </div>
        <div class="box-body">
            <form>
                <div class="form-horizontal">
                    <label id="idAnggota" hidden="hidden"></label>
                    <label id="idBayar" hidden="hidden"></label>
                    <div class="form-group">
                        <label class="control-label col-md-2" for="NoRef">No Referensi</label>
                        <div class="input-group col-md-3">
                            <input class="form-control text-box single-line" id="NoRef" name="NoRef" type="text" value="" readonly />
                            <span class="field-validation-valid text-danger" data-valmsg-for="NoRef" data-valmsg-replace="true"></span>
                            <span class="input-group-btn">
                                <button type="button" name="search" id="search-btn" class="btn btn-primary glyphicon glyphicon-search" data-toggle="modal" data-target="#modal-ref"></button>
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
                        <label class="control-label col-md-2" for="Tgl">Tanggal</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="Tgl" name="Tgl" type="date" value="" readonly />
                        </div>
                    </div>

                </div>
            </form>
        </div>
    </div>

    <%--MODAL NO REFERENSI POPUP--%>
    <div class="modal" id="modal-ref" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4>No Referensi</h4>
                </div>
                <div class="modal-body">

                    <input id="IDNoRef" type="hidden" />

                    <div class="row">
                        <br />
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" id="txt-NoRef" class="form-control" />
                                </div>
                                <div class="col-md-2">
                                    <button type="button" id="search-NoRef" data-toggle="modal" data-target="#modal-buku" class="btn btn-default">Search</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <table class="table table-striped text-center">
                            <thead>
                                <tr>
                                    <th>NoRegistrasi</th>
                                    <th>NamaAnggota</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody id="data-NoRef">
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="box-footer clearfix" style="float: right;">
                            <input type="button" value="Cancel" class="btn btn-primary" />
                            <input type="button" id="confirm" value="Confirm" class="btn btn-primary" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--TABEL DETAIL PEMBAYARAN--%>
    <div class="box">
        <!-- /.box-header -->
        <div class="box-body">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Kode Buku</th>
                        <th>Judul Buku</th>
                        <th>ISBN</th>
                        <th>Nilai Buku(Rp)</th>
                        <th>Pembayaran Sebelumnya</th>
                        <th>Sisa</th>
                        <th>Pembayaran</th>
                        <th>Completed</th>
                    </tr>
                </thead>
                <tbody id="data-pembayaran-detail"></tbody>
            </table>
        </div>
        <!-- /.box-body -->
        <div class="box-footer clearfix">
            <input type="submit" value="Clear" class="btn btn-primary" />
            <input id="btn-save" type="button" value="Save" class="btn btn-primary" />

        </div>
    </div>
    <!-- /.box -->
    <script src="../Scripts/jquery-1.10.2.js"></script>
    <script src="../Scripts/bootstrap.js"></script>
    <script>
        $(document).ready(function () {
           loadDataPenggantian();
        });
        function loadDataPenggantian() {
            $.ajax({
                url: '../Service/PembayaranBuku.asmx/GetPenggantian',
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

                    $('#data-NoRef').html(listProp);
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
                    $("#Nama").val(penggantian.d.NamaAnggota);
                    $("#idAnggota").val(penggantian.d.IDAnggota);
                }
            });

        }
        function loadBukuPenggantian(ID) {
            $.ajax({
                url: '../Service/PembayaranBuku.asmx/GetPembayaranByID',
                data: '{ID:' + ID + '}',
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json; charset=utf-8',
                success: function (dataAnu) {
                    var listProp = "";
                    $.each(dataAnu.d, function (index, item) {

                        var cek = "";
                        if (item.Completed == true) {
                            cek = '<td><input disabled="disabled" type="checkbox"  id="cb' + item.IDBuku + '" checked="checked"/></td>';
                        }
                        else {
                            cek = '<td><input disabled="disabled" type="checkbox"  id="cb' + item.IDBuku + '"/></td>';
                        }
                        var bayar = "";
                        if (item.Sisa == 0) {
                            '<td><input type="text" class="form-control" value="0"/></td>'
                        }
                        else {
                            '<td><input disabled="disabled" type="text" class="form-control" value="0"/></td>'
                        }
                        listProp += '<tr>' +
                        '<td>' + item.KodeBuku + '</td>' +
                        '<td>' + item.JudulBuku + '</td>' +
                        '<td>' + item.ISBN + '</td>' +
                        '<td>' + item.NilaiBuku + '</td>' +
                        '<td>' + item.PembayaranSebelumnya + '</td>' +
                        '<td>' + item.Sisa + '</td>' +
                        bayar +
                        cek +
                        '<td><input type="hidden" value="' + item.IDBuku + '"/></td>' +
                        '<td><input type="hidden" value="' + item.IDDetail + '"/></td>' +
                        '</tr>';
                        $("#idBayar").val(item.IDPembayaran);
                    });

                    $('#data-pembayaran-detail').html(listProp);
                }
            });
        }
        $('#btn-save').click(function () {
            var list = [];
            var header = {};
            header.IDAnggota = $("#idAnggota").val();
            header.NoReferensi = $("#NoRef").val();
            header.ID = $("#idBayar").val();

            $("#data-pembayaran-detail tr").each(function () {
                var data = {};
                var cek = $('#cb' + $(this).find('td:nth-child(9)').find("input[type=hidden]").val()).is(":checked");
                data.IDBuku = $(this).find('td:nth-child(9)').find("input[type=hidden]").val();
               data.Value = $(this).find('td:nth-child(4)').text();
                data.IsCompleted = cek;
                data.JumlahBayar = $(this).find('td:nth-child(7)').find("input[type=text]").val();
                data.ID = $(this).find('td:nth-child(10)').find("input[type=hidden]").val();
                list.push(data);
             });

            var param = { header: header, details: list };
            $.ajax({
                url: '../Service/PembayaranBuku.asmx/SimpanPembayaran',
                type: 'POST',
                data: JSON.stringify(param),
                contentType: 'application/json; charset=utf-8',
                datatype: "json",
                success: function (response) {
                    alert("Data Pembayaran Berhasil Disimpan..");
                    window.location.reload();
                }
            });
        })
    </script>
</asp:Content>

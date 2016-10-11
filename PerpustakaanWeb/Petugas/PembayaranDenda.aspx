<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PembayaranDenda.aspx.cs" Inherits="PerpustakaanWeb.Petugas.PembayaranDenda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="box box-info">
        <div class="box-header">
            <h2>Form Pembayaran Denda</h2>
        </div>
        <div class="box-body">
           <%--<form>--%>
                <div class="form-horizontal">
                    <div class="form-group">
                        <label class="control-label col-md-2" for="NoRef">No Referensi</label>
                        <div class="input-group col-md-10">
                            <input class="form-control text-box single-line" id="NoRef" name="NoRef" type="text" value="" readonly />
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
                            <input class="form-control text-box single-line" id="TglPinjam" name="TglPinjam" type="text" value="" readonly />
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
            <%--</form>--%>
            <%--<div>
                <a href="/Anggota">Back to List</a>
            </div>--%>
        </div>
    </div>

    <div class="box">
        <div class="box-header with-border">
            <h3 class="box-title">List Buku Pinjaman</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <table class="table table-bordered text-center">
                <thead>
                    <tr>
                        <th style="width: 10%">Kode Buku</th>
                        <th style="width: 60%">Judul Buku</th>
                        <th style="width: 10%">Terlambat(Hari)</th>
                        <th style="width: 10%">Denda(Rp)</th>
                    </tr>
                </thead>
                <tbody id="buku-borrow"></tbody>                
            </table>
        </div>
        <!-- /.box-body -->
        <div class="box-footer clearfix">
            <input type="submit" value="Clear" class="btn btn-primary" />
            <input type="submit" value="Save" class="btn btn-primary" />
        </div>
    </div>
    <!-- /.box -->

    <%-- modal untuk no referensi pop up --%>
    <div class="modal" id="modal-rtr" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type ="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4> Data Pengembalian Buku</h4>
                </div>
                <div class="modal-body">
                    <input id="RtrID" type="hidden"/>
                    <div class="row">
                        <div class="col-md-4">
                            <input type="text" id="search-rtr" class="form-control" />
                        </div>
                    </div>
                    <div class="col-md-12">
                        <table class="table table-stripped text-center">
                            <thead>
                                <tr>
                                    <td>No</td>
                                    <td>No Referensi</td>
                                    <td>Nama Anggota</td>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id="data-rtr"></tbody>
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
        //untuk munculin pop up
        $('#search-btn').click(function () {
            $('#modal-rtr').modal('show');
            LoadReturn();
        })

        //untuk munculin data di modal
        function LoadReturn() {
            $.ajax({
                url: '../Service/DendaService.asmx/GetPengembalian',
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json;charset=utf-8',
                success: function (data) {
                    var listrtr = "";
                    var Icount = 0;
                    $.each(data.d, function (index, item) {
                        listrtr += '<tr>' +
                            '<td>' + ++Icount + '</td>' +
                            '<td>' + item.NoReferensi + '</td>' +
                            '<td>' + item.NamaAnggota + '</td>' +
                            '<td> <input type="button" text="Pilih" value="Choose" class="btn btn-primary" onclick="Choose(' + item.ID + '); LoadBukuPinjam(' + item.ID + ');"/>' + '</td>' +
                                 '</tr>'
                    });
                    $('#data-rtr').html(listrtr);
                }
            })
        }
        //field untuk search
        $('#search-rtr').keyup(function () {
            var SearchValue = $('#search-rtr').val();
            LoadReturnSearch(SearchValue);
        })

        // fungsi search
        function LoadReturnSearch(SearchValue) {
            $.ajax({
                url: '../Service/DendaService.asmx/GetPengembalianBySearch',
                data: '{"search":"' + SearchValue + '"}',
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json;charset=utf-8',
                success: function (data) {
                    var listrtr = "";
                    var Icount = 0;
                    $.each(data.d, function (index, item) {
                        listrtr += '<tr>' +
                            '<td>' + ++Icount + '</td>' +
                            '<td>' + item.NoReferensi + '</td>' +
                            '<td>' + item.NamaAnggota + '</td>' +
                            '<td> <input type="button" text="Pilih" value="Choose" class="btn btn-primary" onclick="Choose(' + item.ID + '); LoadBukuPinjam(' + item.ID + ');"/>' + '</td>' +
                                 '</tr>'
                    });
                    $('#data-rtr').html(listrtr);
                }
            })
        }


    </script>    
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterPetugas.Master" AutoEventWireup="true" CodeBehind="PembayaranDenda.aspx.cs" Inherits="PerpustakaanWeb.Petugas.PembayaranDenda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <% if (HttpContext.Current.Session["Email"] != null && HttpContext.Current.Session["ID"] != null && HttpContext.Current.Session["Role"].ToString() == "petugas")
        { %>
    <div class="box box-info">
        <div class="box-header">
            <h2>Form Pembayaran Denda</h2>
        </div>
        <div class="box-body">
           <%--<form>--%>
                <div class="form-horizontal">
                    <input id="DendaID" type="hidden"/>
                    <input id="DendaAnggotaID" type="hidden"/>
                    <div class="form-group">
                        <label class="control-label col-md-2" for="NoRef">No Referensi</label>
                        <div class="input-group col-md-10">
                            <input class="form-control text-box single-line" id="NoRef" name="NoRef" type="text" value="" readonly />
                            <span class="field-validation-valid text-danger" data-valmsg-for="NoRef" data-valmsg-replace="true"></span>
                            <span class="input-group-btn">
                               <button type="button" name="search" id="search-denda" class="btn btn-flat">
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
            <h3 class="box-title">List Buku Pinjaman Dengan</h3>
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
                <tbody id="buku-pinjam"></tbody>                
            </table>
        </div>
        <!-- /.box-body -->
        <div class="box-footer clearfix">
            <input type="submit" value="Clear" class="btn btn-primary" />
            <input type="button" value="Save" class="btn btn-primary" onclick="SaveDenda()" />
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
                    <%--<div class="row">
                        <div class="col-md-4">
                            <input type="text" id="search-rtr" class="form-control" />
                        </div>
                    </div>--%>
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
    <script src="../Scripts/jquery-3.1.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>

    <%-- SCRIPT --%>
    <script>

        var datepinjam;
        var datekembali;
        var datedikembalikan;


        //untuk munculin pop up
        $('#search-denda').click(function () {
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

        // fungsi search INI BELUM BENER
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

        //fungsi button choose
        function Choose(ID) {
            $.ajax({
                url: '../Service/DendaService.asmx/GetPeminjamanById',
                data: '{"id":"' + ID + '"}',
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json;charset=utf-8',
                success: function (data) {                
                        datepinjam = data.d.TanggalPinjam;
                        datekembali = data.d.TanggalKembali;
                        datedikembalikan = data.d.TanggalDikembalikan;
                        $("#DendaID").val(ID);
                        $("#DendaAnggotaID").val(data.d.IDAnggota);
                        $("#NoRef").val(data.d.NoReferensi);
                        $("#Nama").val(data.d.NamaAnggota);
                        $("#TglPinjam").val(convertDate(datepinjam));
                        $("#TglKembali").val(convertDate(datekembali));
                        $("#TglDikembalikan").val(convertDate(datedikembalikan));
                        $('#modal-rtr').modal('hide');
                    
                }
            })
        }

        //load buku yg dipinjam
        function LoadBukuPinjam(id) {
            $.ajax({
                url: '../Service/DendaService.asmx/GetBukuDenda',
                data: '{"id":"' + id + '"}',
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
                            '<td>' + item.Terlambat + '</td>' +
                            '<td>' + item.denda + '</td>' +
                            '<td class="hidden"><input type="hidden" value="' + item.IDBuku + '"/></td>' +
                            '</tr>';
                            '</tr>';
                        totaldenda = (totaldenda + item.denda)
                    });
                    $('#buku-pinjam').html(listbuku);
                    $('#buku-pinjam').append('<tr><td></td><td>Jumlah</td><td></td><td>' + totaldenda + '</td></tr>');
                }
            })
        }

        function convertDate(tanggal) {          
            var dateString = tanggal.substr(6);
            var currentTime = new Date(parseInt(dateString));
            var month = currentTime.getMonth() + 1;
            var day = currentTime.getDate();
            var year = currentTime.getFullYear();
            var date = day + "-" + month + "-" + year;
            return date;
        }

        //fungsi save pembayaran denda
        function SaveDenda() {
            var header = {};
            header.IDAnggota =  $("#DendaAnggotaID").val();
            header.NoReferensi = $("#NoRef").val();
            header.CreatedBy = '<%= Session["ID"] %>';
            
            var rtr = {};
            rtr.ID = $("#DendaID").val();
        
        var list = [];
        $("#buku-borrow tr").each(function () {
            var data = {};
            data.IDBuku = $(this).find('td:nth-child(5)').find("input[type=hidden]").val();
            data.Jumlah = $(this).find('td:nth-child(4)').text();
            list.push(data);
        });
        var param = {header: header , details :list , retHeader:rtr };
        $.ajax({
            url: '../Service/DendaService.asmx/SimpanPembayaranDenda',
            data: JSON.stringify(param),
            type: 'POST',
            dataType: 'JSON',
            contentType: 'application/json;charset=utf-8',
            success: function (response) {
                alert("Transaksi Pengembalian Berhasil Disimpan");
            }
        })

        }
    </script>    
</asp:Content>

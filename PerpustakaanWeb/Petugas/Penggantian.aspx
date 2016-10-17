<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterPetugas.Master" AutoEventWireup="true" CodeBehind="Penggantian.aspx.cs" Inherits="PerpustakaanWeb.Petugas.Penggantian" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <% if (HttpContext.Current.Session["Email"] != null && HttpContext.Current.Session["ID"] != null && HttpContext.Current.Session["Role"].ToString() == "petugas")
        { %>

    <link href="../dist/css/datepicker3.css" rel="stylesheet" />
<div class="box box-info">
        <div class="box-header">
            <h2>Form Penggantian</h2>
        </div>
        <div class="box-body">
            <form action="/Anggota/Create" method="post">
                <input name="__RequestVerificationToken" type="hidden" value="wcv9Q8y4GQ_x4bT7YRs85r6txf4MRvFtu3KUuz2Zf9jrA5dDYWSR46ZvsMmytRd1fCGU-m_R6wTCMy2A89rYe-54x__sqULvGAnS1GBxXfI1" />
                <div class="form-horizontal">
                    <input id="ReplaceID" type="hidden" />
                    <div class="form-group">                       
                        <label class="control-label col-md-2" for="NoReferensi">No Referensi</label>
                        <div class="input-group col-md-10">
                            <input class="form-control text-box single-line" id="NoReferensi" name="NoRef" type="text" value="" readonly/>
                            <span class="field-validation-valid text-danger" data-valmsg-for="NoRef" data-valmsg-replace="true"></span>
                            <span class="input-group-btn">
                                <button type="button" name="search" id="search-rtr" class="btn btn-flat">
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
                        <label class="control-label col-md-2" for="Tanggal">Tanggal</label>
                        <div class="input-group-date col-md-10">
                            <input class="form-control col-md-10" id="Tanggal" name="Tanggal" type="text" value="" />
                        </div>
                    </div>

                </div>
            </form>
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
            <table class="table table-bordered">
                <thead>
                    <tr>
                    <th style="width: 10%" class="text-center">Kode Buku</th>
                    <th style="width: 35%" class="text-center">Judul Buku</th>
                    <th style="width: 20%" class="text-center">Alasan Kehilangan</th>
                    <th style="width: 15%" class="text-center">Pilihan Penggantian</th>
                    <th style="width: 10%" class="text-center">Nilai Buku(Rp)</th>
                    <th style="width: 10%" class="text-center">Biaya Admin(Rp)</th>
                    <th class="hidden"></th>
                    </tr>
                </thead>
                <tbody id="data-buku"></tbody>
            </table>
        </div>
        <!-- /.box-body -->
        <div class="box-footer clearfix">
            <input type="button" value="Clear" id="btn-clear" class="btn btn-primary" />
            <input type="button" value="Save" class="btn btn-primary" onclick ="SavePembayaran()"/>
        </div>
    </div>
    <!-- /.box -->
    <%-- MODAL UNTUK NO REFERENSI KE TABEL PENGEMBALIAN DENGAN LAPORAN KEHILANGAN POP UP --%>
    <div class="modal" id="modal-return" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4>DATA BUKU</h4>
                </div>
                <div class="modal-body">
                   <%--<div class="row">
                        <div class="col-md-4">
                            <input type="text" id="search-borrow" class="form-control" />
                        </div>
                    </div>--%>
                    <div class="col-md-12">
                        <table class="table table-striped text-center">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>No Referensi</th>
                                    <th>Nama Anggota</th>
                                </tr>
                            </thead>
                            <tbody id="data-return"></tbody>                                        
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../dist/js/bootstrap-datepicker.js"></script>
    <script src="../dist/js/jquery.validate.js"></script>
    <%-- SCRIPT --%>
    <script>
        //untuk datepicker
        //$('#Tanggal').datepicker({
        //    format: "dd/mm/yyyy",
        //    autoclose: true
        //});

        //untuk memunculkan pop up data pengembalian 
        $('#search-rtr').click(function () {
            $('#modal-return').modal('show');
            LoadReturn();
        })

        //fungsi untuk menampilkan data pengembalian dengan kehilangan
        function LoadReturn() {
            $.ajax({
                url: '../Service/PenggantianService.asmx/GetPengembalian',
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json;charset=utf-8',
                success: function (data) {
                    var list = "";
                    var icount = 0;
                    $.each(data.d, function (index, item) {
                        list += '<tr>' +
                            '<td>' + ++icount + '</td>' +
                            '<td>' + item.NoReferensi + '</td>' +
                            '<td>' + item.NamaAnggota + '</td>' +
                            '<td> <input type="button" text="Pilih" value="Choose" class="btn btn-primary" onclick="Choose(' + item.ID + ')"/>' + '</td>' +
                                 '</tr>'
                    });
                    $('#data-return').html(list);
                }
            })
        }

        //fungsi untuk memilih data yang akan ditampilkan di form depan
        function Choose(id) {
            $.ajax({
                url: '../Service/PenggantianService.asmx/GetPengembalianById',
                data: '{"id":"' + id + '"}',
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json;charset=utf-8',
                success: function (data) {
                    var tanggal = new Date();
                        $("#ReplaceID").val(data.d.IDAnggota);
                        $("#NoReferensi").val(data.d.NoReferensi);
                        $("#Nama").val(data.d.NamaAnggota);
                        $("#Tanggal").val(convertDateNow(tanggal));
                        $('#modal-return').modal('hide');
                    
                        $.ajax({
                            url: '../Service/PenggantianService.asmx/GetBukuHilang',
                            data: '{"id":"' + id + '"}',
                            type: 'POST',
                            dataType: 'JSON',
                            contentType: 'application/json;charset=utf-8',
                            success: function (data) {
                                var listbuku = '';
                                var jumlahbiaya = '';
                                var totalbayar = 0;

                                $.each(data.d, function (index, item) {
                                    var totalBuku = item.BiayaAdmin;
                                    var totalBy = item.HargaPenggantian + item.BiayaAdmin;
                                    tota =
                                    listbuku += '<tr>' +
                                        '<td>' + item.KodeBuku + '</td>' +
                                        '<td>' + item.JudulBuku + '</td>' +
                                        '<td><input type="text" id="Alasan" /></td>' +
                                        '<td><select class="form-control" data-val="true" changed="pilihOpsi(' + item.ID + ')" name="Option">' +
                                        '<option value = "1">Buku Baru</option>' +
                                        '<option value = "2">Uang Tunai</option></select></td>' +
                                        '<td>' + item.HargaPenggantian + '</td>' +
                                        '<td>' + item.BiayaAdmin + '</td>' +
                                        '<td class="hidden">' + totalbayar + '</td>' +
                                        '<td><input type="hidden" value="' + item.IDBuku + '"</input></td>' +
                                        '<td><input type="hidden" value="' + item.IDDetail + '"</input></td>' +
                                        '</tr>';
                                    totalbayar = (totalbayar + item.HargaPenggantian + item.BiayaAdmin);
                                });
                                $('#data-buku').html(listbuku);
                            }
                        })
                }
            })        
        }

        function convertDateNow(tanggal) {
            var currentTime = new Date();
            var month = currentTime.getMonth() + 1;
            var day = currentTime.getDate();
            var year = currentTime.getFullYear();
            var date = day + "/" + month + "/" + year;
            return date;
        }

         //fungsi simpan
        function SavePembayaran() {
            var header = {};
            header.IDAnggota = $("#ReplaceID").val();
            header.NoReferensi = $("#NoReferensi").val();
            header.CreatedBy = '<%= Session["ID"] %>';
            //header.Tanggal = $("#Tanggal").val();

            var detail = [];
            $("#data-buku tr").each(function () {
                var data = {};
                data.IDBuku = $(this).find('td:nth-child(8)').find("input[type=hidden]").val();
                data.Alasan = $(this).find('td:nth-child(3)').find("input[type=text]").text();
                data.IDOpsiPenggantian = $(this).find('td:nth-child(4)').find("select").val();
                data.HargaPenggantian = $(this).find('td:nth-child(5)').text();
                data.BiayaAdmin = $(this).find('td:nth-child(6)').text();
                detail.push(data);
            });
            var rtr = [];
            $("#data-buku tr").each(function () {
                var data = {};
                data.IDBuku = $(this).find('td:nth-child(8)').find("input[type=hidden]").val();
                data.ID = $(this).find('td:nth-child(9)').find("input[type=hidden]").val();
                rtr.push(data);
            });
            var param = { header: header, details: detail, detailReturn: rtr };
            $.ajax({
                url: '../Service/PenggantianService.asmx/SimpanPenggantian',
                data: JSON.stringify(param),
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json;charset=utf-8',
                success: function (response) {
                    alert("Transaksi Pengembalian Berhasil Disimpan");
                }
            })

        }
        
        $("#btn-clear").click(function () {

            $("#ReplaceID").val('');
            $("#NoReferensi").val('');
            $("#Nama").val('');

            $("#data-buku").html(null);
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

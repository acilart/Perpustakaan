<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterAnggota.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="PerpustakaanWeb.Anggota.Booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/Zebra_Datepicker-master/public/css/metallic.css" rel="stylesheet" />


    <div class="panel panel-primary">

        <div class="panel-heading">
            <h2>Booking Buku Online</h2>
        </div>
        <div class="panel-body">
            <div class="form-horizontal col-md-9 col-md-offset-3">

                <div class="form-group">
                    <label class="col-md-3">Nama </label>
                    <input class="col-md-9 form-control" type="text" id="txt-nama" readonly="readonly" />
                </div>
                <div class="form-group">
                    <label class="col-md-3">No Booking</label>
                    <input class="col-md-9 form-control" type="text" id="txt-no-booking" readonly="readonly" />
                </div>
                <div class="form-group">
                    <label class="col-md-3">Tgl Booking</label>
                    <input class="col-md-9 form-control" type="text" id="txt-tgl-booking" readonly="readonly" />
                </div>

                <div class="form-group">
                    <label class="col-md-3">Tgl Pinjam</label>
                    <input class="col-md-9 form-control tgl-pinjam" type="text" id="txt-tgl-pinjam" placeholder="Tanggal Pengembalian" />
                </div>

            </div>

            <div class="form-horizontal col-md-8 col-md-offset-2">
                <div class="form-group">
                    <input type="button" id="btn-tambah" class="btn btn-primary" value="Tambah Booking" onclick="loadModal()" />
                </div>
                <table class="table table-bordered col-md-6">
                    <thead>
                        <tr>
                            <td>Kode Buku</td>
                            <td>Judul Buku</td>
                            <td>Pengarang</td>
                            <td>Action</td>
                        </tr>
                    </thead>
                    <tbody id="tbl-list-booking-selected">
                    </tbody>
                </table>
                <div class="col-md-offset-9">
                    <input type="button" id="btn-cancel" value="cancel" class="btn btn-primary" onclick="simpanData()" />

                    <input type="button" id="btn-save" value="Save" class="btn btn-primary" onclick="simpanData()" />


                </div>
            </div>

        </div>

    </div>

    <%-- modal tambah booking --%>

    <div class="modal fade" id="ModalBooking" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered col-md-6">
                        <thead>
                            <tr>
                                <td>Kode Buku</td>
                                <td>Judul Buku</td>
                                <td>Pengarang</td>
                                <td>Action</td>
 
                            </tr>
                        </thead>
                        <tbody id="tbl-list-booking">
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> 
                </div>
            </div>
        </div>
    </div>





    <script src="../Content/Zebra_Datepicker-master/public/javascript/zebra_datepicker.js"></script>

    <script>

        var selectedAnggotaById = 2; //data sementara sebelum dimasukan login. masih berupa test

        var No = '1';

        //menampilkan anggota yang sudah login, lalu ditampilkan di halaman booking

        $(document).ready(function () {
            loadDataAnggota(selectedAnggotaById);
            CurrentDate();
             $('input.datepicker').Zebra_DatePicker();
        });
       function simpanData() {


            var listDetail = [];
            var header = {};

            header.IdAnggota = selectedAnggotaById;
            header.TanggalPinjam = "2016-10-10";

            $("#tbl-list-booking-selected tr").each(function () {
                var data = {};
                data.IDbuku = $(this).find('td:nth-child(5)').find("input[type=hidden]").val();
                listDetail.push(data);
            });
            var param = { header: header, details: listDetail };
            
            $.ajax({
                url: '../Service/BookingService.asmx/SimpanBooking',
                type: 'POST',
                data: JSON.stringify(param),
                contentType: 'application/json; charset=utf-8',
                datatype: "json",
                success: function (response) {
                    alert("Data Penyimpanan Berhasil Disimpan..");
                    window.location.reload();
                }
            });
        }

        function loadDataAnggota(ID) {
            $.ajax({
                url: '../Service/BookingService.asmx/getAnggotaByID',
                data: '{id:'+ID+'}',
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json; charset=utf-8',
                success: function (list) {
                     $("#txt-nama").val(list.d.Nama); 
                }
            });
        }

 
        $('#txt-tgl-pinjam').Zebra_DatePicker({
            format: 'd-m-Y',
            direction: true,
            disabled_dates: ['* * * 0,6']
        });

        function CurrentDate() {
            var currentTime = new Date();
            var month = currentTime.getMonth() + 1;
            var day = currentTime.getDate();
            var year = currentTime.getFullYear();
            var date = day + "-" + month + "-" + year;
            $("#txt-tgl-booking").val(date);
        }
        function loadModal() {
            $.ajax({
                url: '../Service/BookingService.asmx/getBukuAvailable',
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json; charset=utf-8',
                success: function (list) {
                    var listProp = "";
                    $.each(list.d, function (index, item) {
                        listProp += '<tr id="selectedID' + item.ID + '">'
                            + '<td>' + item.Kode + '</td>'
                            + '<td>' + item.JudulBuku + '</td>'
                            + '<td>' + item.Pengarang + '</td>'
                            + '<td> <input type="button" class="btn btn-danger" id="btn-pilih" value="pilih"   onclick="pilihBuku(' + item.ID + ')" >'
                        '</tr>'
                    });
                    if (No == 1) {
                        $('#tbl-list-booking').html(listProp);
                    }
                }
            });

            if (No > 2) {
                alert("Hanya Bisa Booking Max. 2 Buku ")
            } else {
                $("#ModalBooking").modal("show");

            }
        }
        function pilihBuku(ID) {
            if (No > 2) {
                alert("Hanya Bisa Booking Max. 2 Buku ")
                $("#ModalBooking").modal("hide");
            } else {
                var IDbuku = '#selectedID' + ID;
                $(IDbuku).remove();

                $.ajax({
                    url: '../Service/BookingService.asmx/getBukuAvailableByID',
                    data: '{id:' + ID + '}',
                    type: 'POST',
                    dataType: 'JSON',
                    contentType: 'application/json; charset=utf-8',

                    success: function (list) {
                        var listProp = "";
                        listProp += '<tr id="id' + list.d.ID + '">'
                            + '<td>' + list.d.Kode + '</td>'
                            + '<td>' + list.d.JudulBuku + '</td>'
                             + '<td>' + list.d.Pengarang + '</td>'
                            + '<td> <input type="button" class="btn btn-danger" id="btn-hapus" value="hapus" onClick="RemoveKode(' + list.d.ID + ')">'
                             
                            + '<td><input type="hidden" value="' + list.d.ID + '"/></td>' 


                        '</tr>'
                        $('#tbl-list-booking-selected').append(listProp);
                        No++;
                    }

                });


            }
            
        }
        function RemoveKode(ID) {
            var kodeBuku = '#id' + ID;
            $(kodeBuku).remove();
            No--;
            AddListToBooking(ID);
        }
        function AddListToBooking(ID) {
            $.ajax({
                url: '../Service/BookingService.asmx/getBukuAvailableByID',
                data: '{id:' + ID + '}',
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json; charset=utf-8',

                success: function (list) {
                    var listProp = "";
                    listProp += '<tr id="selectedID' + list.d.ID + '">'
                        + '<td>' + list.d.Kode + '</td>'
                        + '<td>' + list.d.JudulBuku + '</td>'
                         + '<td>' + list.d.Pengarang + '</td>'
                 + '<td> <input type="button" class="btn btn-danger" id="btn-pilih" value="pilih"   onclick="pilihBuku(' + list.d.ID + ')" >'
                    '</tr>'
                    $('#tbl-list-booking').append(listProp);
                }

            });

        }


    </script>

</asp:Content>

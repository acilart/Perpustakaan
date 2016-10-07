<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListAnggota.aspx.cs" Inherits="PerpustakaanWeb.Petugas.ListAnggota" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="panel panel-primary">
        <div class="panel-heading">
            <h1 class="panel-title">List Anggota</h1>
        </div>
        <div class="panel-body">

            <div class="form-horizontal">
                <div class="form-group col-md-2">
                    <select class="form-control" id="searchby">
                        <option value="value">Nama Anggota</option>
                    </select>
                </div>

                <div class="form-group col-md-10">
                    <input class="form-control" type="text" id="txt-search" placeholder="search" />

                </div>

                <div class="form-group">

                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <td>No</td>
                                <td>Kode Anggota</td>
                                <td>Nama</td>
                                <td>Alamat</td>
                                <td>No Telepon</td>
                                <td>Email</td>
                                <td>Action</td>
                            </tr>
                        </thead>
                        <tbody id="tbl-list-anggota">
                        </tbody>

                    </table>
                </div>
            </div>
        </div>
    </div>



    <div class="modal fade" id="modal-edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Edit Anggota</h4>
                </div>
                <div class="modal-body col-md-offset-2">

                    <label>Kode Anggota </label>
                    <input class="form-control " type="text" id="txt-kode-anggota" placeholder="Kode Anggota" readonly="readonly" />

                    <label>Nama </label>
                    <input class="form-control" type="text" id="txt-nama" placeholder="Nama" maxlength="50" />
                    <label>Alamat </label>
                    <input class="form-control" type="text" id="txt-alamat" placeholder="Alamat" />
                    <label>Provinsi</label>
                    <select class="form-control" id="dpropinsi" style="width: 64%;">
                        <option value="0">---pilih---</option>
                    </select>
                    <label>Kota </label>
                    <select class="form-control" id="dkota" style="width: 64%;">
                        <option value="z">---pilih---</option>
                    </select>
                    <label>Kecamatan </label>
                    <select class="form-control" id="dkecamatan" style="width: 64%;">
                        <option value="0">---pilih---</option>
                    </select>

                    <label>Email </label>
                    <input type="text" class="form-control" id="txt-email" placeholder="Email" />
                    <label>No Telepon </label>
                    <input type="text" id="txt-telp" class="form-control" placeholder="No Telepon" maxlength="12" />

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>


    <script>

        var dprovinsi;
        var dkota;


        $(document).ready(function () {
            LoadAnggota();
        });


        function LoadAnggota() {
            $.ajax({
                url: '../Service/ListAnggotaService.asmx/getAnggota',
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json; charset=utf-8',
                success: function (anggota) {
                    var listProp = "";
                    var id = "0";
                    $.each(anggota.d, function (index, item) {
                        id++;
                        listProp += '<tr>'
                            + '<td>' + id + '</td>'
                            + '<td>' + item.KodeAnggota + '</td>'
                            + '<td>' + item.Nama + '</td>'
                            + '<td>' + item.Alamat + '</td>'
                            + '<td>' + item.NoTelepon + '</td>'
                            + '<td>' + item.Email + '</td>'
                            + '<td> <input type="button" class="btn btn-warning" id="btn-edit" value="Edit" onclick="getAnggotaByID(' + item.ID + ')" >  '
                            + '<input type="button" class="btn btn-danger" id="btn-edit" value="Delete"> </td>'
                        '</tr>'
                    });
                    $('#tbl-list-anggota').html(listProp);
                }
            });
        }




        function getAnggotaByID(ID) {

            $.ajax({
                url: '../Service/ListAnggotaService.asmx/getAnggotaByID',
                data: '{"ID":"' + JSON.stringify(ID) + '"}',
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json; charset=utf-8',
                success: function (anggota) {


                    $('#txt-kode-anggota').val(anggota.d.KodeAnggota),
                    $('#txt-nama').val(anggota.d.Nama),
                    $('#txt-email').val(anggota.d.Email),
                    dpropinsi = anggota.d.IDProvinsi,
                    loadPropinsi(dpropinsi),
                    dkota = anggota.d.IDKota,
                    loadKota(dkota),
                    loadKecamatan(anggota.d.IDKecamatan)
                }
            });

            $('#modal-edit').modal('show');
        }

        function loadPropinsi(ID) {

            $.ajax({
                url: "../Service/ListAnggotaService.asmx/getPropinsi",

                contentType: "application/json; charset=utf-8",
                type: "POST",
                dataType: "json",
                success: function (id) {
                    var out = "";
                    $.each(id.d, function (index, item) {

                        out += '<option value="' + item.ID + '">' + item.NamaProvinsi + '</option>';
                    });
                    $('#dpropinsi').html(out).val(ID);
                }
            });
        }

        function loadKota(ID) {

            if (ID == null) {

                dpropinsi = $("#dpropinsi").val();
            }

            $.ajax({
                url: "../Service/ListAnggotaService.asmx/getKota",
                data: "{id: " + dpropinsi + "}",
                contentType: "application/json; charset=utf-8",
                type: "POST",
                dataType: "json",
                success: function (id) {
                    var out = "";
                    
                    $.each(id.d, function (index, item) {

                        out += '<option value="' + item.ID + '">' + item.NamaKota + '</option>';
                    });

                    if (ID == null) {
                        $('#dkota').html(out);
                    } else {
                        $('#dkota').html(out).val(ID);

                    }
                    
                }
            });
        }

        function loadKecamatan(ID) {

            if (ID == null) {

                dkota = $("#dkota").val();
            }

            $.ajax({
                url: "../Service/ListAnggotaService.asmx/getKecamatan",
                data: "{id: " + dkota + "}",
                contentType: "application/json; charset=utf-8",
                type: "POST",
                dataType: "json",
                success: function (id) {
                    var out = "";
                    $.each(id.d, function (index, item) {

                        out += '<option value="' + item.ID + '">' + item.NamaKecamatan + '</option>';
                    });
                    if (ID == null) {
                        $('#dkecamatan').html(out);
                    } else {
                        $('#dkecamatan').html(out).val(ID);

                    }

                }
            });
        }

        $("#dpropinsi").click(function () {
            loadKota(),

            
            loadKecamatan();
        }).change(function () {
            loadKota();
            loadKecamatan();
        });

        $("#dkota").click(function () {
            loadKecamatan();
        }).change(function () {
            loadKecamatan();
        });


    </script>
</asp:Content>

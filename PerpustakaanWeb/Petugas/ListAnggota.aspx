<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterPetugas.Master" AutoEventWireup="true" CodeBehind="ListAnggota.aspx.cs" Inherits="PerpustakaanWeb.Petugas.ListAnggota" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%--Panel --%>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h1 class="panel-title">List Anggota</h1>
        </div>
        <div class="panel-body">

            <div class="form-horizontal">
                <div class="form-group col-md-3">
                    <%-- Opsi Untuk Pemilihan --%>
                    <select class="form-control" id="searchby">
                        <option value="kode">Kode Anggota</option>
                        <option value="nama">Nama Anggota</option>
                        <option value="alamat">Alamat</option>
                        <option value="telp">no Telp</option>
                        <option value="email">Email</option>

                    </select>
                </div>

                <div class="form-group col-md-3">
                    <%-- Inputan --%>
                    <input class="form-control" type="text" id="txt-search" placeholder="search" />

                </div>

                <div class="form-group">

                    <%-- Tabel Untuk Ouput Table Master Anggota --%>
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


    <%-- modal edit --%>
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
                        <option value="0">---pilih---</option>
                    </select>
                    <label>Kecamatan </label>
                    <select class="form-control" id="dkecamatan" style="width: 64%;">
                        <option value="0">---pilih---</option>
                    </select>
                    <label>Email </label>
                    <input type="text" class="form-control" id="txt-email" placeholder="Email" />
                    <label>No Telepon </label>
                    <input type="text" id="txt-telp" class="form-control" placeholder="No Telepon" maxlength="12" />
                    <label>Masa Berlaku Kartu </label>
                    <input type="text" id="txt-masa-berlaku-kartu" class="form-control" readonly="readonly" />
                    <label>Masa Berlaku Anggota </label>
                    <input type="text" id="txt-masa-berlaku-anggota" class="form-control" readonly="readonly" />

                </div>

                <div class="modal-footer">
                    <%--                    <button type="button" class="btn btn-primary" onclick="perpanjangAnggota()">Perpanjang Keanggotaan</button>--%>
                    <button type="button" class="btn btn-primary" onclick="editAnggota()">Save changes</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                </div>
            </div>
        </div>
    </div>

    <%-- akhir modal perpanjangan anggota --%>

    <script src="../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    

    <script>
        var dprovinsi;
        var dkota;
        var dkecamatan;

        var tempID;
        var tempMasaBerlakuKartu;
        var tempMasaBerlakuAnggota;
        var SavedateKartu;
        var SavedateAnggota;

        $(document).ready(function () {
            LoadAnggota();
        });

        
        //function perpanjangAnggota() {
          
        //    $("modal-edit").modal("hide");

        //}

        //menampilkan seluruh anggota
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
                            + '<input type="button" class="btn btn-danger" id="btn-edit" value="Delete" onclick="hapusAnggotaByID(' + item.ID + ')"> </td>'
                        '</tr>'
                    });
                    $('#tbl-list-anggota').html(listProp);
                }
            });
        }

        //apabila klik edit, maka akan menampilkan modal untuk edit anggota

        function getAnggotaByID(ID) {

            //antara keluar modal atau keluar form baru?? masih harus ditanyakan


            $.ajax({
                url: '../Service/ListAnggotaService.asmx/getAnggotaByID',
                data: '{"ID":"' + JSON.stringify(ID) + '"}',
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json; charset=utf-8',
                success: function (anggota) {

                    SavedateAnggota = convertDateSave(anggota.d.MasaBerlakuAnggota);
                    SavedateKartu = convertDateSave(anggota.d.MasaBerlakuKartu);

                    var dateKartu = convertDateShow(anggota.d.MasaBerlakuKartu);
                    var dateAnggota = convertDateShow(anggota.d.MasaBerlakuAnggota);

                    tempID = anggota.d.ID,
                    $('#txt-masa-berlaku-kartu').val(dateKartu),
                    $('#txt-masa-berlaku-anggota').val(dateAnggota),

                    $('#txt-kode-anggota').val(anggota.d.KodeAnggota),

                    $('#txt-nama').val(anggota.d.Nama),
                    $('#txt-alamat').val(anggota.d.Alamat),
                    $('#txt-telp').val(anggota.d.NoTelepon),
                    $('#txt-email').val(anggota.d.Email),

                    dpropinsi = anggota.d.IDProvinsi,
                    loadPropinsi(dpropinsi),

                    dkota = anggota.d.IDKota,
                    loadKota(dkota)

                    dkecamatan = anggota.d.IDKecamatan,
                    loadKecamatan(dkecamatan)
                 
                }
            });

            $('#modal-edit').modal('show');
        }

        //konversi tanggal dan ditampilkan format dd mm YY
        function convertDateShow(tanggal) {

            var dateString = tanggal.substr(6);
            var currentTime = new Date(parseInt(dateString));
            var month = currentTime.getMonth() + 1;
            var day = currentTime.getDate();
            var year = currentTime.getFullYear();
            var date = day + "-" + month + "-" + year;
            return date;
        }

        //konversi tanggal dan disimpan kedalam Database format YY mm dd
        function convertDateSave(tanggal) {

            var dateString = tanggal.substr(6);
            var currentTime = new Date(parseInt(dateString));
            var month = currentTime.getMonth() + 1;
            var day = currentTime.getDate();
            var year = currentTime.getFullYear();
            var date = year + "-" + month + "-" + day;
            return date;
        }

        //hapus anggota
        function hapusAnggotaByID(ID) {

            var answer = confirm("Anda Akan Menghapus Data ini?")
            if (answer) {

                $.ajax({
                    url: '../Service/ListAnggotaService.asmx/hapusAnggota',
                    data: '{"id":"' + JSON.stringify(ID) + '"}',
                    type: 'POST',
                    dataType: 'JSON',
                    contentType: 'application/json; charset=utf-8',
                    success: function (anggota) {
                        if (anggota) {
                            alert('berhasil')
                            LoadAnggota();
                        } else
                            alert('gagal dihapus')

                    }
                });

            }
            else {
 
                //do nothing
            }

            
        }

        function editAnggota() {
            var anggota = {};
            anggota.KodeAnggota = $('#txt-kode-anggota').val();
            anggota.Nama = $('#txt-nama').val();
            anggota.Alamat = $('#txt-alamat').val();
            anggota.IDProvinsi = $('#dpropinsi').val();
            anggota.IDKota= $('#dkota').val();
            anggota.IDKecamatan = $('#dkecamatan').val();
            anggota.Email = $('#txt-email').val();
            anggota.NoTelepon= $('#txt-telp').val();
            anggota.MasaBerlakuKartu = SavedateKartu;
            anggota.MasaBerlakuAnggota = SavedateAnggota;
            anggota.ID = tempID;
          
            anggota.Email = $('#txt-email').val();
            

            $.ajax({
                type: "POST",
                url: "../Service/ListAnggotaService.asmx/updateAnggota",
                data: '{anggota: ' + JSON.stringify(anggota) + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    alert("Berhasil di update.");
                    LoadAnggota();
                }
            });
            $('#modal-edit').modal('hide');
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

            if (ID == null ) {
                dpropinsi = $("#dpropinsi").val();
            }

            $.ajax({
                url: "../Service/ListAnggotaService.asmx/getKota",
                data: '{id: '+ dpropinsi +'}',
                contentType: "application/json; charset=utf-8",
                type: "POST",
                dataType: "json",
                success: function (id) {
                    var out = "";
                    $.each(id.d, function (index, item) {

                        out += '<option value="' + item.ID + '">' + item.NamaKota + '</option>';
                    });
                    $('#dkota').html(out).val(ID);
                }
            });
        }
 
        function loadKecamatan(ID) {

            if (ID == null) {
                dkota = $("#dkota").val();
            }


            $.ajax({
                url: "../Service/ListAnggotaService.asmx/getKecamatan",
                data: '{id: ' + dkota + '}',
                contentType: "application/json; charset=utf-8",
                type: "POST",
                dataType: "json",
                success: function (id) {
                    var out = "";
                    $.each(id.d, function (index, item) {

                        out += '<option value="' + item.ID + '">' + item.NamaKecamatan + '</option>';
                    });
                    $('#dkecamatan').html(out).val(ID);
                }
            });
        }
    
        function searchAnggotaByNama(nama) {
            $.ajax({

                url: '../Service/ListAnggotaService.asmx/searchAnggotaByNama',
                data: '{"nama":"' + nama + '"}',
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
                            + '<input type="button" class="btn btn-danger" id="btn-edit" value="Delete" onclick="hapusAnggotaByID(' + item.ID + ')"> </td>'
                        '</tr>'
                    });
                    $('#tbl-list-anggota').html(listProp);
                }
            });

        }

        function searchAnggotaByTelp(telp) {
            $.ajax({

                url: '../Service/ListAnggotaService.asmx/searchAnggotaByTelp',
                data: '{"telp":"' + telp + '"}',
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
                            + '<input type="button" class="btn btn-danger" id="btn-edit" value="Delete" onclick="hapusAnggotaByID(' + item.ID + ')"> </td>'
                        '</tr>'
                    });
                    $('#tbl-list-anggota').html(listProp);
                }
            });

        }

        function searchAnggotaByKode(kode) {

            $.ajax({

                url: '../Service/ListAnggotaService.asmx/searchAnggotaByKode',
                data: '{"kode":"' + kode + '"}',
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
                            + '<input type="button" class="btn btn-danger" id="btn-edit" value="Delete" onclick="hapusAnggotaByID(' + item.ID + ')"> </td>'
                        '</tr>'
                    });
                    $('#tbl-list-anggota').html(listProp);
                }
            });

        }

        function searchAnggotaByEmail(email) {

            $.ajax({

                url: '../Service/ListAnggotaService.asmx/searchAnggotaByEmail',
                data: '{"email":"' + email + '"}',
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
                            + '<input type="button" class="btn btn-danger" id="btn-edit" value="Delete" onclick="hapusAnggotaByID(' + item.ID + ')"> </td>'
                        '</tr>'
                    });
                    $('#tbl-list-anggota').html(listProp);
                }
            });

        }
 
        function searchAnggotaByAlamat(Alamat) {

            $.ajax({

                url: '../Service/ListAnggotaService.asmx/searchAnggotaByAlamat',
                data: '{"alamat":"' + Alamat + '"}',
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
                            + '<input type="button" class="btn btn-danger" id="btn-edit" value="Delete" onclick="hapusAnggotaByID(' + item.ID + ')"> </td>'
                        '</tr>'
                    });
                    $('#tbl-list-anggota').html(listProp);
                }
            });

        }
         
        $("#dpropinsi").click(function () {
            loadKota();
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

        $("#txt-search").keyup(function () {

            if ($("#searchby").val() == 'nama')
                searchAnggotaByNama($("#txt-search").val());
            else if ($("#searchby").val() == 'telp')
                searchAnggotaByTelp($("#txt-search").val());
            else if ($("#searchby").val() == 'email')
                searchAnggotaByEmail($("#txt-search").val());
            else if ($("#searchby").val() == 'kode')
                searchAnggotaByKode($("#txt-search").val());
            else if ($("#searchby").val() == 'alamat')
                searchAnggotaByAlamat($("#txt-search").val());
        });
         
    </script>
</asp:Content>

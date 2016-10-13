<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterPetugas.Master" AutoEventWireup="true" CodeBehind="FormAnggotaEdit.aspx.cs" Inherits="PerpustakaanWeb.Petugas.FormAnggotaEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .box-body {
            display: none;
        }
    </style>

 <%--   1.SEARCH ANGGOTA
    2.PILIH ANGGOTA BY ID
    3.TAMPIL ANGGOTA BY ID
    4.TAMPIL EDIT ANGGOTA DAN IURAN
    5.SIMPAN EDIT ANGGOTA
     6. VALIDASI FORM--%>

    <div class="box box-info">
        <div class="box-header">
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-2">
                            <input type="text" id="txt-anggotaS" class="form-control" />
                        </div>
                        <div class="col-md-2">
                            <button type="button" id="search-anggota" class="btn btn-primary">Search</button>
                        </div>
                    </div>
                </div>
            </div>
            <h2>UBAH DATA ANGGOTA</h2>
        </div>
        <div class="box-body" id="hidden">
            <form action="#" method="post" id="formAnggota">
                <div class="form-horizontal">
                    <input id="AnggotaId" type="hidden">
                    <div class="form-group">
                        <label class="control-label col-md-2" for="KodeAnggota">Kode Anggota</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="KodeAnggota" name="KodeAnggota" type="text" value="" readonly />
                            <span class="field-validation-valid text-danger" data-valmsg-for="KodeAnggota" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="Nama">Nama</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="Nama" name="Nama" type="text" value="" />
                            <span class="field-validation-valid text-danger" data-valmsg-for="Nama" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="Alamat">Alamat</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="Alamat" name="Alamat" type="text" value="" />
                            <span class="field-validation-valid text-danger" data-valmsg-for="Alamat" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="OptProvinsi">Provinsi</label>
                        <div class="col-md-10">
                            <select class="form-control" data-val="true" data-val-number="The field IDProvinsi must be fill" id="OptProvinsi" name="OptProvinsi">
                            </select>
                            <span class="field-validation-valid text-danger" data-valmsg-for="OptProvinsi" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="OptKota">Kota</label>
                        <div class="col-md-10">
                            <select class="form-control" data-val="true" data-val-number="The field IDKota must be fill." id="OptKota" name="OptKota">
                            </select>
                            <span class="field-validation-valid text-danger" data-valmsg-for="OptKota" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="OptKecamatan">Kecamatan</label>
                        <div class="col-md-10">
                            <select class="form-control" data-val="true" data-val-number="The field IDKecamatan must be a number." id="OptKecamatan" name="OptKecamatan">
                            </select>
                            <span class="field-validation-valid text-danger" data-valmsg-for="OptKecamatan" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="Kelurahan">Kelurahan</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="Kelurahan" name="Kelurahan" type="text" value="" />
                            <span class="field-validation-valid text-danger" data-valmsg-for="Kelurahan" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="Email">Email</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="Email" name="Email" type="text" value="" />
                            <span class="field-validation-valid text-danger" data-valmsg-for="Email" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="NoTelepon">No Telepon</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="NoTelepon" name="NoTelepon" type="text" value="" />
                            <span class="field-validation-valid text-danger" data-valmsg-for="NoTelepon" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="MasaBerlakuKartu">Masa Berlaku Kartu</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" data-val="true" id="MasaBerlakuKartu" name="MasaBerlakuKartu" type="date" value="" />
                            <span class="field-validation-valid text-danger" data-valmsg-for="MasaBerlakuKartu" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="MasaBerlakuAnggota">Masa Berlaku Anggota</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" data-val="true" id="MasaBerlakuAnggota" name="MasaBerlakuAnggota" type="date" value="" />
                            <span class="field-validation-valid text-danger" data-valmsg-for="MasaBerlakuAnggota" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="CreatedOn">CreatedOn</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" data-val="true" id="CreatedOn" name="CreatedOn" type="date" value="" readonly />
                            <span class="field-validation-valid text-danger" data-valmsg-for="CreatedOn" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="CreatedBy">CreatedBy</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" data-val="true" id="CreatedBy" name="CreatedBy" type="number" value="" readonly />
                            <span class="field-validation-valid text-danger" data-valmsg-for="CreatedBy" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="ModifiedOn">ModifiedOn</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" data-val="true" data-val-date="The field ModifiedOn must be a date." id="ModifiedOn" name="ModifiedOn" type="date" value="" />
                            <span class="field-validation-valid text-danger" data-valmsg-for="ModifiedOn" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="ModifiedBy">ModifiedBy</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" data-val="true" data-val-number="The field ModifiedBy must be a number." id="ModifiedBy" name="ModifiedBy" type="number" value="" />
                            <span class="field-validation-valid text-danger" data-valmsg-for="ModifiedBy" data-valmsg-replace="true"></span>
                        </div>
                    </div>

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
                                                    <input type="text" id="txt-anggota" class="form-control" />
                                                </div>
                                                <div class="col-md-2">
                                                    <button type="button" id="search-anggotaS" class="btn btn-primary">Search</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-md-12">
                                        <table class="table table-striped text-center">
                                            <thead>
                                                <tr>
                                                    <th>Kode Anggota</th>
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

                    <%--MODAL POP UP IURAN--%>

                    <!-- Modal IURAN Dialog-->
                    <div id="modal-iuran" class="modal fade" tabindex="-1" role="dialog">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title">Jenis Iuran</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>Jenis Iuran</th>
                                                        <th>Masa Berlaku</th>
                                                        <th>Jumlah</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="data-iuran-modal">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button type="button" id="btn-save" class="btn btn-default" data-dismiss="modal">Save</button>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>
                    <!-- /.modal -->

                    <div class="form-group">
                        <div class="box-footer clearfix" style="float: right;">
                            <button type="button" id="btn-ok" class="btn btn-success">Ok</button>
                        </div>
                    </div>

                </div>
            </form>
        </div>
    </div>



    <script src="../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script>

        //---------------------------------DROPDOWN DAERAH------------------------------//
        function loadDataPropinsi() {
            $.ajax({
                url: '../Service/AnggotaService.asmx/GetAllPropinsi',
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json; charset=utf-8',
                success: function (dataProp) {
                    var listProp = "";
                    listProp += '<option value="-1">--Pilih Propinsi--</option>'
                    $.each(dataProp.d, function (index, item) {
                        listProp += '<option value="' + item.ID + '">' +
                            item.NamaProvinsi + '</option>'
                    });
                    $('#OptProvinsi').html(listProp);
                }
            });
        }

        function loadKotaByIdProp(propid) {
            $.ajax({
                url: '../Service/AnggotaService.asmx/GetAllKotaByProvID',
                data: '{"id":"' + propid + '"}',
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json; charset=utf-8',
                success: function (dataKota) {
                    var ListKota = "";
                    ListKota += '<option value="-1">--Pilih Kota--</option>'
                    $.each(dataKota.d, function (index, item) {
                        ListKota += '<option value="' + item.ID + '">' +
                            item.NamaKota + '</option>'
                    });
                    $('#OptKota').html(ListKota);
                }

            });
        }

        function loadKecByIdKota(kotaid) {
            $.ajax({
                url: '../Service/AnggotaService.asmx/GetAllKecByKotaID',
                data: '{"id":"' + kotaid + '"}',
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json; charset=utf-8',
                success: function (dataKecamatan) {
                    var ListKec = "";
                    ListKec += '<option value="-1">--Pilih Kecamatan--</option>'
                    $.each(dataKecamatan.d, function (index, item) {
                        ListKec += '<option value="' + item.ID + '">' +
                            item.NamaKecamatan + '</option>'
                    });
                    $('#OptKecamatan').html(ListKec);
                }

            });
        }


        $('#OptProvinsi').change(function () {
            var PropId = $('#OptProvinsi').val();
            loadKotaByIdProp(PropId);
        });

        $('#OptKota').change(function () {
            var KotaId = $('#OptKota').val();
            loadKecByIdKota(KotaId);
        });


        //---------------------------------SEARCH------------------------------//
        $('#search-anggota').click(function () {
            var searchValue = $('#txt-anggotaS').val();
            loadSearchAnggota(searchValue);
        });

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
                                '<td><div class="row"><div class="col-md-5"><input type="button" value="Select" class="btn btn-default" onclick="edit(' + item.ID + ')"/></div></div></td>' +
                            '</tr>'
                    });

                    $('#data-anggota').html(listAnggota);
                }
            });
        }

        //---------------------------------INSERT------------------------------//

        $('#btn-ok').click(function () {
            $('#modal-iuran').modal('show');

        })

        function loadIuran() {
            $.ajax({
                url: '../Service/AnggotaService.asmx/GetIuranNonDenda',
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json; charset=utf-8',
                success: function (dataIuran) {
                    var listIuran = "";
                    $.each(dataIuran.d, function (index, item) {
                        listIuran += '<tr>' +
                                '<td>' + item.TipeIuran + '</td>' +
                                '<td>' + item.MasaBerlaku + '</td>' +
                                '<td>' + item.Jumlah + '</td>' +
                         '</tr>';
                    });

                    $('#data-iuran-modal').html(listIuran);
                }
            });
        }


        //BUTTON SAVE UNTUK KE TABEL MSTANGGOTA DAN T_R_SCN_HEADER , T_R_SCN_DETAIL, T_MST_SCN_TYPE

        $('#btn-save').click(function () {
            var anggota = {};
            //anggota.ID = $("#AnggotaId").val();
            anggota.KodeAnggota = $("#KodeAnggota").val();
            anggota.Nama = $("#Nama").val();
            anggota.Alamat = $("#Alamat").val();
            anggota.IDProvinsi = $("#OptProvinsi").val();
            anggota.IDKota = $("#OptKota").val();
            anggota.IDKecamatan = $("#OptKecamatan").val();
            anggota.IDKelurahan = $("#Kelurahan").val();
            anggota.Email = $("#Email").val();
            anggota.NoTelepon = $("#NoTelepon").val();
            anggota.CreatedBy = $("#CreatedBy").val();
            anggota.ModifiedBy = $("#ModifiedBy").val();
            var iuran = {};
            iuran.TipeIuran = $()

            $.ajax({
                url: '../Service/AnggotaService.asmx/SimpanAnggota',

                data: '{anggota:' + JSON.stringify(anggota) + '}',
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                dataType: 'JSON',
                success: function (response) {
                    alert("Member has been saved successfully.");
                    window.location.reload();
                }
            });
            return false;
        });

        //---------------------------------EDIT IURAN------------------------------//

        function edit(id) {
            $.ajax({
                url: '../Services/AnggotaService.asmx/GetAnggotaById',
                data: '{"id":"' + id + '"}',
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json; charset=utf-8',
                success: function (dataAnggota) {
                    var listAnggota = "";
                    var iCount = 0;
                    $.each(dataAnggota.d, function (index, item) {
                        var dateKartu = new Date(parseInt((item.MasaBerlakuKartu).replace(/[^\d]/g, '')));
                        var dateAnggota = new Date(parseInt((item.MasaBerlakuAnggota).replace(/[^\d]/g, '')));
                        listAnggota += '<tr>' +
                        $("#KodeAnggota").val(item.KodeAnggota);
                        $("#Nama").val(item.Nama);
                        $("#Alamat").val(item.Alamat);
                        $("#OptProvinsi").val(item.IDProvinsi);
                        $("#OptKota").val(item.IDKota);
                        $("#OptKecamatan").val(item.IDKecamatan);
                        $("#Kelurahan").val(item.IDKelurahan);
                        $("#Email").val(item.Email);
                        $("#NoTelepon").val(item.NoTelepon);
                        $("#MasaBerlakuKartu").val(dateKartu.format("dd-MMM-yyyy"));
                        $("#MasaBerlakuAnggota").val(dateAnggota.format("dd-MMM-yyyy"));

                    });
                    //$('#hidden').show();
                }

            });
        }

        $(document).ready(function () {
            loadIuran();
            loadDataPropinsi();
        });

    </script>
</asp:Content>

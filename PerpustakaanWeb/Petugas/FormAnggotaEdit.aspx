<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterPetugas.Master" AutoEventWireup="true" CodeBehind="FormAnggotaEdit.aspx.cs" Inherits="PerpustakaanWeb.Petugas.FormAnggotaEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <% if (HttpContext.Current.Session["Email"] != null && HttpContext.Current.Session["ID"] != null && HttpContext.Current.Session["Role"].ToString() == "petugas")
        { %>
    
    <%--    1. NERIMA ID DARI PAGE LISTANGGOTA
            2. MENAMPILKAN IURAN YANG PERLU SAJA
            3. CHECK BERDASARKAN CHECKBOX
            4. VALIDASI FORM--%>

    <%--$theName = $_REQUEST('ID');--%>

    <div class="box box-info">
        <div class="box-header">
            <h2>UBAH DATA ANGGOTA</h2>
        </div>
        <div class="box-body">
            <form action="#" method="post" id="formAnggota">
                <div class="form-horizontal">
                    <input id="AnggotaId" type="hidden">
                    <div class="form-group">
                        <label class="control-label col-md-2" for="KodeAnggota">Kode Anggota</label>
                        <div class="input-group col-md-4">
                            <input class="form-control text-box single-line" id="KodeAnggota" name="KodeAnggota" type="text" value="" readonly />
                            <span class="field-validation-valid text-danger" data-valmsg-for="KodeAnggota" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="Nama">Nama</label>
                        <div class="col-md-4">
                            <input class="form-control text-box single-line" id="Nama" name="Nama" type="text" required="required" />
                            <span class="field-validation-valid text-danger" data-valmsg-for="Nama" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="Alamat">Alamat</label>
                        <div class="col-md-4">
                            <input class="form-control text-box single-line" id="Alamat" name="Alamat" type="text" value="" />
                            <span class="field-validation-valid text-danger" data-valmsg-for="Alamat" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="OptProvinsi">Provinsi</label>
                        <div class="col-md-4">
                            <select class="form-control" data-val="true" data-val-number="The field IDProvinsi must be fill" id="OptProvinsi" name="OptProvinsi">
                            </select>
                            <span class="field-validation-valid text-danger" data-valmsg-for="OptProvinsi" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="OptKota">Kota</label>
                        <div class="col-md-4">
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
                        <div class="col-md-4">
                            <input class="form-control text-box single-line" id="Kelurahan" name="Kelurahan" type="text" value="" />
                            <span class="field-validation-valid text-danger" data-valmsg-for="Kelurahan" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="Email">Email</label>
                        <div class="col-md-4">
                            <input class="form-control text-box single-line" id="Email" name="Email" type="text" value="" />
                            <span class="field-validation-valid text-danger" data-valmsg-for="Email" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="NoTelepon">No Telepon</label>
                        <div class="col-md-4">
                            <input class="form-control text-box single-line" id="NoTelepon" name="NoTelepon" type="text" value="" />
                            <span class="field-validation-valid text-danger" data-valmsg-for="NoTelepon" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="MasaBerlakuKartu">Masa Berlaku Kartu</label>
                        <div class="col-md-4">
                            <input class="form-control text-box single-line" data-val="true" id="MasaBerlakuKartu" name="MasaBerlakuKartu" type="date" value="" />
                            <span class="field-validation-valid text-danger" data-valmsg-for="MasaBerlakuKartu" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="MasaBerlakuAnggota">Masa Berlaku Anggota</label>
                        <div class="col-md-4">
                            <input class="form-control text-box single-line" data-val="true" id="MasaBerlakuAnggota" name="MasaBerlakuAnggota" type="date" value="" />
                            <span class="field-validation-valid text-danger" data-valmsg-for="MasaBerlakuAnggota" data-valmsg-replace="true"></span>
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
                                    <input id="anggotaID"/>

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
                                                        <th><input type="checkbox" /></th>
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
                        <div class="box-footer clearfix">
                            <button type="button" id="btn-ok" class="btn btn-primary">Add</button>
                        </div>
                    </div>

                </div>
            </form>
        </div>
    </div>

    <script src="../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script>

        var dprovinsi;
        var dkota;
        var dkecamatan;
        var tempID;

        //---------------------------------DROPDOWN DAERAH------------------------------//
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
                    $('#OptProvinsi').html(out).val(ID);
                }
            });
        }


        function loadKota(ID) {
            if (ID == null) {
                dpropinsi = $("#OptProvinsi").val();
            }

            $.ajax({
                url: "../Service/ListAnggotaService.asmx/getKota",
                data: '{id: ' + dpropinsi + '}',
                contentType: "application/json; charset=utf-8",
                type: "POST",
                dataType: "json",
                success: function (id) {
                    var out = "";
                    $.each(id.d, function (index, item) {

                        out += '<option value="' + item.ID + '">' + item.NamaKota + '</option>';
                    });
                    $('#OptKota').html(out).val(ID);
                }
            });
        }



        function loadKecamatan(ID) {

            if (ID == null) {
                dkota = $("#OptKota").val();
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
                    $('#OptKecamatan').html(out).val(ID);
                }
            });
        }

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

        function loadIuran(id) {
            $.ajax({
                url: '../Service/AnggotaService.asmx/GetIuranNonDendaByIdAnggota',
                data: '{id: ' + id + '}',
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json; charset=utf-8',
                success: function (dataIuran) {
                    var listIuran = "";
                    $.each(dataIuran.d, function (index, item) {
                        listIuran += '<tr>' +
                                '<td><input type="checkbox" id="cb' + item.ID + '" value="0">' + '</td>' +
                                '<td>' + item.TipeIuran + '</td>' +
                                '<td>' + item.MasaBerlaku + '</td>' +
                                '<td>' + item.Jumlah + '</td>' +
                         '</tr>';
                    });

                    $('#data-iuran-modal').html(listIuran);
                }
            });
        }

        $('#btn-save').click(function () {
            var anggota = {};
            anggota.ID = $("#AnggotaId").val();
            anggota.KodeAnggota = $("#KodeAnggota").val();
            anggota.Nama = $("#Nama").val();
            anggota.Alamat = $("#Alamat").val();
            anggota.IDProvinsi = $("#OptProvinsi").val();
            anggota.IDKota = $("#OptKota").val();
            anggota.IDKecamatan = $("#OptKecamatan").val();
            anggota.IDKelurahan = $("#Kelurahan").val();
            anggota.Email = $("#Email").val();
            anggota.NoTelepon = $("#NoTelepon").val();
            anggota.ModifiedBy = '<%= Session["ID"] %>';

            var iuran = [];
            $('#data-iuran-modal tr').each(function () {
                var data = {};

                data.ID = $(this).find("td:nth-child(1)").find("input[type=hidden]").val();//ID tipe iuran
                data.TipeIuran = $(this).find("td:nth-child(2)").text();
                data.Jumlah = $(this).find("td:nth-child(4)").text();
                iuran.push(data);
            })

            var param = { anggota: anggota, iurans: iuran }
            $.ajax({
                url: '../Service/AnggotaService.asmx/SimpanAnggotaIuran',
                data: JSON.stringify(param),
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                dataType: 'JSON',
                success: function (response) {
                    alert("Member has been updated successfully.");
                    window.location.reload();
                }
            });
            return false;
        });

        //---------------------------------EDIT IURAN------------------------------//

        function edit(id) {
            $.ajax({
                url: '../Service/ListAnggotaService.asmx/getAnggotaByID',
                data: '{"ID":"' + JSON.stringify(id) + '"}',
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json; charset=utf-8',
                success: function (anggota) {

                    //SavedateAnggota = convertDateSave(anggota.d.MasaBerlakuAnggota);
                    //SavedateKartu = convertDateSave(anggota.d.MasaBerlakuKartu);

                    var dateKartu = new Date(parseInt((anggota.d.MasaBerlakuKartu).replace(/[^\d]/g, '')));
                    var dateAnggota = new Date(parseInt((anggota.d.MasaBerlakuAnggota).replace(/[^\d]/g, '')));

                    tempID = anggota.d.ID,
                    $('#MasaBerlakuKartu').val(dateKartu),
                    $('#MasaBerlakuAnggota').val(dateAnggota),

                    $("#KodeAnggota").val(anggota.d.KodeAnggota),
                    $('#Nama').val(anggota.d.Nama),
                    $('#Alamat').val(anggota.d.Alamat),
                    $('#NoTelepon').val(anggota.d.NoTelepon),
                    $('#Email').val(anggota.d.Email),

                    dpropinsi = anggota.d.IDProvinsi,
                    loadPropinsi(dpropinsi),

                    dkota = anggota.d.IDKota,
                    loadKota(dkota)

                    dkecamatan = anggota.d.IDKecamatan,
                    loadKecamatan(dkecamatan)

                }
            });
        }

        $(document).ready(function () {
            id = 3; //GET ID DISINI
            edit(id);
            loadIuran(id);
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

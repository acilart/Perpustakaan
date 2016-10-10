<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InputBuku.aspx.cs" Inherits="PerpustakaanWeb.Petugas.PenyimpananBuku" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="box box-info">
        <div class="box-header">
            <h2>FORM PENDAFTARAN ANGGOTA</h2>
        </div>
        <div class="box-body">
            <form action="#" method="post">
                <input name="__RequestVerificationToken" type="hidden" value="wcv9Q8y4GQ_x4bT7YRs85r6txf4MRvFtu3KUuz2Zf9jrA5dDYWSR46ZvsMmytRd1fCGU-m_R6wTCMy2A89rYe-54x__sqULvGAnS1GBxXfI1" />
                <div class="form-horizontal">
                    <div class="form-group">
                        <label class="control-label col-md-2" for="KodeBuku">Kode Buku</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="KodeBuku" name="KodeBuku" type="text" value="" readonly />
                            <span class="field-validation-valid text-danger" data-valmsg-for="KodeBuku" data-valmsg-replace="true"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-2" for="IDKategori">Kategori</label>
                        <div class="col-md-4">
                            <select class="form-control" id="IDKategori">
                                <option value="0">--Pilih Kategori--</option>
                            </select>
                            <span class="field-validation-valid text-danger" data-valmsg-for="IDKategori" data-valmsg-replace="true"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-2" for="IDPenerbit">Penerbit</label>
                        <div class="col-md-4">
                            <select class="form-control" data-val="true" data-val-number="The field Penerbit must be a fill." id="IDPenerbit" name="IDPenerbit">
                                <option value="">Select Penerbit</option>
                            </select>
                            <span class="field-validation-valid text-danger" data-valmsg-for="IDPenerbit" data-valmsg-replace="true"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-2" for="JudulBuku">Judul Buku</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="JudulBuku" name="JudulBuku" type="text" value="" />
                            <span class="field-validation-valid text-danger" data-valmsg-for="JudulBuku" data-valmsg-replace="true"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-2" for="Pengarang">Pengarang</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="Pengarang" name="Pengarang" type="text" value="" />
                            <span class="field-validation-valid text-danger" data-valmsg-for="Pengarang" data-valmsg-replace="true"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-2" for="ISBN">ISBN</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="ISBN" name="ISBN" type="text" value="" />
                            <span class="field-validation-valid text-danger" data-valmsg-for="ISBN" data-valmsg-replace="true"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-2" for="NilaiBuku">Nilai Buku (Rp)</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="NilaiBuku" name="NilaiBuku" type="text" value="" />
                            <span class="field-validation-valid text-danger" data-valmsg-for="NilaiBuku" data-valmsg-replace="true"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-2" for="Lokasi">Lokasi Buku</label>

                        <div class="col-md-10">
                            <input id="Lokasi" type="text" class="form-control text-box single-line" placeholder="Search Lokasi">
                            <span class="input-group-btn">
                                <button class="btn btn-default glyphicon glyphicon-search" type="button" data-toggle="modal" data-target="#modal-Lokasi" />
                            </span>
                        </div>
                    </div>


                    <!-- /.col-lg-6 -->

                    <div class="form-group">
                        <div class="col-md-5 col-md-offset-2">
                            <input  value="Cancel" class="btn btn-primary" />
                            <input id="btn-save" value="Save" class="btn btn-primary" />
                        </div>
                    </div>
                    <label id="IDCell" hidden="hidden" />
                </div>
            </form>
            <!-- Modal Dialog-->
            <div id="modal-Lokasi" class="modal fade" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Data Lokasi</h4>
                        </div>
                        <div class="modal-body">
                            <div>
                                <table class="table table-striped table-bordered table-responsive col-md-12">
                                    <thead>
                                        <tr>
                                            <th>Lokasi</th>
                                            <th>Deskripsi</th>
                                            <th>Kapasitas</th>
                                            <th>Terisi</th>
                                            <th>Kosong</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="data-lokasi">
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
        </div>

        
        <%--MODAL POP UP LOKASI--%>

        <script src="../Scripts/jquery-1.10.2.js"></script>
        <script src="../Scripts/bootstrap.js"></script>

        <script>
            function loadDataKategori() {
                $.ajax({
                    url: '../Service/InputBukuService.asmx/GetKategori',
                    type: 'POST',
                    dataType: 'JSON',
                    contentType: 'application/json; charset=utf-8',
                    success: function (dataAnu) {
                        var listProp = "";
                        $.each(dataAnu.d, function (index, item) {
                            listProp += '<option value="' + item.ID + '">' + item.NamaKategori + '</option>';

                        });

                        $('#IDKategori').html(listProp);
                    }
                });
            }

            function loadDataPenerbit() {
                $.ajax({
                    url: '../Service/InputBukuService.asmx/GetPenerbit',
                    type: 'POST',
                    dataType: 'JSON',
                    contentType: 'application/json; charset=utf-8',
                    success: function (dataAnu) {
                        var listProp = "";
                        $.each(dataAnu.d, function (index, item) {
                            listProp += '<option value="' + item.ID + '">' + item.NamaPenerbit + '</option>';

                        });

                        $('#IDPenerbit').html(listProp);
                    }
                });
            }

            function loadDataLemari() {
                $.ajax({
                    url: '../Service/InputBukuService.asmx/GetLemariAvailable',
                    type: 'POST',
                    dataType: 'JSON',

                    contentType: 'application/json; charset=utf-8',
                    success: function (dataAnu) {
                        var listProp = "";
                        $.each(dataAnu.d, function (index, item) {
                            listProp += '<tr>' +
                            '<td>' + item.Lokasi + '</td>' +
                            '<td>' + item.Deskripsi + '</td>' +
                            '<td>' + item.Kapasitas + '</td>' +
                            '<td>' + item.Terisi + '</td>' +
                            '<td>' + item.Kosong + '</td>' +
                            ' <td> <input type="button" class="btn btn-successs" value="Pilih" data-dismiss="modal" id="btnEdit" onClick="PilihLokasi(' + item.IDCell + ')" /></td>' +
                    '</tr>';

                        });

                        $('#data-lokasi').html(listProp);
                    }
                });
            }

            function PilihLokasi(ID) {
                $.ajax({
                    url: '../Service/InputBukuService.asmx/GetLemariByIDCell',
                    data: '{ID:' + ID + '}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'JSON',
                    type: 'POST',
                    success: function (lemari) {
                        $('#IDCell').val(lemari.d.IDCell);
                        $("#Lokasi").val(lemari.d.Deskripsi);
                    }
                });
               
            }

            $(document).ready(function () {
                loadDataLemari();
                loadDataKategori();
                loadDataPenerbit();
            });

            //event untuk button simpan
            $('#btn-save').click(function () {
                var buku = {};
                buku.IDKategori = $("#IDKategori").val();
                buku.IDPenerbit = $("#IDPenerbit").val();
                buku.JudulBuku = $("#JudulBuku").val();
                buku.ISBN = $("#ISBN").val();
                buku.Pengarang = $("#Pengarang").val();
                buku.Lokasi = $("#IDCell").val();
                buku.Value = $("#NilaiBuku").val();
                $.ajax({
                    url: '../Service/InputBukuService.asmx/SimpanBuku',
                    type: 'POST',
                    data: '{buku:' + JSON.stringify(buku) + '}',
                    contentType: 'application/json; charset=utf-8',
                    datatype: "json",
                    success: function (response) {
                        alert("Data Buku '" + $("#JudulBuku").val() + "' Berhasil Disimpan..");
                        window.location.reload();
                    }
                });
            })
        </script>
</asp:Content>

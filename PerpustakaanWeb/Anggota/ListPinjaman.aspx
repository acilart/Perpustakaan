<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterAnggota.Master" AutoEventWireup="true" CodeBehind="ListPinjaman.aspx.cs" Inherits="PerpustakaanWeb.Anggota.ListPinjaman" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
     <div class="panel panel-primary">
        <div class="panel-heading">
            <h1 class="panel-title">List Peminjaman</h1>
        </div>
        <div class="panel-body">

            <div class="form-horizontal">
                <div class="form-group col-md-3">
                    <select class="form-control" id="searchby">
                        <option value="kode">No Registrasi</option>
                        <option value="nama">Nama Anggota</option>
                       

                    </select>
                </div>

                <div class="form-group col-md-8 col-md-offset-1">
                    <input class="form-control" type="text" id="txt-search" placeholder="search" />

                </div>

                <div class="form-group">

                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <td>No</td>
                                <td>No Regristrasi</td>
                                <td>Nama</td>
                                <td>Tgl Pinjam</td>
                                <td>Tgl Kembali</td>
                                <td>Jumlah Buku</td>
                                <td>View Detail</td>
                            </tr>
                        </thead>
                        <tbody id="tbl-list-anggota">
                        </tbody>

                    </table>
                </div>
            </div>
        </div>
    </div>


 <%--  modalpopout--%>

    <div class="modal fade" id="modal-edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Edit Anggota</h4>
                </div>
                <div class="modal-body">

                         <table class="table table-bordered">
                        <thead>
                            <tr>
                                <td>No</td>
                                <td>Kode Buku</td>
                                <td>Judul Buku</td>
                                <td>Terlambat (Hari)</td>
                                <td>Denda (Rp)</td>
                       
                            </tr>
                        </thead>
                        <tbody id="tbl-list-detail">
                        </tbody>

                    </table>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" >Kembalikan</button>
                    <button type="button" class="btn btn-primary"data-dismiss="modal">Tutup</button>
                </div>
            </div>
        </div>
    </div>

 <%--  akhir modalpopout--%>


    <script>
        $(document).ready(function () {
            LoadList();
            
        });

        function LoadList() {
            $.ajax({
                url: '../Service/ListPinjamanService.asmx/getList',
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
                            + '<td>' + item.NoRegistrasi + '</td>'
                            + '<td>' + item.Nama + '</td>'
                            + '<td>' + convertDate(item.TglKembali) + '</td>'
                            + '<td>' + convertDate(item.TglPinjam) + '</td>'
                            + '<td>' + item.JumlahBuku + '</td>'
                            + '<td> <input type="button" class="btn btn-warning" id="btn-edit" value="Edit" onclick=getDataByID('+item.ID+')></td>'
                        '</tr>'
                     
                    });
                    $('#tbl-list-anggota').html(listProp);
                }
            });
        }
        
        function getDataByID(ID) {


            $.ajax({
                url: '../Service/ListPinjamanService.asmx/getListDetail',
                data: '{"ID":"' + JSON.stringify(ID) + '"}',
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
                            + '<td>' + item.KodeBuku + '</td>'
                            + '<td>' + item.JudulBuku + '</td>'
                            + '<td>' +  + '</td>'
                            + '<td>' +  + '</td>'
                  
                         '</tr>'
                    });
                    $('#modal-edit').modal('show');
                    $('#tbl-list-detail').html(listProp);
                }
            });

            
        }

        function searchByNama(nama) {
              $.ajax({
                url: '../Service/ListPinjamanService.asmx/searchByNama',
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
                            + '<td>' + item.NoRegistrasi + '</td>'
                            + '<td>' + item.Nama + '</td>'
                            + '<td>' + convertDate(item.TglKembali) + '</td>'
                            + '<td>' + convertDate(item.TglPinjam) + '</td>'
                            + '<td>' + item.JumlahBuku + '</td>'
                            + '<td> <input type="button" class="btn btn-warning" id="btn-edit" value="Edit" onclick=getDataByID(' + item.ID + ')></td>'
                        '</tr>'
                        
                    });
                    $('#tbl-list-anggota').html(listProp);
                }
            });


        }



        function convertDate(tanggal) {

            var dateString = tanggal.substr(6);
            var currentTime = new Date(parseInt(dateString));
            var month = currentTime.getMonth() + 1;
            var day = currentTime.getDate();
            var year = currentTime.getFullYear();
            var date = day + "/" + month + "/" + year;
            return date;
        }


        $('#txt-search').keypress(function () {
            searchByNama($('#txt-search').val())
        });
    </script>
    
</asp:Content>

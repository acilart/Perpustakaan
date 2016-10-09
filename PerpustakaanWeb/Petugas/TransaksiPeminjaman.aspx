<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="TransaksiPeminjaman.aspx.cs" Inherits="PerpustakaanWeb.Petugas.TransaksiPeminjaman" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="box box-info">
        <div class="box-header">
            <h2>Form Peminjaman</h2>
        </div>
        <div class="box-body">
            <form action="/Anggota/Create" method="post">
                <div class="form-horizontal">

                    <div class="form-group">                       
                        <label class="control-label col-md-2" for="Nama">Nama</label>
                        <div class="input-group col-md-10">
                            <input class="form-control text-box single-line" id="Nama" name="Nama" type="text" value="" />
                            <span class="field-validation-valid text-danger" data-valmsg-for="Nama" data-valmsg-replace="true"></span>
                            <span class="input-group-btn">
                                <button type="submit" name="search" id="search-btn" class="btn btn-flat">
                                    <i class="fa fa-search"></i>
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
                        <label class="control-label col-md-2" for="NoRef">No Referensi</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="NoRef" name="NoRef" type="text" value="" readonly />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="TglPinjam">Tanggal Pinjam</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="TglPinjam" name="TglPinjam" type="date" value="" readonly />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="TglKembali">Tanggal Kembali</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="TglKembali" name="TglKembali" type="date" value="" readonly />
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
            <input type="submit" value="Tambah" class="btn btn-primary" style="float: right;" />
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <table class="table table-bordered">
                <tr>
                    <th style="width: 5%">No</th>
                    <th style="width: 13%">Kode Buku</th>
                    <th style="width: 50%">Judul Buku</th>
                    <th style="width: 20%">Pengarang</th>
                    <th style="width: 12%">Action</th>
                </tr>
                <tr>
                    <td>1.</td>
                    <td>Update software</td>
                    <td>
                        <div class="progress progress-xs">
                            <div class="progress-bar progress-bar-danger" style="width: 55%"></div>
                        </div>
                    </td>
                    <td><span class="badge bg-red">55%</span></td>
                </tr>
                <tr>
                    <td>2.</td>
                    <td>Clean database</td>
                    <td>
                        <div class="progress progress-xs">
                            <div class="progress-bar progress-bar-yellow" style="width: 70%"></div>
                        </div>
                    </td>
                    <td><span class="badge bg-yellow">70%</span></td>
                </tr>
                <tr>
                    <td>3.</td>
                    <td>Cron job running</td>
                    <td>
                        <div class="progress progress-xs progress-striped active">
                            <div class="progress-bar progress-bar-primary" style="width: 30%"></div>
                        </div>
                    </td>
                    <td><span class="badge bg-light-blue">30%</span></td>
                </tr>
                <tr>
                    <td>4.</td>
                    <td>Fix and squish bugs</td>
                    <td>
                        <div class="progress progress-xs progress-striped active">
                            <div class="progress-bar progress-bar-success" style="width: 90%"></div>
                        </div>
                    </td>
                    <td><span class="badge bg-green">90%</span></td>
                </tr>
            </table>
        </div>
        <!-- /.box-body -->
        <div class="box-footer clearfix">
            <input type="submit" value="Clear" class="btn btn-primary" />
            <input type="submit" value="Save" class="btn btn-primary" />
            <ul class="pagination pagination-sm no-margin pull-right">
                <li><a href="#">&laquo;</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">&raquo;</a></li>
            </ul>
        </div>
    </div>
    <!-- /.box -->



    <%--MODAL BUKU POPUP--%>
</asp:Content>

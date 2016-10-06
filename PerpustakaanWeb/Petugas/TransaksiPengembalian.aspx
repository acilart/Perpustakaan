<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TransaksiPengembalian.aspx.cs" Inherits="PerpustakaanWeb.Petugas.TransaksiPengembalian" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="box box-info">
        <div class="box-header">
            <h2>Form Pengembalian</h2>
        </div>
        <div class="box-body">
            <form action="/Anggota/Create" method="post">
                <input name="__RequestVerificationToken" type="hidden" value="wcv9Q8y4GQ_x4bT7YRs85r6txf4MRvFtu3KUuz2Zf9jrA5dDYWSR46ZvsMmytRd1fCGU-m_R6wTCMy2A89rYe-54x__sqULvGAnS1GBxXfI1" />
                <div class="form-horizontal">

                    <div class="form-group">                       
                        <label class="control-label col-md-2" for="NoRef">No Referensi</label>
                        <div class="input-group col-md-10">
                            <input class="form-control text-box single-line" id="NoRef" name="NoRef" type="text" value="" readonly/>
                            <span class="field-validation-valid text-danger" data-valmsg-for="NoRef" data-valmsg-replace="true"></span>
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
                        <label class="control-label col-md-2" for="Nama">Nama Anggota</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="Nama" name="Nama" type="text" value="" readonly />
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

                    <div class="form-group">
                        <label class="control-label col-md-2" for="TglDikembalikan">Tanggal Dikembalikan</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="TglDikembalikan" name="TglDikembalikan" type="date" value="" readonly />
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
                <tr>
                    <th style="width: 10%">Kode Buku</th>
                    <th style="width: 60%">Judul Buku</th>
                    <th style="width: 10%">Laporan Kehilangan</th>
                    <th style="width: 10%">Terlambat(Hari)</th>
                    <th style="width: 10%">Denda(Rp)</th>
                </tr>
                <tr>
                    <td>1.</td>
                    <td>Buku 001</td>
                    <td>
                        <input type="checkbox" />
                    </td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>2.</td>
                    <td>Buku 002</td>
                    <td>
                        <input type="checkbox" />
                    </td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>12000</td>
                </tr>
            </table>
        </div>
        <!-- /.box-body -->
        <div class="box-footer clearfix">
            <input type="submit" value="Clear" class="btn btn-primary" />
            <input type="submit" value="Save" class="btn btn-primary" />
        </div>
    </div>
    <!-- /.box -->
    
    <%--MODAL NO REFERENSI POPUP--%>
</asp:Content>

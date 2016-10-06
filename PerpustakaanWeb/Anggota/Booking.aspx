<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="PerpustakaanWeb.Anggota.Booking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="box box-info">
        <div class="box-header">
            <h2>Booking</h2>
        </div>
        <div class="box-body">
            <form action="#" method="post">
                <input name="__RequestVerificationToken" type="hidden" value="wcv9Q8y4GQ_x4bT7YRs85r6txf4MRvFtu3KUuz2Zf9jrA5dDYWSR46ZvsMmytRd1fCGU-m_R6wTCMy2A89rYe-54x__sqULvGAnS1GBxXfI1" />
                <div class="form-horizontal">

                    <div class="form-group">
                        <label class="control-label col-md-2" for="NamaAnggota">Nama Anggota</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="Nama" name="Nama" type="text" value="" />
                            <span class="field-validation-valid text-danger" data-valmsg-for="Nama" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="NoBooking">No Booking</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="NoBooking" name="NoBooking" type="text" value="" />
                            <span class="field-validation-valid text-danger" data-valmsg-for="NoBooking" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="TglBooking">Tanggal Booking</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="TglBooking" name="TglBooking" type="date" value="" />
                            <span class="field-validation-valid text-danger" data-valmsg-for="TglBooking" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="TglPinjam">Tanggal Pinjam</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="TglPinjam" name="TglPinjam" type="date" value="" />
                            <span class="field-validation-valid text-danger" data-valmsg-for="TglPinjam" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <input type="submit" value="Create" class="btn btn-default" />
                        </div>
                    </div>                   
                </div>
            </form>
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
                    <th style="width: 13%">Kode Buku</th>
                    <th style="width: 50%">Judul Buku</th>
                    <th style="width: 20%">Pengarang</th>
                    <th style="width: 12%">Action</th>
                </tr>
                <tr>
                    <td>001</td>
                    <td>Buku 001</td>
                    <td>Pengarang 001</td>
                    <td></td>
                </tr>
                <tr>
                    <td>002</td>
                    <td>Buku 002</td>
                    <td>Pengarang 002</td>
                    <td></td>
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



    <%--MODAL BOOKING BUKU POPUP--%>
</asp:Content>

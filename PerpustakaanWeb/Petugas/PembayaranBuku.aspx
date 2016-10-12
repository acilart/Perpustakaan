<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PembayaranBuku.aspx.cs" Inherits="PerpustakaanWeb.Petugas.PembayaranBuku" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <div class="box box-info">
     <div class="box-header">
        <h2>Form Penggantian</h2>
    </div>
    <div class="box-body">
        <form>
            <div class="form-horizontal">

                <div class="form-group">
                    <label class="control-label col-md-2" for="NoRef">No Referensi</label>
                    <div class="input-group col-md-10">
                        <input class="form-control text-box single-line" id="NoRef" name="NoRef" type="text" value="" readonly />
                        <span class="field-validation-valid text-danger" data-valmsg-for="NoRef" data-valmsg-replace="true"></span>
                        <span class="input-group-btn">
                            <button type="button" name="search" id="search-btn" class="btn btn-primary">Search</button>
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-2" for="NoReg">No Registrasi</label>
                    <div class="col-md-10">
                        <input class="form-control text-box single-line" id="NoReg" name="NoReg" type="text" value="" readonly />
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-2" for="Nama">Nama Anggota</label>
                    <div class="col-md-10">
                        <input class="form-control text-box single-line" id="Nama" name="Nama" type="text" value="" readonly />
                    </div>
                </div>


                <div class="form-group">
                    <label class="control-label col-md-2" for="Tgl">Tanggal</label>
                    <div class="col-md-10">
                        <input class="form-control text-box single-line" id="Tgl" name="Tgl" type="date" value="" readonly />
                    </div>
                </div>

            </div>
        </form>
    </div></div>

    <%--MODAL NO REFERENSI POPUP--%>
    <div class="modal" id="modal-ref" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4>No Referensi</h4>
                </div>
                <div class="modal-body">
                    <input id="IDNoRef" type="hidden" />

                    <div class="row">
                        <br />
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" id="txt-NoRef" class="form-control" />
                                </div>
                                <div class="col-md-2">
                                    <button type="button" id="search-NoRef" class="btn btn-default">Search</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <table class="table table-striped text-center">
                            <thead>
                                <tr>
                                    <th>No Referensi</th>
                                    <th>Pilih</th>
                                </tr>
                            </thead>
                            <tbody id="data-NoRef">
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="box-footer clearfix" style="float:right;">
                            <input type="button" value="Cancel" class="btn btn-primary" />
                            <input type="button" id="confirm" value="Confirm" class="btn btn-primary" />
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    <%--TABEL DETAIL PEMBAYARAN--%>
    <div class="box">
        <!-- /.box-header -->
        <div class="box-body">
            <table class="table table-bordered">
                <tr>
                    <th>Kode Buku</th>
                    <th>Judul Buku</th>
                    <th>ISBN</th>
                    <th>Nilai Buku(Rp)</th>
                    <th>Pembayaran Sebelumnya</th>
                    <th>Sisa</th>
                    <th>Pembayaran</th>
                    <th>Completed</th>
                </tr>
                <tr>
                    <td>002</td>
                    <td>Buku 002</td>
                    <td>12300098765232</td>
                    <td>85000</td>
                    <td>50000</td>
                    <td>35000</td>
                    <td>
                        <input type="text" value="35000" /></td>
                    <td>
                        <input type="checkbox" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td>Jumlah</td>
                    <td></td>
                    <td>85000</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
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
</asp:Content>

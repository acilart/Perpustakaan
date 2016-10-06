<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormAnggotaOff.aspx.cs" Inherits="PerpustakaanWeb.FormAnggotaOff" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="box box-info">
        <div class="box-header">
            <h2>FORM PENDAFTARAN ANGGOTA</h2>
        </div>
        <div class="box-body">
            <form action="/Anggota/Create" method="post">
                <input name="__RequestVerificationToken" type="hidden" value="wcv9Q8y4GQ_x4bT7YRs85r6txf4MRvFtu3KUuz2Zf9jrA5dDYWSR46ZvsMmytRd1fCGU-m_R6wTCMy2A89rYe-54x__sqULvGAnS1GBxXfI1" />
                <div class="form-horizontal">

                    <div class="form-group">
                        <label class="control-label col-md-2" for="KodeAnggota">Kode Anggota</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="KodeAnggota" name="KodeAnggota" type="text" value="" readonly/>
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
                        <label class="control-label col-md-2" for="IDProvinsi">Provinsi</label>
                        <div class="col-md-10">
                            <select class="form-control" data-val="true" data-val-number="The field IDProvinsi must be a number." id="IDProvinsi" name="IDProvinsi">
                                <option value="">Select Propinsi</option>
                                <option value="11">Aceh</option>
                                <option value="12">Sumatera Utara</option>
                                <option value="13">Sumatera Barat</option>
                            </select>
                            <span class="field-validation-valid text-danger" data-valmsg-for="IDProvinsi" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="IDKota">Kota</label>
                        <div class="col-md-10">
                            <select class="form-control" data-val="true" data-val-number="The field IDKota must be a number." id="IDKota" name="IDKota">
                                <option value="">Select Kota</option>
                            </select>
                            <span class="field-validation-valid text-danger" data-valmsg-for="IDKota" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="IDKecamatan">Kecamatan</label>
                        <div class="col-md-10">
                            <select class="form-control" data-val="true" data-val-number="The field IDKecamatan must be a number." id="IDKecamatan" name="IDKecamatan">
                                <option value="">Select Kecamatan</option>
                            </select>
                            <span class="field-validation-valid text-danger" data-valmsg-for="IDKecamatan" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="IDKelurahan">Kelurahan</label>
                        <div class="col-md-10">
                            <select class="form-control" data-val="true" data-val-number="The field IDKelurahan must be a number." id="IDKelurahan" name="IDKelurahan">
                                <option value="">Select Kelurahan</option>
                            </select>
                            <span class="field-validation-valid text-danger" data-valmsg-for="IDKelurahan" data-valmsg-replace="true"></span>
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
                            <input class="form-control text-box single-line" data-val="true" data-val-date="The field MasaBerlakuKartu must be a date." data-val-required="The MasaBerlakuKartu field is required." id="MasaBerlakuKartu" name="MasaBerlakuKartu" type="datetime" value="" />
                            <span class="field-validation-valid text-danger" data-valmsg-for="MasaBerlakuKartu" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="MasaBerlakuAnggota">Masa Berlaku Anggota</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" data-val="true" data-val-date="The field MasaBerlakuAnggota must be a date." data-val-required="The MasaBerlakuAnggota field is required." id="MasaBerlakuAnggota" name="MasaBerlakuAnggota" type="datetime" value="" />
                            <span class="field-validation-valid text-danger" data-valmsg-for="MasaBerlakuAnggota" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="CreatedOn">CreatedOn</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" data-val="true" data-val-date="The field CreatedOn must be a date." id="CreatedOn" name="CreatedOn" type="datetime" value="" />
                            <span class="field-validation-valid text-danger" data-valmsg-for="CreatedOn" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="CreatedBy">CreatedBy</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" data-val="true" data-val-number="The field CreatedBy must be a number." id="CreatedBy" name="CreatedBy" type="number" value="" />
                            <span class="field-validation-valid text-danger" data-valmsg-for="CreatedBy" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="ModifiedOn">ModifiedOn</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" data-val="true" data-val-date="The field ModifiedOn must be a date." id="ModifiedOn" name="ModifiedOn" type="datetime" value="" />
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

                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <input type="submit" value="Create" class="btn btn-default" />
                        </div>
                    </div>
                </div>
            </form>
            <div>
                <a href="#">Back to List</a>
            </div>

        </div>
    </div>

    <%--MODAL POP UP SIMPAN DISINI--%>

     <div class="box">
        <div class="box-header with-border">
            <h3 class="box-title">TOTAL TRANSAKSI</h3>
            <input type="submit" value="Edit" class="btn btn-primary" style="float: right;" />
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <table class="table table-bordered">
                <tr>
                    <th style="width: 13%">Iuran</th>
                    <th style="width: 50%">Masa Berlaku</th>
                    <th style="width: 20%">Jumlah</th>
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

    <script src="../Scripts/jquery-3.1.0.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script>
       

    </script>

</asp:Content>

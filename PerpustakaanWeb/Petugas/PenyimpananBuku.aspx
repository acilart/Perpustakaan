﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PenyimpananBuku.aspx.cs" Inherits="PerpustakaanWeb.Petugas.PenyimpananBuku1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="box box-info">
        <div class="box-header">
            <h2>Form Penyimpanan Buku</h2>
        </div>
        <div class="box-body">
            <form action="/Anggota/Create" method="post">
                <input name="__RequestVerificationToken" type="hidden" value="wcv9Q8y4GQ_x4bT7YRs85r6txf4MRvFtu3KUuz2Zf9jrA5dDYWSR46ZvsMmytRd1fCGU-m_R6wTCMy2A89rYe-54x__sqULvGAnS1GBxXfI1" />
                <div class="form-horizontal">

                     <div class="form-group">
                        <label class="control-label col-md-2" for="sumber">Sumber Buku</label>
                        <div class="col-md-10">
                             <td><select class="form-control" data-val="true" id="sumber" name="sumber">
                                <option value="">Penggantian</option>
                                 <option value="">Buku Baru</option>
                            </select></td>
                        </div>
                    </div>

                    <div class="form-group">                       
                        <label class="control-label col-md-2" for="NoRef">No Referensi</label>
                        <div class="input-group col-md-10">
                            <input class="form-control text-box single-line" id="NoRef" name="NoRef" type="text" value="" readonly/>
                            <span class="field-validation-valid text-danger" data-valmsg-for="NoRef" data-valmsg-replace="true"></span>
                            <span class="input-group-btn">
                                <button type="submit" name="search" id="search-btn" class="btn btn-flat" disabled>
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
                        <label class="control-label col-md-2" for="Tgl">Tanggal</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="Tgl" name="Tgl" type="date" value="" readonly />
                        </div>
                    </div>

                </div>
            </form>
        </div>
    </div>


    <%--JIKA MELAKUKAN LAPORAN KEHILANGAN--%>
    <div class="box">
        <div class="box-header with-border">
            <h3 class="box-title">Daftar Buku yang dilaporkan hilang</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <table class="table table-bordered">
                <tr>
                    <th style="width: 10%">Kode Buku</th>
                    <th style="width: 35%">Judul Buku</th>
                    <th style="width: 20%">ISBN</th>
                    <th style="width: 15%">Pengarang</th>
                    <th style="width: 10%">Nilai Buku(Rp)</th>
                    <th style="width: 10%">Lokasi</th>
                </tr>
                <tr>
                    <td>002</td>
                    <td>Buku 002</td>
                    <td>12300098765232</td>
                    <td>Pengarang Buku 002</td>
                    <td>85000</td>
                    <td>A-B1-K1</td>
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



    <%--JIKA INPUT BUKU BARU--%>
    <div class="box">
        <div class="box-header with-border">
            <input type="submit" value="Insert" class="btn btn-primary"/>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <table class="table table-bordered">
                <tr>
                    <th style="width: 10%">Kode Buku</th>
                    <th style="width: 35%">Judul Buku</th>
                    <th style="width: 20%">ISBN</th>
                    <th style="width: 15%">Pengarang</th>
                    <th style="width: 10%">Nilai Buku(Rp)</th>
                    <th style="width: 10%">Lokasi</th>
                </tr>
                <tr>
                    <td>999</td>
                    <td>Buku 002</td>
                    <td>12300098765232</td>
                    <td>Pengarang Buku 002</td>
                    <td>85000</td>
                    <td>A-B1-K1</td>
                </tr>
                <tr>
                    <td></td>
                    <td>Jumlah</td>
                    <td></td>
                    <td></td>
                    <td>85000</td>
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
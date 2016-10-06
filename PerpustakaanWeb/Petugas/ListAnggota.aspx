<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListAnggota.aspx.cs" Inherits="PerpustakaanWeb.Petugas.ListAnggota" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="box">
        <div class="box-header with-border">

            <div class="box-header">
                <div class="col-md-10">
                <h3 class="box-title">Daftar Anggota</h3>
                
                    <select class="form-control" data-val="true" id="idFilter" name="Filter" style="width: 150px;">
                        <option value="">Nama Anggota</option>
                    </select>
                </div>

                <div class="box-tools">
                    
                    <div class="input-group input-group-sm" style="width: 150px;">
                        <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">
                        <div class="input-group-btn">
                            <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <table class="table table-bordered">
                <tr>
                    <th style="width: 5%">No</th>
                    <th style="width: 10%">Kode Buku</th>
                    <th style="width: 35%">Nama Anggota</th>
                    <th style="width: 20%">No Telp</th>
                    <th style="width: 15%">Email</th>
                    <th style="width: 15%">Action</th>
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
</asp:Content>

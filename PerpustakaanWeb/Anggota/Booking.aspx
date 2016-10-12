<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="PerpustakaanWeb.Anggota.Booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/Zebra_Datepicker-master/public/css/metallic.css" rel="stylesheet" />


    <div class="panel panel-primary">
        <div class="panel-heading">
            <h2>Booking Buku Online</h2>
        </div>
        <div class="panel-body">
            <div class="form-horizontal col-md-9 col-md-offset-3">

                <div class="form-group">
                    <label class="col-md-3">Nama </label>
                    <input class="col-md-9 form-control" type="text" id="txt-nama" placeholder="Nama" readonly="readonly" />
                </div>
                <div class="form-group">
                    <label class="col-md-3">No Booking</label>
                    <input class="col-md-9 form-control" type="text" id="txt-no-booking" placeholder="no Booking" />
                </div>
                <div class="form-group">
                    <label class="col-md-3">Tgl Booking</label>
                    <input class="col-md-9 form-control" type="text" id="txt-tgl-booking" readonly="readonly" />
                </div>

                <div class="form-group">
                    <label class="col-md-3">Tgl Pinjam</label>
                    <input class="col-md-9 form-control tgl-pinjam" type="text" id="txt-tgl-pinjam" placeholder="No Booking" />
                </div>
            </div>

            <div class="form-horizontal">
                <div class="form-group col-md-2">
                    <input type="button" id="btn-tambah" class="btn btn-primary" value="Tambah Booking"/>
                </div>
                <table class="table table-bordered col-md-8">
                    <thead>
                        <tr>
                            <td>Kode Buku</td>
                            <td>Judul Buku</td>
                            <td>Pengarang</td>
                            <td>Action</td>
                        </tr>
                    </thead>
                    <tbody id="tbl-list-booking">
                    </tbody>
                </table>
            </div>

        </div>

       

       
      
    </div>

   
    <script src="../Content/Zebra_Datepicker-master/public/javascript/zebra_datepicker.js"></script>

    <script>

        var currentdates;

        $('#txt-tgl-pinjam').Zebra_DatePicker({
            format: 'd-m-Y',


            direction: [currentdates, false]
        });

        function CurrentDate() {

            
            var currentTime = new Date();
            var month = currentTime.getMonth() + 1;
            var day = currentTime.getDate();
            var year = currentTime.getFullYear();
            var date = day + "-" + month + "-" + year;
            currentdate = year + "-" + month + "-" + day;
            $("#txt-tgl-booking").val(date);
        }

        $(document).ready(function () {
            CurrentDate();

            // assuming the controls you want to attach the plugin to
            // have the "datepicker" class set
            $('input.datepicker').Zebra_DatePicker();

        });






    </script>

    
</asp:Content>

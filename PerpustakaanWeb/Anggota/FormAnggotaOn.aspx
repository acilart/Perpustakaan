<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormAnggotaOn.aspx.cs" Inherits="PerpustakaanWeb.Anggota.FormAnggotaOn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="panel panel-primary">
        <div class="panel-heading">
            <h2>Registrasi Anggota Online</h2>
        </div>
        <div class="panel-body">
            <div class="form-horizontal col-md-6">
                <%-- form kode anggota --%>
                <div class="form-group">
                    <label class="col-md-3">Kode Anggota </label>
                    <input class="col-md-9 form-control " type="text" id="txt-kode-anggota" placeholder="Kode Anggota" readonly="readonly" />
                </div>
                <div class="form-group">
                    <label class="col-md-3">Nama </label>
                    <input class="col-md-9 form-control" type="text" id="txt-nama" placeholder="Nama" maxlength="50" />
                </div>
                <div class="form-group">
                    <label class="col-md-3">Alamat </label>
                    <input class="col-md-9 form-control" type="text" id="txt-alamat" placeholder="Alamat" />
                </div>
                <div class="form-group">
                    <label class="col-md-3">Provinsi</label>
                    <select class="form-control" id="dpropinsi" style="width: 49%;">
                        <option value="a">---pilih---</option>
                    </select>
                </div>

                <div class="form-group">
                    <label class="col-md-3">Kota </label>
                    <select class="form-control" id="dkota" style="width: 49%;" disabled>
                        <option value="0">---pilih---</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="col-md-3">Kecamatan </label>
                    <select class="form-control" id="dkecamatan" style="width: 49%;" disabled>
                        <option value="0">---pilih---</option>
                    </select>

                </div>

            </div>
            <div class="form-horizontal col-md-6">
                <div class="form-group">
                    <label class="col-md-3">Email </label>
                    <input type="text" class="col-md-9 form-control numbersOnly" id="txt-email" placeholder="Email" />
                </div>
                <div class="form-group">
                    <label class="col-md-3">No Telepon </label>

                    <input type="text" id="txt-telp" class="form-control col-md-9" placeholder="No Telepon" maxlength="12" />
                </div>
                <div class="form-group">
                    <label class="col-md-3">Username</label>
                    <input type="text" id="txt-username" placeholder="Username" class="form-control col-md-9" />
                </div>
                <div class="form-group">
                    <label class="col-md-3">Password </label>
                    <input type="password" id="txt-password" class=" form-control col-md-9" placeholder="password" />
                </div>
                <div class="form-group">
                    <label class="col-md-3">Confirm Password </label>
                    <input type="password" id="txt-cpassword" class=" form-control col-md-9" placeholder="Confirm password" />
                </div>
                <div class="col-md-offset-6">
                    <input type="button" value="Clear" class="btn btn-primary" id="btn-clear" />
                    <input type="button" value="Save" class="btn btn-primary" id="btn-save" />
                </div>
            </div>
        </div>
    </div>


    <script>

        //-----fungsi agar hanya nomor saya yang bisa di inputkan 
        function NumberOnly(e) {
            // backspace, delete, tab, escape, enter and .
            if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||

                //Ctrl+A, Command+A
                (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) ||
                //home, end, left, right, down, up
                (e.keyCode >= 35 && e.keyCode <= 40)) {
                // let it happen, don't do anything
                return;
            }
            // Ensure that it is a number and stop the keypress
            if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                e.preventDefault();

            }
        }

        function HurufOnly(e) {
            // Allow: backspace, delete, tab, escape, enter and .
            if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190, 32]) != -1 ||
                // Allow: Ctrl+A, Command+A
                (e.keyCode == 65 && (e.ctrlKey == true || e.metaKey == true)) ||
                // Allow: home, end, left, right, down, up
                (e.keyCode >= 35 && e.keyCode <= 40) ||

                //membolehkan huruf Besar
                (e.keyCode >= 65 && e.keyCode <= 90) ||
                //membolehkan huruf besar + shift
                ((e.keyCode >= 65 && e.keyCode <= 90) && e.shiftKey == true)

                //membolehkan huruf kecil 
                || ((e.keyCode >= 97 && e.keyCode <= 122))

                //membolehkan huruf kecil+shift
                || ((e.keyCode >= 97 && e.keyCode <= 122) && e.shiftKey == true)

            ) {
                // let it happen, don't do anything
                return;

            }
            else {

                e.preventDefault();

            }


        }

        $(document).ready(function () {
            $("#txt-telp").keydown(function (e) {
                NumberOnly(e);
            });

            $("#txt-nama").keydown(function (e) {
                HurufOnly(e);
            });

            loadPropinsi();

        });


        function clearfield() {

            $("#txt-kode-anggota").val('');
            $("#txt-nama").val('');
            $("#txt-alamat").val('');
            $("#txt-nama").val('');

            $("#dkecamatan").val('--pilih--');
            $("#dkota").val('--pilih--');
            $("#dpropinsi").val('--pilih--');


            $("#txt-email").val('');
            $("#txt-telp").val('');
            $("#txt-username").val('');
            $("#txt-password").val('');
            $("#txt-cpassword").val('');

        }



        function saveAnggota() {
            var anggotaa = {};
            anggotaa.NoTelepon = $("#txt-telp").val();
            anggotaa.Nama = $("#txt-nama").val();
            anggotaa.Alamat = $("#txt-alamat").val();
            anggotaa.Email = $("#txt-email").val();
            anggotaa.IDProvinsi = $("#dpropinsi").val();
            anggotaa.IDKota= $("#dkota").val();
            anggotaa.IDKecamatan= $("#dkecamatan").val();


            $.ajax({
                type: "POST",
                url: "../Service/AnggotaOnline.asmx/simpanAnggota",
                data: '{anggota: ' + JSON.stringify(anggotaa) + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    alert("Member has Been add successfully.");

                }
            });

        }


         
        $("#dpropinsi").click(function () {

            $("#dkota").removeAttr('disabled');
            $("#dkecamatan").removeAttr('disabled');
            loadKota();

        });

        $("#dkota").click(function () {

            loadKecamatan();
        });

        function loadPropinsi() {

            $.ajax({
                url: "../Service/AnggotaOnline.asmx/getPropinsi",
                contentType: "application/json; charset=utf-8",
                type: "POST",
                dataType: "json",
                success: function (id) {
                    var out = "";
                    $.each(id.d, function (index, item) {

                        out += '<option value="' + item.ID + '">' + item.NamaProvinsi + '</option>';
                    });
                    $('#dpropinsi').html(out);
                }
            });

        }


        function loadKota() {

            var propinsi = $("#dpropinsi").val();
            $.ajax({
                url: "../Service/AnggotaOnline.asmx/getKota",
                data: '{id: ' + JSON.stringify(propinsi) + '}',
                contentType: "application/json; charset=utf-8",
                type: "POST",
                dataType: "json",
                success: function (id) {
                    var out = "";
                    $.each(id.d, function (index, item) {

                        out += '<option value="' + item.ID + '">' + item.NamaKota + '</option>';
                    });
                    $('#dkota').html(out);
              
                }
            });
        }

        function loadKecamatan() {

            var kota = $("#dkota").val();


            $.ajax({
                url: "../Service/AnggotaOnline.asmx/getKecamatan",
                data: '{id:' + JSON.stringify(kota) + '}',
                contentType: "application/json; charset=utf-8",
                type: "POST",
                dataType: "json",
                success: function (id) {
                    var out = "";
                    $.each(id.d, function (index, item) {

                        out += '<option value="' + item.ID + '">' + item.NamaKecamatan + '</option>';
                    });
                    $('#dkecamatan').html(out);
                }
            });
        }


        $('#btn-clear').click(function () {
            clearfield();
        });



        $('#btn-save').click(function () {
            var password = $("#txt-password").val();
            var cpassword = $("#txt-cpassword").val();

            if (password == cpassword) {
                saveAnggota();
                clearfield();
                loadPropinsi();

            } else {
                $("#txt-password").val('');
                $("#txt-cpassword").val('');
                alert('Password harus sama');
            }

            return false;

        });


    </script>

</asp:Content>

<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="LoginAnggota.aspx.cs" Inherits="PerpustakaanWeb.Login" %>
<!DOCTYPE html>
<html xmlns="">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Create - My ASP.NET Application</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="dist/css/font/font-awesome.min.css" />
    <!-- Ionicons -->
    <link rel="stylesheet" href="dist/css/ionicons.min.css" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="dist/css/AdminLTE.css" rel="stylesheet" />
    <link href="dist/css/skins/_all-skins.css" rel="stylesheet" />
    <%--<script src="dist/js/jquery-1.9.1.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>--%>
    <script src="Scripts/modernizr-2.6.2.js"></script>

</head>
<body class="hold-transition login-page">

    <%--1.LOGOUT & CLEAR SESSION--%>

    <div class="login-box">
        <div class="login-logo">
            <a href="#"><b>Admin</b>LTE</a>
        </div>
        <!-- /.login-logo -->
        <div class="login-box-body">
            <p class="login-box-msg">Sign in to start your session</p>


            <form id="formLogin"  method="POST" action="#">
                <select class="form-control" id="dlogin">
                    <option value="Petugas">Petugas</option>
                    <option value="Anggota">Anggota</option>
                </select><br />
                <br />

                <div class="form-group has-feedback">
                    <input type="email" class="form-control" id="email-id" placeholder="Email" required/>
                    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" class="form-control" id="pass-id" placeholder="Password" required/>
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>
                <div class="row">
                    <div class="col-xs-8">
                        <div class="checkbox icheck">
                            <label>
                                <input type="checkbox" />
                                Remember Me
                            </label>
                        </div>
                    </div>
                    <!-- /.col -->
                    <div class="col-xs-4">
                        <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
                    </div>
                    <!-- /.col -->
                </div>
            </form>

            <a href="/Anggota/FormAnggotaOn" class="text-center">Register a new membership</a>

        </div>
        <!-- /.login-box-body -->
    </div>
    <!-- /.login-box -->
    <script src="/Scripts/jquery-1.10.2.min.js"></script>
    <script src="/Scripts/bootstrap.min.js"></script>
    <script src="/dist/js/jquery.validate.js"></script>
    <script>

        //$("#formLogin").submit(function (e) {
        //    e.preventDefault();
        //    var LogId = $('#dlogin').val();

        //    alert("adasd");
        //})

        $(document).ready(function () {
            $("#formLogin").validate({
                rules: {
                    email: {
                        required: true,
                        email: true
                    },
                    password: {
                        required: true,
                        password : true

                    },
                },
                messages: {
                    email: "Please enter a valid email address",
                    password: "huahua",
                }

            });


            $("#formLogin").submit(function (e) {
                e.preventDefault();
                var LogId = $('#dlogin').val();

                if (LogId == 'Petugas') {
                    cekPassPetugas();
                }
                else {
                    cekPassAnggota();
                }
            })
            
            $("#email-id").val(''); // BIAR VALUE NYA KOSONG
            $("#pass-id").val(''); 
            $.ajax({
                url: '../Service/LoginService.asmx/RemoveSession',
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {
                    if (response.d) {
                        alert("You're logout");
                    } else {
                        alert("Welcome");
                    }
                }
            });

        })
        //---------------------------------LOGIN------------------------------//

        function cekPassPetugas() {
            var username = $("#email-id").val();
            var password = $("#pass-id").val();
            var param = { email: username, password: password};

            $.ajax({
                url: '../Service/LoginService.asmx/GetPetugasByEmailPass',
                data: JSON.stringify(param),
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    if (data.d != null) {
                        location.href = "/Petugas/Home";
                    } else {
                        location.href = "/LoginAnggota";
                        alert("Username/Password salah");
                    }
                }
            });
        }

        function cekPassAnggota() {
            var username = $("#email-id").val();
            var password = $("#pass-id").val();
            var param = { email: username, password: password };
            $.ajax({
                url: '../Service/LoginService.asmx/GetAnggotaByEmail',
                data: JSON.stringify(param),
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    if (data.d) {
                        location.href = "/Anggota/Home";
                    } else {
                        location.href = "/LoginAnggota";
                        alert("Username/Password salah");
                    }
                }
            });
        }


    </script>
</body>
</html>

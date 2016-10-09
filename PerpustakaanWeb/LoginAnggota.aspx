<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="LoginAnggota.aspx.cs" Inherits="PerpustakaanWeb.Login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
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
    <script src="dist/js/jquery-1.9.1.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
    <script src="Scripts/modernizr-2.6.2.js"></script>

</head>
<body class="hold-transition login-page">
    <div class="login-box">
        <div class="login-logo">
            <a href="../../index2.html"><b>Admin</b>LTE</a>
        </div>
        <!-- /.login-logo -->
        <div class="login-box-body">
            <p class="login-box-msg">Sign in to start your session</p>


            <form action="#" method="post">
                <select class="form-control" id="dlogin">
                    <option value="Petugas">Petugas</option>
                    <option value="Anggota">Anggota</option>
                </select><br />
                <br />

                <div class="form-group has-feedback">
                    <input type="email" class="form-control" id="email-id" placeholder="Email" />
                    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" class="form-control" id="pass-id" placeholder="Password" />
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
                        <button type="submit" id="login" onclick="??????" class="btn btn-primary btn-block btn-flat">Sign In</button>
                    </div>
                    <!-- /.col -->
                </div>
            </form>

            <a href="#">I forgot my password</a><br>
            <a href="register.html" class="text-center">Register a new membership</a>

        </div>
        <!-- /.login-box-body -->
    </div>
    <!-- /.login-box -->
    <script src="../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script>

        //---------------------------------LOGIN------------------------------//

        $('#dlogin').change(function () {
            var LogId = $('#dlogin').val();

            if (LogId == 'Petugas') {
                cekPassPetugas();
            }
            else {
                cekPassAnggota();
            }
        })

        function cekPassPetugas() {
            var username = $("#email-id").val();
            var password = $("#pass-id").val();
            $.ajax({
                url: '../Service/LoginService.asmx/GetPetugasByEmailPass',
                data: '"username":"' + username + '"password":"' + password + '"}',
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    if (data.d) {
                        location.href = "~/Anggota/FormAnggotaOff";
                    } else {
                        location.href = "www.gmail.com";
                    }
                }
            });
        }

        function cekPassAnggota() {
            var username = $("#email-id").val();
            var password = $("#pass-id").val();
            $.ajax({
                url: '../Service/LoginService.asmx/GetAnggotaByEmail',
                data: '"username":"' + username + '"password":"' + password + '"}',
                type: 'POST',
                dataType: 'JSON',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    if (data.d) {
                        location.href = "~/Anggota/FormAnggotaOn";
                    } else {
                        location.href = "www.gmail.com";
                    }
                }
            });
        }

    </script>
</body>
</html>

<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterPetugas.Master" AutoEventWireup="true" CodeBehind="FormPetugasEdit.aspx.cs" Inherits="PerpustakaanWeb.Petugas.FormPetugasEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <% if (HttpContext.Current.Session["Email"] != null && HttpContext.Current.Session["ID"] != null && HttpContext.Current.Session["Role"].ToString() == "petugas")
        { %>

    <div class="box box-info">
      <div class="box-header">
            <h2>Ubah Data Petugas</h2>
        </div>
        <div class="box-body">
             <form action="#" method="post" id="formPetugas">
                <div class="form-horizontal">
                    <input id="PetugasId" type="hidden">
                    <div class="form-group">
                        <label class="control-label col-md-2" for="KodePetugas">Kode Petugas</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="KodePetugas" name="KodePetugas" type="text" value=""/>
                            <span class="field-validation-valid text-danger" data-valmsg-for="KodePetugas" data-valmsg-replace="true"></span>
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
                        <label class="control-label col-md-2" for="Email">Email</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="Email" name="Email" type="text" value="" />
                            <span class="field-validation-valid text-danger" data-valmsg-for="Email" data-valmsg-replace="true"></span>
                        </div>
                    </div>

                     <div class="form-group">
                        <label class="control-label col-md-2" for="Password">Password</label>
                        <div class="col-md-10">
                            <input class="form-control text-box single-line" id="Password" name="Password" type="text" value="" />
                            <span class="field-validation-valid text-danger" data-valmsg-for="Password" data-valmsg-replace="true"></span>
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
                        <div class="box-footer clearfix" style="float: right;">
                            <button type="button" id="btn-save" class="btn btn-success">Save</button>
                        </div>
                    </div>  
                    </div>    
        </div>
        </div>
    <script src="../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script>
        
        $(document).ready(function () {
            id = '<%= Session["ID"] %>';
            ChooseId(id)
        });
        

        function ChooseId(id) {
            $.ajax({
                url: '../Service/PetugasService.asmx/GetPetugasByID',
                type: 'POST',
                data: '{"id":"' + id + '"}',
                dataType: 'JSON',
                contentType: 'application/json;charset=utf-8',
                success: function (data) {
                    $("#PetugasId").val(id);
                    $("#KodePetugas").val(data.d.Kode);
                    $("#Nama").val(data.d.Nama);
                    $("#Alamat").val(data.d.Alamat);
                    $("#Email").val(data.d.Email);
                    $("#Password").val(data.d.Password);
                    $("#NoTelepon").val(data.d.NoTelepon);
                }
            });
        }

        $('#btn-save').click(function () {
            var petugas = {};
            petugas.ID = $("#PetugasId").val();
            petugas.Kode = $("#KodePetugas").val();
            petugas.Nama = $("#Nama").val();
            petugas.Alamat = $("#Alamat").val();
            petugas.Email = $("#Email").val();
            petugas.Password = $("#Password").val();
            petugas.NoTelepon = $("#NoTelepon").val();

            $.ajax({
                url: '../Service/PetugasService.asmx/InsertPetugas',
                data: '{baru:' + JSON.stringify(petugas) + '}',
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                dataType: 'JSON',
                success: function (response) {
                    alert("Data has been saved successfully.");
                    window.location.reload();
                }
            });
            return false;

        })



    </script>
    <%
      }
        else
        {
            Response.Redirect("../LoginAnggota.aspx");
        }
                    %>
</asp:Content>

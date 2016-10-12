<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contoh1.aspx.cs" Inherits="PerpustakaanWeb.List.contoh1" %>

<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	<table border="1" >
		<thead>
			<th>Kode Buku</th>
			<th>Judul Buku</th>
			<th>Nilai Buku</th>
			<th>Pembayaran Sebelumnya</th>
			<th>Sisa</th>
			<th>Pembayaran</th>
			<th>Completed</th>
		</thead>
		<tbody id="cihuy">
			<tr>
				<td>002</td>
				<td>Piko</td>
				<td>12312312</td>
				<td>80000</td>
				<td>3</td>
				<td><input type="hidden" name="bayar" value="bbb"></td>
				<td><input id="cb002" type="checkbox" name=""></td>
			</tr>
			<tr>
				<td>003</td>
				<td>Ijay</td>
				<td>12312312</td>
				<td>7777000</td>
				<td>3</td>
				<td><input type="hidden" name="bayar" value="aaa"></td>
				<td><input id="cb003" type="checkbox" name=""></td>
			</tr>
		</tbody>
	</table>
	<button onClick='yuhu()'>Save</button>
</body>

    <script src="../Scripts/jquery-1.10.2.js"></script>
    <script src="../Scripts/bootstrap.js"></script>
    <script>
	function yuhu(){
		var list=[];
		$("#cihuy tr").each(function () {
		    var data = {
		        completed: false
		    };
		    var cek = $('#cb' + $(this).find("td:nth-child(1)").text()).is(":checked");
            data.kode = $(this).find("td:nth-child(1)").text();
			data.judul = $(this).find("td:nth-child(2)").text();
			data.nilai = $(this).find("td:nth-child(3)").text();
			data.pemb_sebelum = $(this).find("td:nth-child(4)").text();
			data.sisa = $(this).find("td:nth-child(5)").text();
			data.pembayaran = $(this).find("td:nth-child(6)").find("input[type=hidden]").val();
		    //data.completed = $(this).find("td:nth-child(7)").find("input[type=checkbox]").attr("checked");
			data.completed = cek;
			list.push(data);
		});
		alert(list[0].pembayaran);
		console.log(list);
	}
</script>
</html>

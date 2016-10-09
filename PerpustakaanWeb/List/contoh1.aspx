<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contoh1.aspx.cs" Inherits="PerpustakaanWeb.List.contoh1" %>

<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	<table border="1" id="cihuy">
		<thead>
			<th>Kode Buku</th>
			<th>Judul Buku</th>
			<th>Nilai Buku</th>
			<th>Pembayaran Sebelumnya</th>
			<th>Sisa</th>
			<th>Pembayaran</th>
			<th>Completed</th>
		</thead>
		<tbody>
			<tr>
				<td>002</td>
				<td>Piko</td>
				<td>12312312</td>
				<td>80000</td>
				<td>3</td>
				<td><input type="text" name="bayar"></td>
				<td><input type="checkbox" name=""></td>
			</tr>
			<tr>
				<td>003</td>
				<td>Ijay</td>
				<td>12312312</td>
				<td>7777000</td>
				<td>3</td>
				<td><input type="text" name="bayar"></td>
				<td><input type="checkbox" name=""></td>
			</tr>
		</tbody>
	</table>
	<button onClick='yuhu()'>Save</button>
</body>

<script type="text/javascript" src="jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	function yuhu(){
		var list=[];

		$("#cihuy").find('> tbody > tr').each(function () {
			var data = {
				kode : "",
				judul: "",
				nilai: 0,
				pemb_sebelum  : 0,
				sisa : 0,
				pembayaran : 0,
				completed : 0
			};
			
			data.kode = $(this).find('td:nth-child(1)').text();
			data.judul = $(this).find('td:nth-child(2)').text();
			data.nilai = $(this).find('td:nth-child(3)').text();
			data.pemb_sebelum = $(this).find('td:nth-child(4)').text();
			data.sisa = $(this).find('td:nth-child(5)').text();
			data.pembayaran = $(this).find('td:nth-child(6)').find('input[type=text]').val();
			data.completed = $(this).find('td:nth-child(7)').find('input[type=checkbox]').val();
			
			list.push(data);

		});

		console.log(list);
	}
</script>
</html>

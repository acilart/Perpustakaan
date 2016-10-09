<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contoh2.aspx.cs" Inherits="PerpustakaanWeb.List.contoh2" %>

<!DOCTYPE html>
<html>
<head>
	<title></title>
	<script type="text/javascript" src="jquery-2.1.4.min.js"></script>
</head>
<body>


<table id="tabelBuku">
	<!--header-->
	<tr>
		<th>Kode Buku</th> <th>Judul Buku</th><th>Nilai Buku</th>
	</tr>
	<!--.header-->

	<!--body-->
	<tr>
		<td>1234</td><td>Judul 1</td> <td>250000</td>
	</tr>
	<tr>
		<td>2345</td><td>Judul 2</td> <td>12500</td>
	</tr>
	<tr>
		<td>3456</td><td>Judul 3</td><td>30000</td>
	</tr>
	<tr>
		<td>4567</td><td>Judul 4</td><td>40000</td>
	</tr>
	<!--.body-->
	
</table>
<hr/>
	<button onclick="getDataTable();">Action</button>

<div id="result">
	
</div>
</body>
</html>

<script type="text/javascript">
function getDataTable(){
	var tabelBuku = document.getElementById('tabelBuku'); //get tabel buku
	var rows = tabelBuku.getElementsByTagName('tr'); //get semua tr. hasilnya adalah array of tr
	var buku,dataBuku=[];
	var columns;
	//awalnya 1 karena 0 untuk header. data dimulai dari index ke-1
	for (var i = 1; i<rows.length;i++) {
		columns = rows[i].getElementsByTagName('td'); //get semua column dalam satu tr
		buku = {kode_buku:columns[0].innerHTML, judul_buku:columns[1].innerHTML, nilai_buku:columns[2].innerHTML}; //get satu data buku
		dataBuku.push(buku); //seluruh data buku dimasukan ke variabel dataBuku
	}

	var divResult=document.getElementById("result");
	for(var i =0; i<dataBuku.length;i++){
		divResult.innerHTML+=dataBuku[i].kode_buku+",";
		divResult.innerHTML+=dataBuku[i].judul_buku+",";
		divResult.innerHTML+=dataBuku[i].nilai_buku+"<br>";
	}
}
</script>
<?php

	$host ="localhost";
	$user ="root";
	$pass ="";

	$con=mysqli_connect($host,$user,$pass)or die("Error al conectar");
	mysqli_select_db($con,'baseformularios')or die("No pudo conectar con la base de datos Error");

	$nom=$_POST["Nombre"];
	$app=$_POST["ApeidoPaterno"];
	$apm=$_POST["ApeidoMaterno"];
	$cor=$_POST["Correo"];
	$ejecuta=mysqli_query($con,"insert into informacion (Nombre,ApeidoPaterno,ApeidoMaterno,Correo) values ('$nom','$app','$apm','cor')");

	if (!$ejecuta) {
		echo "no se pudo insertar los datos en el formulario";
	}
	else{
		echo "los datos fueron insertados";
	}

?>
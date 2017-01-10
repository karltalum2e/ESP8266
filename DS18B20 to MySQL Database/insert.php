 <?php
	$mysqli = new mysqli("localhost", "root", "password", "tempdatabase");
	$temp = $_GET["temp"];
	$stmt= $mysqli->prepare("INSERT INTO tempdatabase (temptable) VALUES (?)");
	$stmt->bind_param("d", $temp);
	$stmt->execute();	
?>
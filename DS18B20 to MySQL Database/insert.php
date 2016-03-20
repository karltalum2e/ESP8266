 <?php
	$mysqli = new mysqli("localhost", "root", "password", "database name");
	$temperature = $_GET["temperature"];
	$stmt= $mysqli->prepare("INSERT INTO temperature (temperature) VALUES (?)");
	$stmt->bind_param("d", $temperature);
	$stmt->execute();	
?>
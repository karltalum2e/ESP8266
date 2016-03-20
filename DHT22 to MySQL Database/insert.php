 <?php
	$mysqli = new mysqli("localhost", "root", "password", "databse name");
	$temperature = $_GET["temperature"];
	$stmt= $mysqli->prepare("INSERT INTO temperature (temperature) VALUES (?)");
	$stmt->bind_param("d", $temperature);
	$stmt->execute();
		
	$humidity = $_GET["humidity"];		
	$stmt= $mysqli->prepare("INSERT INTO humidity (humidity) VALUES (?)");
		$stmt->bind_param("i", $humidity);
		$stmt->execute();			
?>
<?php

// Mysql Setup
$servername = "localhost";
$username = "user";
$password = "pass";
$dbname = "dbname";
$tablename = "tablename";

// Variables
$Uuid = $_GET['Uuid'];
$Objectname = $_GET['Objectname'];
$Image = $_GET['Image'];
$Type = $_GET['Type'];
$Simname = $_GET['Simname'];
$Prims = $_GET['Prims'];
$Price = $_GET['Price'];
$Slurl = $_GET['Slurl'];
$Method = $_GET['Method'];
$Securekey = $_GET['Securekey'];

// Securekey
if ($Securekey != "Lu4LGYu4RLtvR3mP") exit();

if ($Method == "add")
{
	// Converting image url to html element
	$Imagesrc = "<img src=\"$Image\" height=\"100px\">";

	// Converting SLURL to html element
	$Simnameurl = str_replace(' ', '%20', $Simname);
	$Slurlformated = "<a type=\"button\" target=\"_blank\" href=\"http://slurl.com/secondlife/$Simnameurl/$Slurl\" class=\"btn btn-warning\" style=\"display: block; width: 100%;\"><b>Teleport</b></a>";

	// Create connection
	$conn = mysqli_connect($servername, $username, $password, $dbname);
	if (!$conn) {
		die("Connection failed: " . mysqli_connect_error());
	}

	// Sending Query
	$sql = "REPLACE INTO $tablename (Image, Type, Simname, Objectname, Prims, Price, Uuid, Slurl )
	VALUES ('$Imagesrc', '$Type', '$Simname', '$Objectname', '$Prims', '$Price', '$Uuid', '$Slurlformated')";

	// Catching errors
	if (mysqli_query($conn, $sql)) {
		echo "New record created successfully";
	} else {
		echo "Error: " . $sql . "<br>" . mysqli_error($conn);
	}

	// Closing connection
	mysqli_close($conn);
}

else if ($Method == "remove")
{
	// Create connection
	$conn = mysqli_connect($servername, $username, $password, $dbname);
	if (!$conn) {
		die("Connection failed: " . mysqli_connect_error());
	}

	// Sending Query
	$sql = "DELETE FROM $tablename WHERE Uuid='$Uuid'";

	// Catching errors
	if (mysqli_query($conn, $sql)) {
		echo "Record deleted successfully";
	} else {
		echo "Error deleting record: " . mysqli_error($conn);
	}

	// Closing connection
	mysqli_close($conn);
}

else if ($Method == "Checkstamps")
{
	// Create connection
	$conn = mysqli_connect($servername, $username, $password, $dbname);
	if (!$conn) {
		die("Connection failed: " . mysqli_connect_error());
	}

	// Sending Query
	$sql = "DELETE FROM SNO WHERE timestamp < DATE_SUB(NOW(), INTERVAL 1 MINUTE);";

	// Catching errors
	if (mysqli_query($conn, $sql)) {
		echo "Old records deleted successfully";
	} else {
		echo "Error deleting record: " . mysqli_error($conn);
	}

	// Closing connection
	mysqli_close($conn);
}

?>
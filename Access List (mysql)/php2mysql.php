<?php

// Mysql Setup
$servername = "localhost";
$username = "username";
$password = "password";
$dbname = "dbname";
$tablename = "accesslist";

// Variables
$uuid = $_GET['uuid'];
$acces = $_GET['acces'];

// Make a MySQL Connection
mysql_connect($servername, $username, $password) or die(mysql_error());
mysql_select_db($dbname) or die(mysql_error());

// Get a specific result from the "example" table
$result = mysql_query("SELECT * FROM $tablename
 WHERE Uuid='$uuid'") or die(mysql_error());  

// get the first (and hopefully only) entry from the result
$row = mysql_fetch_array( $result );

// Print out the contents of each row into a table 
$resultarray = explode(",",$row['Acces']);

if (in_array($acces, $resultarray)) {
    echo "TRUE";
}
else {
	echo "FALSE";
}

?>
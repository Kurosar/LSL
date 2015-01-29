<?php

$time = $_GET['time'];
$avatars = $_GET['avatars'];
$regionname = $_GET['regionname'];
$dil = $_GET['dil'];
$server = $_GET['server'];
$fps = $_GET['fps'];
$method = $_GET['method'];
$securekey = $_GET['securekey'];

$time = $time*1000;

if ($securekey != "Lu4LGYu4RLtvR3mP") exit();

if ($method == "add")
{
	// AVATARS Logging
	$entry_line = "[$time, $avatars],";
	$fp = fopen("_avatars.txt", "a");
	fputs($fp, $entry_line);
	fclose($fp);
	// DIL Logging
	$entry_line = "[$time, $dil],";
	$fp = fopen("_dil.txt", "a");
	fputs($fp, $entry_line);
	fclose($fp);
	// FPS Logging
	$entry_line = "[$time, $fps],";
	$fp = fopen("_fps.txt", "a");
	fputs($fp, $entry_line);
	fclose($fp);
	
	// REGIONNAME Logging
	if (filesize("_regionname.txt") == 0)
	{
		$entry_line = "$regionname";
		$fp = fopen("_regionname.txt", "a");
		fputs($fp, $entry_line);
		fclose($fp);
	}
	// SERVER Logging
	if (filesize("_server.txt") == 0)
	{
		$entry_line = "$server";
		$fp = fopen("_server.txt", "a");
		fputs($fp, $entry_line);
		fclose($fp);
	}
}

else if ($method == "clear")
{
	$fp = fopen("_avatars.txt", "w");
	fclose($fp);
	$fp = fopen("_dil.txt", "w");
	fclose($fp);
	$fp = fopen("_fps.txt", "w");
	fclose($fp);
	$fp = fopen("_regionname.txt", "w");
	fclose($fp);
	$fp = fopen("_server.txt", "w");
	fclose($fp);
}

?>
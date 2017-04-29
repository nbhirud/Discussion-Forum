<?php
DEFINE('DB_HOST','localhost');
DEFINE('DB_NAME','project');
DEFINE('DB_USER','root');
DEFINE('DB_PASSWORD','password');

$dbc =  @mysqli_connect("localhost","root","password","project") OR die('Could not connect to MySQL'. mysqli_connect_error());
session_start();

?>
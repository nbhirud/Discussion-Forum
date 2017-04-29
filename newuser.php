<html>
<head>
<title>SIGN UP</title>
<link rel="stylesheet" type="text/css" href="/db/css/login.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<style>
video { 
  -webkit-transform: scaleX(4.4); 
  -moz-transform: scaleX(4.4);
}
</style>
</head>

<body>
<form action="http://localhost/db/check_data.php" method="post">

<?php

	echo '<h5>Enter your name:<input type= "text" name="sname"</h5>
		  <h5>Enter your Student ID:<input type="text" name="sid"></h5>
		  <h5>Enter your Major:<input type="text" name="major"></h5>
		  <h5>Enter your username:<input type="text" name="uname"></h5>
		  <h5>Enter your password:<input type="password" name="pass"></h5>
		  <input type="submit" name="submit">';

?>
</form>
</body>
</html>
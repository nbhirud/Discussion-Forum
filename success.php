<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title> Discussion Forum</title>
</head>

<body>
<form action ="http://localhost/db/comment.php" method="POST">
<?php

	if(isset($_POST['submit']))
	{
		$data_missing=NULL;
		
		if(empty($_POST['uname']))
		{
			$data_missing='1';
		}
		else
		{
			$uname = $_POST['uname'];
		}
		
		if(empty($_POST['pass']))
		{
				$data_missing= $data_missing . '2';
		}
		else
		{
			$pass = $_POST['pass'];
		}
		
		if(!isset($data_missing))
		{
			require_once('mysqli_connect.php');
			
			$query = "SELECT sname from student WHERE username= '$uname' AND password='$pass'";
			$stmt = mysqli_query($dbc,$query);
			$count = mysqli_num_rows($stmt);			
			if($count == 1)
			{
				//echo 'Information Validated<br/>';
				
				echo 'Welcome'. " ". $uname. '<br/>';
				mysqli_close($dbc);
				
			}
			else
			{
				mysqli_close($dbc);	
				header("Location: http://localhost/db/success.php?error=yes");		
			}
		}
		else
		{
			$redirectTo="Location: http://localhost/db/success.php?missing=" . $data_missing;
			header($redirectTo);
			
		}
	}
?>

<input type="submit" name="submit" value="Comment">
</body>
</html>
	
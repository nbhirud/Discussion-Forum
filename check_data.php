<html>
<head>
<title> Checking Data</title>
</head>

<body>

<?php

	if(isset($_POST['submit']))
	{
		$data_missing  = array();
		
		if(empty($_POST['sname']))
		{
			$data_missing[] = 'student name';
		}
		else
		{
			$sname = trim($_POST['sname']);
		}
		
		if(empty($_POST['sid']))
		{
			$data_missing[] = 'student id';
		}
		else
		{
			$sid = trim($_POST['sid']);
		}
		
		if(empty($_POST['major']))
		{
			$data_missing[] = 'major';
		}
		else
		{
			$major = trim($_POST['major']);
		}
		
		if(empty($_POST['uname']))
		{
			$data_missing[] = 'user name';
		}
		else
		{
			$uname = trim($_POST['uname']);
		}
		
		if(empty($_POST['pass']))
		{
			$data_missing[] = 'password';
		}
		else
		{
			$pass = $_POST['pass'];
		}
		
		if(empty($data_missing))
		{
			require_once('mysqli_connect.php');
			
			$query = "INSERT INTO student(SID,SNAME,SPECIALIZATION,username,PASSWORD) VALUES(?,?,?,?,?)";
			$stmt = mysqli_prepare($dbc,$query);
			mysqli_stmt_bind_param($stmt,"isiss",$sid,$sname,$major,$uname,$pass);
			mysqli_stmt_execute($stmt);
			$affected_rows = mysqli_stmt_affected_rows($stmt);
			
			if($affected_rows == 1)
			{
				echo 'Student Data Entered';
				mysqli_stmt_close($stmt);
				mysqli_close($dbc);
			}
			else
			{
				echo 'Error occurred';
				echo mysqli_error($stmt);
				mysqli_stmt_close($stmt);
				mysqli_close($dbc);
			}
		}
		else
		{
			echo 'You need to enter the following data.<br/>';
			
			foreach($data_missing as $missing)
			{
				echo "$missing<br/>";
			}
		}
	}
		
?>
<form action="http://localhost/db/check_data.php" method="post">

<?php

	echo '<h5>Enter your name:<input type= "text" name="sname"</h5>
		  <h5>Enter your Student ID:<input type="text" name="sid"></h5>
		  <h5>Enter your Major:<input type="text" name="major"></h5>
		  <h5>Enter your username:<input type="text" name="uname"></h5>
		  <h5>Enter your password:<input type="password" name="pass"></h5>
		  <input type="submit" name="submit">';

?>

</body>
</html>
<?php

if($_POST) {
		//create connection 	
		$user  = $_POST['uname'];
		$pass  = $_POST['pass'];
				
	if(isset($_POST['submit']))
	{
		$data_missing=NULL;
		
		if(empty($_POST['uname']))
		{
			$data_missing='1';
			echo "Please enter valid username.<br/>";
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
			echo "Please enter valid password";
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
				$_SESSION['LAST_ACTIVITY'] = time(); 
		        $_SESSION['userid']=$user;
				header('Location:dashboard.php');
				
			}
			else
			{
				mysqli_close($dbc);	
				header("Location: http://localhost/db/login.php?error=yes");		
			}
		
			
		
		//mysql_query("UPDATE profile SET status = '1' WHERE user_id = '$user'");
		
		}
	}
}
?>

<html>
<head>
<title>LOGIN</title>
<link rel="stylesheet" type="text/css" href="/db/css/login.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="shortcut icon" type="image/x-icon" href="/db/image/Discuss logo.png" />
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

<body class="yellowGreenGradient">
	<div class="headerBar">
		<span><image height="40px" width="inherit" src="/db/image/DiscussLogoTra.gif"/></span> 
		<span><image height="inherit" width="inherit" src="/db/image/DiscussNameTra.gif"/></span>
		<span style="float:right;padding-right:20px; padding-top:10px; font-size:large;"><a href="#">FAQ</a></span>
		<span style="float:right;padding-right:20px; padding-top:10px; font-size:large;"><a href="#">About</a></span>
	</div>
	<div style="height:400px;">
		 <video style="height:inherit; width:inherit;" src="/db/video/Sachin.mp4" muted="" autoplay="" loop=""></video>
	</div>
	<div class="container "> 
	<form action="http://localhost/db/login.php" method="post">
		
		    <legend class="legendStyle">SIGN IN</legend>  
			<table class="loginTable">
			    <?php 
					  $isError=isset($_GET['error']) ? $_GET['error'] : NULL;
					  if(isset($isError) and $isError='yes')
					  					echo'<tr><td class="alert alert-danger alert-dismissable" colspan=3><button type = "button" class = "close" data-dismiss = "alert" aria-hidden = "true">
      &times;
   </button><strong>The Username and password you have entered do not match!</strong></td></td></tr><tr style="height:10px"></tr>'
				?>
				<tr><td><label for="uname_id" class="labelStyle">USERNAME</label></td></tr>
				<tr><td colspan=3><input id="uname_id" type="text" name="uname" class="form-control"></td></tr>
				<?php 
					  $missing=isset($_GET['missing']) ? $_GET['missing'] : NULL;
					  if(isset($missing) and ($missing=='1' or $missing=='12'))
					  					echo'<tr><td colspan=3 style="color:red">The field is required</td></tr><tr style="height:10px"></tr>'
				?>
				<tr><td><label for="pass_id" class="labelStyle">PASSWORD</label></td></tr>
				<tr><td colspan=3><input id="pass_id" type="password" name="pass" class="form-control"/></td></tr>
				
				<?php 
					  $missing=isset($_GET['missing']) ? $_GET['missing'] : NULL;
					  if(isset($missing) and ($missing=='2' or $missing=='12'))
					  					echo'<tr><td colspan=3 style="color:red">The field is required</td></tr><tr style="height:10px"></tr>'
				?>
				<tr style="height:30px"></tr>
				<tr><td width="75%"><input type = "submit" name="submit" value=" sign in" class="submitBtn btn btn-info" ></td><td width="5%"></td><td width="20%" style="float:right;"><a href="/db/newuser.php"><u> New User?</u></a></td></tr>
			</table>
			
	</form>
	</div>	

	
</body>
</html>
<?php
include 'mysqli_connect.php';

$userid = $_SESSION['userid'];

if($userid){
  if (isset($_SESSION['LAST_ACTIVITY']) && (time() - $_SESSION['LAST_ACTIVITY'] > 3600)) {
    // last request was more than 30 minutes ago
    header("Location:logout.php");
}
}
include 'imageupload.php';

?>

<?php
echo "hello";
$post = isset($_POST['status_submit'])? $_POST['status_submit']:NULL;
$image = isset($_POST['ImgUpload']) ? $_POST['ImgUpload']:NULL;
$video = isset($_POST['ImgUpload']) ? $_POST['VidUpload']:NULL;
$submit= isset($_POST['submit'])? $_POST['submit']:NULL;
 
if($submit)
{
if($comment)
{
	$insert1 = mysqli_query($dbc, "INSERT INTO ptext(CONTENT)VALUES('$comment') ");
	//echo "<meta HTTP-EQUIV='REFRESH' content='0; url=comment.php'>";
}

else if($image)
{
	$insert2 = mysqli_query($dbc, "INSERT INTO pimage(CONTENT)VALUES('$image') ");
}

else if($video)
{
	$insert3 = mysqli_query($dbc, "INSERT INTO pvideo(CONTENT)VALUES('$video') ");
}
else
{
echo "please fill out all fields";
}
}*/ ?>


<!--<form action="comment.php" method="POST">
<table>
<tr><td colspan="2">Comment: </td></tr>
<tr><td colspan="5"><textarea name="comment" placeholder = "comment here" rows="10" cols="50"></textarea></td></tr>
<input type="file" name="ImgUpload" id="filUpload" value="image" onchange="showimagepreview(this)" style="float:left;" />
        <img id="imgprvw"/>
<input type="file" name="VidUpload" id="filUpload" value="video" onchange="showvideopreview(this)" style="float:left;" />
        <img id="imgprvw"/>
<tr><td colspan="2"><input type="submit" name="submit" value="Post"></td></tr>
</table>
</form> --> 

<?php
require_once('mysqli_connect.php');

    mysqli_query($dbc, "SET character_set_results=utf8");
    mb_language('uni');
    mb_internal_encoding('UTF-8');
 
$getquery1 = "SELECT CONTENT FROM ptext";
$getquery2 = "SELECT CONTENT FROM pimage";
$getquery3 = "SELECT CONTENT FROM pcontent";

$stmt1 = mysqli_query($dbc,$getquery1);
$stmt2 = mysqli_query($dbc,$getquery2);
$stmt3 = mysqli_query($dbc,$getquery3);

while($rows=mysqli_fetch_assoc($stmt1))
{
//$id=$rows['id'];
//$name=$rows['name'];
$comment=$rows['CONTENT'];
echo $comment . '<br/>' . '<br/>' . '<hr size="1"/>';
}

while($rows=mysqli_fetch_assoc($stmt2))
{
//$id=$rows['id'];
//$name=$rows['name'];
$image=$rows['CONTENT'];
echo $image . '<br/>' . '<br/>' . '<hr size="1"/>';
}

while($rows=mysqli_fetch_assoc($stmt3))
{
//$id=$rows['id'];
//$name=$rows['name'];
$video=$rows['CONTENT'];
echo $video . '<br/>' . '<br/>' . '<hr size="1"/>';
}
?>

<html>
<head>
<title>Comment</title>

<meta http-equiv="refresh" content="1020">
    <link href="css/p.css" type="text/css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:700' rel='stylesheet' type='text/css'>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
     <link href="css/jquery.cssemoticons.css" media="screen" rel="stylesheet" type="text/css" />
  <script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>
  <script src="js/jquery.cssemoticons.min.js" type="text/javascript"></script>
  
  <script type="text/javascript">

      function showimagepreview(input) {
      if (input.files && input.files[0]) {
      var filerdr = new FileReader();
      filerdr.onload = function(e) {
      $('#imgprvw').attr('src', e.target.result);
      }
      filerdr.readAsDataURL(input.files[0]);
      }
    }
 </script>

<script type="text/javascript">

      function showvideopreview(input) {
      if (input.files && input.files[0]) {
      var filerdr = new window.URL.createObjectURL();
      filerdr.onload = function(e) {
      $('#vidprvw').attr('src', e.target.result);
      }
      filerdr.window.URL.createObjectURL(input.files[0]);
      }
    } 
	
	function selectElement(i){
		$(".content").show(); 
		$(".content-switcher").hide();
		$("#item"+i).show();
	}
</script>
 
<script type="text/javascript">
 
function showprofile(){
 $(".profile_information").toggle(); 
 $("#main").toggleClass("blur");

}
</script>

</head>

<body>
<audio id="audio" src="images/tone.mp3" style="display:none;" ></audio>
<div class="maincontent">
<div id="heading" style="background: url(images/background.png);position:fixed;z-index:1000;">
      <p class="ourtitle">DISCUSS</p>
      <div class="ourname"><?php echo $name;?></div>
     <a href="#" class="profile1" onclick="showprofile()">    </a>
      
      <a href="logout.php" class="logout">     </a>

          </div>
          <div class="profile_information">
          <div class="form-holder">
            <form method="POST" action="dashboard.php" enctype="multipart/form-data"/>
      <div class="field">
        <div class="right">Name:</div><div class="left"><input type="text" name="profilename" class="underline" value="<?=$name?>"/></div>
      </div>
      <div class="field">
        <div class="right">Profile pic:</div><div class="left">
         <input type="file" name="filUpload" id="filUpload" onchange="showimagepreview(this)" style="float:left;" />
        <img id="imgprvw" alt="uploaded image preview"/>
        </div>
         
      </div>
      <div class="field">
        <div class="right">Birthday:</div><div class="left"><input type="date" name="bday" value="<?=$bday?>" class="underline"></div>
      </div>
      <div class="field">
        <div class="right">Enter new password:</div><div class="left"/><input type="password" name="password1" class="underline"/></div>
      </div>
      <div class="field">
        <div class="right">Re-enter password:</div><div class="left"/><input type="password " name="password2" class="underline"/></div>
      </div>
      <div id="edit">
        <input type="submit" class="Sub" value="Save" style="float:left;margin-left:6px;" name="savechanges">
     </div>
    </form>
    </div>

        <div id="main" style="float:left;margin-left:450px;">
    
    <div class="top" style="margin-top:60px;">
      <div class="profile" style="background:url('<?php echo $result['profile_pic'] ?>');
      background-repeat:no-repeat;background-size:100% 100%;"></div>
       
      <div class="post">
          <div class="content-switcher" id="item4">
          <form id="form2" method="post" action="dashboard.php">
            <textarea class="statusarea" name="status" placeholder="Whats on your mind..."></textarea>
            <input type="submit" class="Sub" value="Post" name="status_submit">
            </form>
          </div> 

          <div class="content-switcher" id="item1">
          <form id="form1" runat="server" style="padding:10px 0px 0px 10px;" action="dashboard.php" method="POST" enctype="multipart/form-data">
          <input type="text" name="image_title" style="float:left;width:650px; border-bottom:1px solid #ccc;border-top:none;border-left:none;border-right:none;line-height:30px;" placeholder="Title">
            <div class="form_image" style="clear:both;padding-top:5px;">
            <input type="file" name="fileUpload" onchange="showimagepreview2(this)" style="float:left;" />
              </div>
              <img id="imgprvwe" alt="uploaded image preview"/>
               <input type="submit" class="Sub2"  value="Post" name="image_submit">
            </form>
            </div>   

          <div class="content-switcher" id="item2">
          <form id="form3"  style="padding:10px 0px 0px 10px;" method="post" action="dashboard.php">
          <input name="url_title" type="text" style="float:left;width:650px; border-bottom:1px solid #ccc;border-top:none;border-left:none;border-right:none;line-height:30px;" placeholder="Title">
          <input name="youtube_url" type="text" style="float:left;width:650px; border-bottom:1px solid #ccc;border-top:none;border-left:none;border-right:none;line-height:30px;" placeholder="YouTube Url">
          <input type="submit" class="Sub"  value="Post" name="url_submit"/>
            </form>
            </div> 

          <div class="content-switcher" id="item3">
             <form id="form4"  style="padding:10px 0px 0px 10px;">
          this option is under construction
            </form>
          </div> 


        <div id="status" onclick="selectElement(4); return false;"></div>
        <div id="photo" onclick="selectElement(1); return false;"></div>
        <div id="video"  onclick="selectElement(2);"></div>    
        <div id="videoupload"  onclick="selectElement(3);"></div>

     </div>
    </div>
   


<div class="post">
          <div class="content-switcher" id="item4">
          <form id="form2" method="post" action="comment.php">
            <textarea class="statusarea" name="status" placeholder="Whats on your mind..."></textarea>
            <input type="submit" class="Sub" value="Post" name="status_submit">
            </form>
          </div> 

          <div class="content-switcher" id="item1">
          <form id="form1" runat="server" style="padding:10px 0px 0px 10px;" action="comment.php" method="POST" enctype="multipart/form-data">
          <input type="text" name="image_title" style="float:left;width:650px; border-bottom:1px solid #ccc;border-top:none;border-left:none;border-right:none;line-height:30px;" placeholder="Title">
            <div class="form_image" style="clear:both;padding-top:5px;">
            <input type="file" name="fileUpload" onchange="showimagepreview2(this)" style="float:left;" />
              </div>
              <img id="imgprvwe" alt="uploaded image preview"/>
               <input type="submit" class="Sub2"  value="Post" name="image_submit">
            </form>
            </div>   

          <div class="content-switcher" id="item2">
          <form id="form3"  style="padding:10px 0px 0px 10px;" method="post" action="comment.php">
          <input name="url_title" type="text" style="float:left;width:650px; border-bottom:1px solid #ccc;border-top:none;border-left:none;border-right:none;line-height:30px;" placeholder="Title">
          <input name="youtube_url" type="text" style="float:left;width:650px; border-bottom:1px solid #ccc;border-top:none;border-left:none;border-right:none;line-height:30px;" placeholder="YouTube Url">
          <input type="submit" class="Sub"  value="Post" name="url_submit"/>
            </form>
            </div> 


        <div id="status" onclick="selectElement(4); return false;"></div>
        <div id="photo" onclick="selectElement(1); return false;"></div>
        <div id="video"  onclick="selectElement(2);"></div>    
        <div id="videoupload"  onclick="selectElement(3);"></div>

     </div>
</body>
</html>
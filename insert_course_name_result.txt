<?php

include('info.txt');

$mysqli = new mysqli($server, $user, $pass, $dbname, $port);
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

?>

<?php
$ncourse_crn = $_POST['ncourse_crn'];

$num_length = strlen((string)$ncourse_crn);
print "string length: $num_length<br>";

if($num_length == 5) 
{


$ncourse_name = $_POST['ncourse_name'];
$ncourse_instructor = $_POST['ncourse_instructor'];
$ncourse_group = $_POST['ncourse_group'];
$ncourse_level = $_POST['ncourse_level'];
$ncourse_option = $_POST['ncourse_option'];
$ncourse_credits = $_POST['ncourse_credits'];
$ncourse_location = $_POST['ncourse_location'];
$ncourse_time = $_POST['ncourse_time'];






$query = "insert into Course(CRN, Name,Instructor,Group_require, Level, On_line, Credits, Location, Time)
values(?, ?, ?, ?, ?, ?, ?, ?, ? );" ;


if (!($stmt = $mysqli->prepare($query)))
{
     echo "Prepare failed: (" . $mysqli->errno . ") " . $mysqli->error;
}

if (!$stmt->bind_param("isssssiss", $ncourse_crn,$ncourse_name,$ncourse_instructor,$ncourse_group,$ncourse_level,
									$ncourse_option,$ncourse_credits,$ncourse_location,$ncourse_time)) 
{
    echo "Binding parameters failed: (" . $stmt->errno . ") " . $stmt->error;
}

if (!$stmt->execute()) {
    echo "Execute failed: (" . $stmt->errno . ") " . $stmt->error;
}


echo '<script language="javascript">';
echo 'alert("Insert successfully")';
echo '</script>';

//header("Location: test.php");

}

else
{
	echo '<script language="javascript">';
	echo 'alert("Illegal CRN, please input 5 digits")';
	echo '</script>';
}
?>
<html>
<body>
<a href="test.php">return to pre page</a>
</body>
</html>
<?php

include('info.txt');

$mysqli = new mysqli($server, $user, $pass, $dbname, $port);
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}
?>


<?php
$instructor_id = $_POST['instructor_id'];
$num_length = strlen((string)$instructor_id);
print "string length: $num_length<br>";

if($num_length == 6) 
{


$instructor_fname = $_POST['instructor_fname'];
$instructor_lname = $_POST['instructor_lname'];
$instructor_department = $_POST['instructor_department'];
$instructor_office = $_POST['instructor_office'];
$instructor_email = $_POST['instructor_email'];



$query = "insert into Instructor(Instructor_ID, Fname, Lname, Department, Office, Email)
values (?, ?, ?, ?, ?, ?);" ;


if (!($stmt = $mysqli->prepare($query)))
{
     echo "Prepare failed: (" . $mysqli->errno . ") " . $mysqli->error;
}

if (!$stmt->bind_param("isssss", $instructor_id,$instructor_fname,$instructor_lname,
									$instructor_department,$instructor_office,$instructor_email)) 
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
	echo 'alert("Illegal CRN, please input 6 digits")';
	echo '</script>';
}
?>
<html>
<body>
<a href="test.php">return to pre page</a>
</body>
</html>
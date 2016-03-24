<?php

include('info.txt');

$mysqli = new mysqli($server, $user, $pass, $dbname, $port);
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

?>

<html>
<head>
  <title>The PHP-MySQL Program</title>
  </head>
  
  <body bgcolor="white">
  
  
  <hr>
  
  
<?php


$s_id = $_POST['student_id'];
print "<h1>student_id: $s_id</h1>";

$query = "SELECT s.Fname, s.Lname, s.Major, s.Level, s.Email
from Student s 
where Student_ID = ?;" ;


if (!($stmt = $mysqli->prepare($query)))
{
     echo "Prepare failed: (" . $mysqli->errno . ") " . $mysqli->error;
}

if (!$stmt->bind_param("i", $s_id)) {
    echo "Binding parameters failed: (" . $stmt->errno . ") " . $stmt->error;
}

if (!$stmt->execute()) {
    echo "Execute failed: (" . $stmt->errno . ") " . $stmt->error;
}

?>


<p>
The query:
<p>
<?php
echo "<code><pre>".$query."</pre><code>";
?>

<hr>
<p>
Result of query:
<p>

<?php
echo "<pre>";
/* bind result variables */
$stmt->bind_result($Fname, $Lname, $Major, $Level, $Email);

/* fetch values */
echo "<table style=\"width:40%\" border='1'>";
echo "<tr><th>Fname</th><th>Lname</th><th>Major</th><th>Level</th><th>Email</th></tr>";
while ($stmt->fetch()) {
    echo "<tr><td>$Fname</td><td>$Lname</td><td>$Major</td><td>$Level</td><td>$Email</td></tr>";
}
echo "</table>";

echo "</pre>";

$stmt->close();
$mysqli->close();

?>

<p>
<hr>

<p>
<a href="student_id_result.txt" >Contents</a>
of this page.   
 
</body>
</html>
    
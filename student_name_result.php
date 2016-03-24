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


$s_name = $_POST['student_name'];

$query = "SELECT c.CRN, c.Name, c.Location, c.Time
from Student s 
join Login l
on s.Student_ID = l.Student_id
join Course c
on l.Course_name = c.Name
where concat(s.Fname, ' ', s.Lname) = ?;" ;


if (!($stmt = $mysqli->prepare($query)))
{
     echo "Prepare failed: (" . $mysqli->errno . ") " . $mysqli->error;
}

if (!$stmt->bind_param("s", $s_name)) {
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
$stmt->bind_result($CRN, $Name, $Location, $Time);

/* fetch values */
echo "<table style=\"width:40%\" border='1'>";
echo "<tr><th>CRN</th><th>Name</th><th>Location</th><th>Time</th></tr>";
while ($stmt->fetch()) {
    echo "<tr><td>$CRN</td><td>$Name</td><td>$Location</td><td>$Time</td></tr>";
}
echo "</table>";

echo "</pre>";

$stmt->close();
$mysqli->close();

?>

<p>
<hr>

<p>
<a href="student_name_result.txt" >content</a>
of the PHP program that created this page. 

 
 
</body>
</html>
    
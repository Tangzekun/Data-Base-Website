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


$c_name = $_POST['course_name'];

$query = "SELECT s.Student_ID,concat(s.Fname, ' ', s.Lname) AS Name
from Student s join Login l
on s.Student_id = l.Student_id
where l.Course_name = ? ;" ;


if (!($stmt = $mysqli->prepare($query)))
{
     echo "Prepare failed: (" . $mysqli->errno . ") " . $mysqli->error;
}

if (!$stmt->bind_param("s", $c_name)) {
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
$stmt->bind_result($ID, $Name);

/* fetch values */
echo "<table style=\"width:40%\" border='1'>";
echo "<tr><th>Student ID</th><th>Student Name</th></tr>";
while ($stmt->fetch()) {
    echo "<tr><td>$ID</td><td>$Name</td></tr>";
}
echo "</table>";

echo "</pre>";

$stmt->close();
$mysqli->close();

?>

<p>
<hr>

<p>
<a href="course_name_result.txt" >Contents</a>
of this page.   
 
</body>
</html>
    
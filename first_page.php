
<html>
<head>
  <title>CIS451 Final Project PHP-MySQL Program</title>
</head>
  
<body bgcolor="white">
   
<hr>
  
<h3>CIS451 Final Project PHP-MySQL Program</h3>
  
  
  
  
  
  
  
  
<p>
	Select <b>Student Name</b> to check his or her courses' information
<p>


 
<?php

include('info.txt');

$database = new mysqli($server, $user, $pass, $dbname, $port);
if ($database->connect_errno) {
    echo "Failed to connect to MySQL: (" . $database->connect_errno . ") " . $database->connect_error;
}

?>




<?php

$query = "select concat(Fname, ' ', Lname) from Student order by Fname;" ;
if (!($request = $database->prepare($query)))
{
     echo "Prepare failed: (" . $database->errno . ") " . $database->error;
}

if (!$request->execute()) {
    echo "Execute failed: (" . $request->errno . ") " . $request->error;
}

?>

<p>
<form action="student_name_result.php" method="POST">

<?php
$request->bind_result($result);
 echo "<select name='student_name'>";
 echo "<option value='0'>-Select Name-</option>";
while ($request->fetch()) 
{	
    echo "<option value='".$result."'>$result</option>";
} 
echo "</select>";
?>
<p>



<form>
<button>Submit</button>
</form>
 
 
 
 
 
 
 
  

<hr>

<p>
	Select <b>Student ID</b> to check his or her personal information
<p>



<?php

$query1 = "SELECT Student_ID FROM Student order by Student_ID;" ;
if (!($request1 = $database->prepare($query1)))
{
     echo "Prepare failed: (" . $database->errno . ") " . $database->error;
}

if (!$request1->execute()) {
    echo "Execute failed: (" . $request1->errno . ") " . $request1->error;
}

?>

<p>
<form action="student_id_result.php" method="POST">

<?php
$request1->bind_result($result1);
 echo "<select name='student_id'>";
 echo "<option value='0'>-Select ID-</option>";
while ($request1->fetch()) 
{	
    echo "<option value='".$result1."'>$result1</option>";
} 
echo "</select>";
?>
<p>

<form>
<button>Submit</button>
</form>





<hr>

<p>
	Select <b>Course Name</b> to see who registered this course
<p>



<?php

$query2 = "SELECT Name FROM Course;" ;
if (!($request2 = $database->prepare($query2)))
{
     echo "Prepare failed: (" . $database->errno . ") " . $database->error;
}

if (!$request2->execute()) {
    echo "Execute failed: (" . $request2->errno . ") " . $request2->error;
}

?>

<p>
<form action="course_name_result.php" method="POST">

<?php
$request2->bind_result($result2);
 echo "<select name='course_name'>";
 echo "<option value='0'>-Course Name-</option>";
while ($request2->fetch()) 
{	
    echo "<option value='".$result2."'>$result2</option>";
} 
echo "</select>";
?>
<p>

<form>
<button>Submit</button>
</form>









<hr>



<p>
Insert a <b>New Course</b> to the database
<p>
<form action="insert_course_name_result.php" method="POST">
<table border="1">
<tr>
<th>CRN</th><th>Course Name</th><th>Instructor</th><th>Group</th><th>Level</th><th>Online</th><th>Credits</th><th>Location</th><th>Time</th>
</tr>

<?php

$query3 = "select concat(Fname, ' ', Lname) from Instructor order by Fname;" ;
if (!($request3 = $database->prepare($query3)))
{
     echo "Prepare failed: (" . $database->errno . ") " . $database->error;
}

if (!$request3->execute()) {
    echo "Execute failed: (" . $request3->errno . ") " . $request->error;
}

?>






<tr>

<td><input type="text" name="ncourse_crn"></td>
<td><input type="text" name="ncourse_name"></td>


<td>
<p>
<?php
$request3->bind_result($result3);
 echo "<select name='ncourse_instructor'>";
 echo "<option value='0'>-Select Instructor-</option>";
while ($request3->fetch()) 
{	
    echo "<option value='".$result3."'>$result3</option>";
} 
echo "</select>";
?>
<p>

<!-- 
<select name=ncourse_instructor>
<option name=one value=one> one </option>
<option name=two value=two> two </option>
<option name=three value=three> three </option>
 -->
</select>
</td>

<td>
<select name=ncourse_group>
<option value="AC"> AC </option>
<option value="AL"> AL </option>
<option value="IC"> IC </option>
<option value="SC"> SC </option>
<option value="SSC"> SSC </option>
<option value="None"> None </option>
</select>
</td>


<td>
<select name=ncourse_level>
<option value="Undergraduate"> Undergraduate </option>
<option value="Graduate"> Graduate </option>
<option value="Both"> Both </option>
</select>
</td>

<td>
<select name=ncourse_option>
<option value="Yes"> Yes </option>
<option value="No"> No </option>
</select>
</td>

<td>
<select name=ncourse_credits>
<option value=one> 1 </option>
<option value=two> 2 </option>
<option value=three> 3 </option>
<option value=four> 4 </option>
</select>
</td>

<td>
<select name=ncourse_location>
<option value="EMU"> EMU </option>
<option value="LIL"> LIL </option>
<option value="DES"> DES </option>
<option value="CHA"> CHA </option>
<option value="STB"> STB </option>
<option value="LA"> LA </option>
<option value="MCK"> MCK </option>
<option value="FEN"> FEN </option>
<option value="CON"> CON </option>
<option value="KLA"> KLA </option>
</select>

</td>


<td>
<select name=ncourse_time>
<option value="M"> M </option>
<option value="T"> T </option>
<option value="W"> W </option>
<option value="R"> R </option>
<option value="F"> F </option>
</select>
</td>
</tr>
</table>
<input type="submit" value="insert" />

<p>
<a href="insert_course_name_result.txt" >Contents</a>
of next page.

</form>


<!--<form>
<button>Insert</button>
</form>-->




<hr>







<p>
Insert a <b>New Instructor</b> to the database<br/>
<p>

<form action="insert_instuctor_result.php" method="POST">
<table border="1">
<tr>
<th>Instructor_ID</th><th>First name</th><th>Last name</th><th>Department</th><th>Office</th><th>Email</th>
</tr>

<tr>
<td>  <input type="text" name="instructor_id"></td>
<td> <input type="text" name="instructor_fname"> </td>
<td> <input type="text" name="instructor_lname"> </td>
<td> 
<select name=instructor_department>
<option value="CIS"> CIS </option>
<option value="HIST"> HIST </option>
<option value="MATH"> MATH </option>
<option value="BI"> BI </option>
<option value="CLAS"> CLAS </option>
<option value="PHYS"> PHYS </option>
<option value="ANTH"> ANTH </option>
<option value="PSY"> PSY </option>
</select>
</form> 
</td>

<td> 
<select name=instructor_office>
<option value="EMU"> EMU </option>
<option value="LIL"> LIL </option>
<option value="DES"> DES </option>
<option value="CHA"> CHA </option>
<option value="STB"> STB </option>
<option value="LA"> LA </option>
<option value="MCK"> MCK </option>
<option value="FEN"> FEN </option>
<option value="CON"> CON </option>
<option value="KLA"> KLA </option>
</select>
</td>

<td> <input type="text" name="instructor_email"> </td>

</tr>
</table>
<input type="submit" value="insert" />
<p>
<a href="insert_instructor_result.txt" >Contents</a>
of next page.


</form> 



<hr>
















<p>
<a href="first_page.txt" >Contents</a>
of this page.
<p>
<a href="info.txt" >ConnectionData</a>
of this program.

<p>



</body>
</html>
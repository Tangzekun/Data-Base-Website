
<?php
include('info.txt');

$mysqli = new mysqli($server, $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');

?>


<html>
<head>
  <title>CIS451 Final Project PHP-MySQL Program</title>
  </head>
  
  <body bgcolor="white">
  
  
  <hr>
  
 

<p>
Select a <b>Student Name</b> to check his or her courses' information

<p>

<form action="final_project_backend.php" method="POST">

<form name=myform>
<font>Select&nbsp</font>
<select name=selected_student>
<option name=one value=one> one </option>
<option name=two value=two> two </option>
<option name=three value=three> three </option>
</select>
</form>

<input type="text" name="manu_name"> <br>
<input type="submit" value="submit">
</form>

<hr>






<p>
Select a <b>Student ID</b> to check his or her personal  information

<p>

<form name=myform>
<font>Select&nbsp</font>
<select name=selected_id>
<option name=one value=one> one </option>
<option name=two value=two> two </option>
<option name=three value=three> three </option>
</select>
</form>

<form>
<input type="submit" value="submit">
</form>

<hr>




<p>
Select a <b>Course Name</b> to check who registered this course
<p>

<form name=myform>
<font>Select&nbsp</font>
<select name=selected_course>
<option name=one value=one> one </option>
<option name=two value=two> two </option>
<option name=three value=three> three </option>
</select>
</form>

<form>
<input type="submit" value="submit">
</form>


<hr>










<p>
Insert a <b>New Course</b> to the database
<p>

<table border="1">
<tr>
<th>CRN</th><th>Name</th><th>Instructor</th><th>Group</th><th>Level</th><th>Online</th><th>Credits</th><th>Location</th><th>Time</th>
</tr>

<tr>
<td>  <input type="text" name="manu_name"></td>
<td><input type="text" name="manu_name"></td>

<td>
<form name=myform>
<select name=ncourse_instructor>
<option name=one value=one> one </option>
<option name=two value=two> two </option>
<option name=three value=three> three </option>
</select>
</form>
</td>

<td>
<form name=myform>
<select name=ncourse_group>
<option value="AC"> AC </option>
<option value="AL"> AL </option>
<option value="IC"> IC </option>
<option value="SC"> SC </option>
<option value="SSC"> SSC </option>
<option value="None"> None </option>
</select>
</form>
</td>


<td>
<form name=myform>
<select name=ncourse_level>
<option value="Undergraduate"> Undergraduate </option>
<option value="Graduate"> Graduate </option>
<option value="Both"> Both </option>
</select>
</td>

<td>
<form name=myform>
<select name=ncourse_option>
<option value="Yes"> Yes </option>
<option value="No"> No </option>
</select>
</td>

<td>
<form name=myform>
<select name=ncourse_credits>
<option value=one> 1 </option>
<option value=two> 2 </option>
<option value=three> 3 </option>
<option value=four> 4 </option>
</select>
</td>

<td>
<form name=myform>
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
</form>
</td>


<td>
<form name=myform>
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



<form>
<input type="submit" value="Insert">
</form>

<hr>








<p>
Insert a <b>New Instructor</b> to the database<br/>
<p>


<table border="1">
<tr>
<th>Instructor_ID</th><th>Fname</th><th>Lname</th><th>Department</th><th>Office</th><th>Email</th>
</tr>

<tr>
<td>  <input type="text" name="instructor_id"></td>
<td> <input type="text" name="fname"> </td>
<td> <input type="text" name="lname"> </td>
<td> 
<form name=myform>
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
<form name=myform>
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
</form> 
</td>

<td> <input type="text" name="email"> </td>




</tr>
</table>


<form>
<input type="submit" value="Insert">
</form>

<hr>




<p>
<a href="assignment4_frontend.txt" >Contents</a>
of this page.

<p>
<a href="assignment4_backend.txt" >Contents</a>
of the PHP page that gets called.
(And the <a href="connectionData.txt" >connection data</a>,
kept separately for security reasons.)

<hr>


<?php


if (!($stmt = $mysqli->prepare($query)))
{
     echo "Prepare failed: (" . $mysqli->errno . ") " . $mysqli->error;
}

if (!$stmt->bind_param("s", $manu_name)) {
    echo "Binding parameters failed: (" . $stmt->errno . ") " . $stmt->error;
}

if (!$stmt->execute()) {
    echo "Execute failed: (" . $stmt->errno . ") " . $stmt->error;
}

echo "<pre>";
/* bind result variables */
$stmt->bind_result($description, $total_value);

/* fetch values */
while ($stmt->fetch()) {
   echo $description,"           ",$total_value;
   echo "\n";
}

echo "</pre>";

$stmt->close();
$mysqli->close();
?>

<p>
<hr>

</p>
<a href="first.txt" >first.txt</a>
 
</body>
</html>
	  
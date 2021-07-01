<?php
session_start();
require_once('db_connection.php');
$conn = mysqli_connect("localhost","root","","Event Portal");
//$conn = mysqli_connect("remotemysql.com","F6wy4ESYJR","ZUI1AztbHy","F6wy4ESYJR");

if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  exit();
}
if(isset($_POST['organizer']) && !empty($_POST['organizer']))
{
    $organizer = $_POST['organizer'];

    $query = "SELECT Event_Name FROM events WHERE Event_Creator = '".$organizer."'";  
    $result = mysqli_query($conn, $query);
    while($row = mysqli_fetch_array($result))  
    { 
    echo $return = '<option value="'.$row['Event_Name'].'">'.$row['Event_Name'].'</option>';
    }
}
else
{
    echo $return = '<option value="">Event not available</option>';
}
?>

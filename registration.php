<!--
Here, we write code for registration.
-->
<?php
require_once('db_connection.php');

//$conn = mysqli_connect("localhost","root","","Event Portal");
$conn = mysqli_connect("remotemysql.com","F6wy4ESYJR","ZUI1AztbHy","F6wy4ESYJR");

if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  exit();
}
$fname = $username = $password = $pwd = '';

$name = trim($_POST['name_field']);
$username = trim($_POST['email_field']);
$pwd = trim($_POST['password_field']);
$password = MD5($pwd);

$sql = "INSERT INTO users (Name,Username,Password) VALUES ('$name','$username','$password')";
$result = mysqli_query($conn, $sql);
if($result)
{
	header("Location: index.php");
}
?>

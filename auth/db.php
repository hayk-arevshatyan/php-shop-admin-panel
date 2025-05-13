<?php

$servername = 'localhost';
$username = 'root';
$password = '';
$database = 'registration';

$conn = new mysqli($servername, $username, $password, $database);
if($conn->connect_error){
    die('connection falled: ' . $conn->connect_error);
}

?>
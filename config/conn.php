<?php

$conn = new mysqli("localhost", "root", "", "h_expe");

if($conn->connect_error){
    echo $conn->error;
}
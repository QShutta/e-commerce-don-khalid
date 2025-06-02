<?php
include "connect.php";

$table="users";
$data = [
    'user_name' => 'Qasim',
    'user_email' => "abolkasm11@gmail.com",
    'user_phone' => '01111111111',
    'user_varfy_code' => '123456',
    'user_approve' => 1,
    'user_created_at' => date('Y-m-d H:i:s'),
];
$count=insertData($table, $data);

?>
<?php

$dsn = 'mysql:host=db;port=3306';
$user = 'tsrlearning';
$password = 'tsrlearning';

try {
    $dbh = new PDO($dsn, $user, $password);
    var_dump($dbh);
} catch (PDOException $e) {
    echo 'Connection failed: '.$e->getMessage();
}

$redis = new Redis();
$redis->pconnect('redis', 6379);

$key = 'first';
$redis->incr($key);

<?php
function verificaCredenziali($email, $password) {
    return ($password === '123');
}

$email = '';
$password = '';

if ((isset($_POST['email']) && isset($_POST['password'])) || (isset($_GET['email']) && isset($_GET['password']))) {
    $email = isset($_POST['email']) ? $_POST['email'] : $_GET['email'];
    $password = isset($_POST['password']) ? $_POST['password'] : $_GET['password'];
    if (verificaCredenziali($email, $password)) {
        setcookie('loggato', 'true', time() + 3600);
    }
}
header('Location: index.php');
        exit();



?>
<?php
$host = "localhost";
$user = "root";
$password = "admin123"; // escribe tu contraseña si tienes
$db = "tienda_web"; // si usaste otro nombre cámbialo aquí

$conn = new mysqli($host, $user, $password, $db);

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}
?>

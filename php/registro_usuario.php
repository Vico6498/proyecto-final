<?php
include 'conexion.php';

$nombre = $_POST['nombre'] ?? '';
$email = $_POST['email'] ?? '';
$clave = $_POST['clave'] ?? '';

// Cifrar contraseña
$claveHash = password_hash($clave, PASSWORD_DEFAULT);

// Insertar usuario
$sql = "INSERT INTO usuarios (nombre, email, clave) VALUES (?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("sss", $nombre, $email, $claveHash);

if ($stmt->execute()) {
    echo "✅ Registro exitoso. <a href='../login.html'>Iniciar sesión</a>";
} else {
    echo "❌ Error al registrar: " . $conn->error;
}
?>

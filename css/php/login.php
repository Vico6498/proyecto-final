<?php
session_start();
include 'conexion.php';

$usuario = $_POST['usuario'];
$clave = $_POST['clave'];

$sql = "SELECT * FROM usuarios WHERE nombre_usuario = '$usuario' AND contraseña = '$clave'";
$result = $conn->query($sql);

if ($result->num_rows == 1) {
    $row = $result->fetch_assoc();
    $_SESSION['usuario'] = $row['nombre_usuario'];
    $_SESSION['rol'] = $row['rol'];
    
    if ($row['rol'] == 'admin') {
        header("Location: ../admin.html");
    } else {
        header("Location: ../productos.html");
    }
} else {
    echo "Credenciales inválidas.";
}
?>

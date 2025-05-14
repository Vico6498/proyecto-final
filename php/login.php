<?php
session_start();
include 'conexion.php';

$usuario = $_POST['usuario'] ?? '';
$clave = $_POST['clave'] ?? '';

$sql = "SELECT * FROM usuarios WHERE email = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $usuario);
$stmt->execute();
$resultado = $stmt->get_result();

if ($resultado->num_rows === 1) {
    $fila = $resultado->fetch_assoc();

    if (password_verify($clave, $fila['clave'])) {
        $_SESSION['usuario'] = $fila['email'];
        $_SESSION['rol'] = $fila['rol'];

        if ($fila['rol'] === 'admin') {
            header("Location: ../admin.html");
        } else {
            header("Location: ../productos.html");
        }
        exit;
    }
}

echo "❌ Usuario o contraseña incorrectos. <a href='../login.html'>Intentar de nuevo</a>";
?>

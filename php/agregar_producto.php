<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

include 'conexion.php';

$nombre = $_POST['nombre'] ?? '';
$descripcion = $_POST['descripcion'] ?? '';
$precio = $_POST['precio'] ?? 0;
$stock = $_POST['stock'] ?? 0;

$imagen = $_FILES['imagen']['name'] ?? '';
$rutaTemporal = $_FILES['imagen']['tmp_name'] ?? '';
$rutaDestino = "../img/" . basename($imagen);

if (move_uploaded_file($rutaTemporal, $rutaDestino)) {
    $sql = "INSERT INTO productos (nombre, descripcion, precio, stock, imagen)
            VALUES ('$nombre', '$descripcion', $precio, $stock, '$imagen')";

    if ($conn->query($sql) === TRUE) {
        echo "✅ Producto agregado correctamente. <a href='../admin.html'>Volver</a>";
    } else {
        echo "❌ Error al guardar en la base de datos: " . $conn->error;
    }
} else {
    echo "❌ Error al subir la imagen.";
}
?>

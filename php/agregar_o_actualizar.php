<?php
include 'conexion.php';

$id = $_POST['id'] ?? '';
$nombre = $_POST['nombre'];
$descripcion = $_POST['descripcion'];
$precio = $_POST['precio'];
$stock = $_POST['stock'];

$imagen = $_FILES['imagen']['name'];
$rutaTemporal = $_FILES['imagen']['tmp_name'];
$imagenGuardada = '';

if ($imagen !== '') {
    $imagenGuardada = basename($imagen);
    move_uploaded_file($rutaTemporal, "../img/" . $imagenGuardada);
}

if ($id === '') {
    // INSERTAR NUEVO
    $sql = "INSERT INTO productos (nombre, descripcion, precio, stock, imagen)
            VALUES ('$nombre', '$descripcion', $precio, $stock, '$imagenGuardada')";
} else {
    // ACTUALIZAR EXISTENTE
    if ($imagenGuardada !== '') {
        $sql = "UPDATE productos SET nombre='$nombre', descripcion='$descripcion', precio=$precio, stock=$stock, imagen='$imagenGuardada' WHERE id=$id";
    } else {
        $sql = "UPDATE productos SET nombre='$nombre', descripcion='$descripcion', precio=$precio, stock=$stock WHERE id=$id";
    }
}

if ($conn->query($sql) === TRUE) {
    echo "✅ Producto guardado correctamente. <a href='../admin.html'>Volver</a>";
} else {
    echo "❌ Error: " . $conn->error;
}
?>

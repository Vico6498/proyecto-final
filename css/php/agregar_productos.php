<?php
include 'conexion.php';

$nombre = $_POST['nombre'];
$descripcion = $_POST['descripcion'];
$precio = $_POST['precio'];
$stock = $_POST['stock'];

$imagen = $_FILES['imagen']['name'];
$ruta = "../img/" . $imagen;
move_uploaded_file($_FILES['imagen']['tmp_name'], $ruta);

$sql = "INSERT INTO productos (nombre, descripcion, precio, stock, imagen)
        VALUES ('$nombre', '$descripcion', $precio, $stock, '$imagen')";

if ($conn->query($sql)) {
    echo "Producto agregado.";
} else {
    echo "Error: " . $conn->error;
}
?>
<?php
include 'conexion.php';

// Validar datos recibidos
$nombre = $_POST['nombre'];
$descripcion = $_POST['descripcion'];
$precio = $_POST['precio'];
$stock = $_POST['stock'];

// Manejo de imagen
$imagen = $_FILES['imagen']['name'];
$rutaTemporal = $_FILES['imagen']['tmp_name'];
$rutaDestino = "../img/" . basename($imagen);

// Mover la imagen a la carpeta /img
if (move_uploaded_file($rutaTemporal, $rutaDestino)) {
    // Insertar el producto en la base de datos
    $sql = "INSERT INTO productos (nombre, descripcion, precio, stock, imagen)
            VALUES ('$nombre', '$descripcion', $precio, $stock, '$imagen')";

    if ($conn->query($sql) === TRUE) {
        echo "Producto agregado correctamente. <a href='../admin.html'>Volver</a>";
    } else {
        echo "Error al agregar producto: " . $conn->error;
    }
} else {
    echo "Error al subir la imagen.";
}
?>

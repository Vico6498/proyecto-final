<?php
include 'conexion.php';

// Obtener los datos JSON del carrito
$datos = json_decode(file_get_contents("php://input"), true);

if (!$datos) {
    http_response_code(400);
    echo "Datos de compra inválidos.";
    exit();
}

foreach ($datos as $item) {
    $id = $item['id'];
    $cantidad = $item['cantidad'];

    // Insertar en la tabla de compras
    $sql = "INSERT INTO compras (producto_id, cantidad) VALUES ($id, $cantidad)";
    $conn->query($sql);

    // Actualizar stock del producto
    $sqlStock = "UPDATE productos SET stock = stock - $cantidad WHERE id = $id";
    $conn->query($sqlStock);
}

echo "¡Compra realizada con éxito!";
?>

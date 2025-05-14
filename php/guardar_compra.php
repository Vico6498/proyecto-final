<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

include 'conexion.php';

// Leer el cuerpo del request
$data = json_decode(file_get_contents("php://input"), true);

if (!$data || !is_array($data)) {
    echo "❌ No se recibieron productos válidos.";
    exit;
}

foreach ($data as $item) {
    $id = $item['id'];
    $cantidad = $item['cantidad'];

    // Descontar stock
    $conn->query("UPDATE productos SET stock = stock - $cantidad WHERE id = $id");

    // Insertar en historial o tabla de compras (opcional)
    $conn->query("INSERT INTO compras (producto_id, cantidad, fecha) VALUES ($id, $cantidad, NOW())");
}

echo "✅ Compra finalizada con éxito.";
?>

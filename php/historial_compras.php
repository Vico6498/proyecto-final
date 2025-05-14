<?php
include 'conexion.php';

$sql = "SELECT c.cantidad, c.fecha, p.nombre 
        FROM compras c 
        JOIN productos p ON c.producto_id = p.id 
        ORDER BY c.fecha DESC";

$resultado = $conn->query($sql);

$compras = [];

while ($fila = $resultado->fetch_assoc()) {
    $compras[] = $fila;
}

echo json_encode($compras);
?>

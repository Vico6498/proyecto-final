<?php
include 'conexion.php';

$sql = "SELECT * FROM productos";
$result = $conn->query($sql);

$productos = array();

while ($row = $result->fetch_assoc()) {
    $productos[] = $row;
}

echo json_encode($productos);
?>

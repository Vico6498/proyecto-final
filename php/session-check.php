<?php
session_start();

$response = [];

if (isset($_SESSION['usuario'])) {
    $response['activo'] = true;
    $response['usuario'] = $_SESSION['usuario'];
    $response['rol'] = $_SESSION['rol'];
} else {
    $response['activo'] = false;
}

echo json_encode($response);
?>

document.addEventListener("DOMContentLoaded", () => {
    const lista = document.getElementById("lista-carrito");
    const carrito = JSON.parse(localStorage.getItem("carrito")) || [];

    if (carrito.length === 0) {
        lista.innerHTML = "<p>El carrito está vacío.</p>";
        return;
    }

    fetch("php/obtener_productos.php")
        .then(res => res.json())
        .then(productos => {
            let html = "";
            let total = 0;

            carrito.forEach((item, index) => {
                const producto = productos.find(p => p.id == item.id);
                if (producto) {
                    const subtotal = parseFloat(producto.precio) * item.cantidad;
                    total += subtotal;

                    html += `
                        <div>
                            <h3>${producto.nombre}</h3>
                            <img src="img/${producto.imagen}" width="100"><br>
                            <p>${producto.descripcion}</p>
                            <p>Precio unitario: $${producto.precio}</p>
                            <p>Cantidad: <input type="number" value="${item.cantidad}" min="1" onchange="cambiarCantidad(${index}, this.value)"></p>
                            <p><strong>Subtotal: $${subtotal.toFixed(2)}</strong></p>
                            <button onclick="eliminarProducto(${index})">Eliminar</button>
                            <hr>
                        </div>
                    `;
                }
            });

            html += `<h2>Total: $${total.toFixed(2)}</h2>`;
            lista.innerHTML = html;
        });
});

function cambiarCantidad(index, nuevaCantidad) {
    let carrito = JSON.parse(localStorage.getItem("carrito")) || [];
    carrito[index].cantidad = parseInt(nuevaCantidad);
    localStorage.setItem("carrito", JSON.stringify(carrito));
    location.reload();
}

function eliminarProducto(index) {
    let carrito = JSON.parse(localStorage.getItem("carrito")) || [];
    carrito.splice(index, 1);
    localStorage.setItem("carrito", JSON.stringify(carrito));
    location.reload();
}

function vaciarCarrito() {
    localStorage.removeItem("carrito");
    location.reload();
}

function confirmarCompra() {
    const carrito = JSON.parse(localStorage.getItem("carrito")) || [];

    if (carrito.length === 0) {
        alert("Tu carrito está vacío.");
        return;
    }

    fetch("php/guardar_compra.php", {
        method: "POST",
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(carrito)
    })
    .then(res => res.text())
    .then(msg => {
        alert(msg);
        vaciarCarrito();
    });
}

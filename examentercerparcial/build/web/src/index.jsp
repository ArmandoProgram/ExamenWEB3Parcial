<%-- 
    Document   : index
    Created on : 13/11/2024, 06:54:34 PM
    Author     : arman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Formulario </title>
  <script>
    function validarFormulario(event) {
      const nombre = document.getElementById("nombre").value.trim();
      const apellido = document.getElementById("apellido").value.trim();
      const email = document.getElementById("email").value.trim();
      const telefono = document.getElementById("telefono").value.trim();
      const direccion = document.getElementById("direccion").value.trim();

      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      const telefonoRegex = /^[0-9]{10}$/;

      if (!nombre) {
        alert("El campo 'Nombre' es obligatorio.");
        event.preventDefault();
        return false;
      }

      if (!apellido) {
        alert("El campo 'Apellido' es obligatorio.");
        event.preventDefault();
        return false;
      }

      if (!emailRegex.test(email)) {
        alert("Por favor, ingrese un correo electrónico válido.");
        event.preventDefault();
        return false;
      }

      if (!telefonoRegex.test(telefono)) {
        alert("Por favor, ingrese un número de teléfono válido (10 dígitos).");
        event.preventDefault();
        return false;
      }

      if (!direccion) {
        alert("El campo 'Dirección' es obligatorio.");
        event.preventDefault();
        return false;
      }
      
      return true;
    }
  </script>
</head>
<body>
  <form action="../miservlet" method="POST" onsubmit="return validarFormulario(event)">
    <label>Nombre: <input type="text" id="nombre" name="nombre" required></label><br>
    <label>Apellido: <input type="text" id="apellido" name="apellido" required></label><br>
    <label>Email: <input type="email" id="email" name="email" required></label><br>
    <label>Teléfono: <input type="text" id="telefono" name="telefono" maxlength="10" required></label><br>
    <label>Dirección: <input type="text" id="direccion" name="direccion" required></label><br>
    <button type="submit">Enviar</button>
  </form>
</body>

<style>
    /* Estilo para el cuerpo y la estructura general */
body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f9;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

/* Estilo para el contenedor del formulario */
form {
    background-color: #ffffff;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 400px;
}

/* Títulos y etiquetas */
h2 {
    font-size: 2rem;
    color: #4e73df;
    text-align: center;
    margin-bottom: 20px;
}

/* Estilo para las etiquetas de los campos */
label {
    display: block;
    font-size: 1rem;
    color: #333;
    margin-bottom: 8px;
}

/* Estilo para los campos de entrada */
input[type="text"], input[type="email"], input[type="number"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 1rem;
    box-sizing: border-box;
}

/* Foco en los campos de entrada */
input[type="text"]:focus, input[type="email"]:focus {
    border-color: #4e73df;
    outline: none;
}

/* Estilo para el botón */
button[type="submit"] {
    width: 100%;
    padding: 12px;
    background-color: #4e73df;
    color: white;
    border: none;
    font-size: 1.1rem;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.3s ease;
}

/* Efecto hover en el botón */
button[type="submit"]:hover {
    background-color: #1cc88a;
    transform: translateY(-2px);
}

/* Estilo para los mensajes de alerta */
.alert {
    color: red;
    font-size: 0.9rem;
    margin-top: 10px;
}

</style>
</html>


<%-- 
    Document   : verBean
    Created on : 13/11/2024, 07:15:28 PM
    Author     : arman
--%>
<%@ page import="servlets.MiBean" %>
<%@ page import="servlets.ListaMiBean" %>
<jsp:useBean id="listaMiBean" class="servlets.ListaMiBean" scope="session" />

<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mostrar Registros</title>
    <style>
        /* Estilo general para el cuerpo y la estructura */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }

        /* Estilo para el contenedor de los datos */
        .container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 800px;
        }

        /* Títulos y etiquetas */
        h2 {
            font-size: 2rem;
            color: #4e73df;
            text-align: center;
            margin-bottom: 20px;
        }

        /* Estilo para la lista */
        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            background-color: #f9f9f9;
            padding: 15px;
            margin-bottom: 10px;
            border-radius: 8px;
            border: 1px solid #ddd;
            transition: background-color 0.3s ease;
        }

        /* Efecto de hover en los elementos de la lista */
        li:hover {
            background-color: #e9ecef;
        }

        /* Estilo para los elementos dentro de la lista */
        li br {
            margin-bottom: 5px;
        }

        /* Estilo para el mensaje de "No hay datos" */
        p {
            color: #e74a3b;
            font-size: 1.2rem;
            text-align: center;
        }

        /* Estilo para el botón de regresar */
        .btn-regresar {
            display: block;
            width: 100%;
            padding: 12px;
            text-align: center;
            font-size: 1rem;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            margin-top: 20px;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        /* Efecto de hover para el botón */
        .btn-regresar:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Datos Almacenados</h2>

        <ul>
            <%
                // Obtener la lista de datos almacenados en el session bean
                if (listaMiBean != null && !listaMiBean.getListaDatos().isEmpty()) {
                    for (MiBean bean : listaMiBean.getListaDatos()) {
            %>
                <li>
                    <strong>Nombre:</strong> <%= bean.getNombre() %><br>
                    <strong>Apellido:</strong> <%= bean.getApellido() %><br>
                    <strong>Email:</strong> <%= bean.getEmail() %><br>
                    <strong>Teléfono:</strong> <%= bean.getTelefono() %><br>
                    <strong>Dirección:</strong> <%= bean.getDireccion() %><br>
                </li>
            <%
                    }
                } else {
            %>
                <p>No hay datos almacenados.</p>
            <%
                }
            %>
        </ul>

        <!-- Botón de regresar utilizando <a> -->
        <a href="mostrar.jsp" class="btn-regresar">Regresar a la Página Principal</a>
    </div>
</body>
</html>

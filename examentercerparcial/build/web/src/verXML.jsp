<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mostrar XML</title>
    <style>
        /* Estilo general para el cuerpo y la estructura */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            color: #333;
        }

        /* Contenedor de la tabla */
        .container {
            width: 80%;
            max-width: 900px;
            margin: 20px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        /* Títulos */
        h3 {
            color: #4e73df;
            font-size: 1.8rem;
            text-align: center;
            margin-bottom: 20px;
        }

        /* Estilo de la tabla */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4e73df;
            color: white;
            font-weight: bold;
        }

        /* Filas alternas con diferente color */
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        /* Hover en las filas de la tabla */
        tr:hover {
            background-color: #e9ecef;
        }

        /* Botón de regreso */
        .btn-regresar {
            display: inline-block;
            padding: 12px 20px;
            margin-top: 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            text-align: center;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-regresar:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h3>Información de los usuarios:</h3>
        
        <%
            String xmlPath = "file:///C:/holamuchacho/usuarios.xml";
        %>
        <c:import var="xmlData" url="<%= xmlPath %>" />
        <x:parse xml="${xmlData}" var="output" />

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Email</th>
                    <th>Teléfono</th>
                    <th>Dirección</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="usuario" items="${output/Usuarios/Usuario}">
                    <tr>
                        <td><x:out select="$usuario/ID" /></td>
                        <td><x:out select="$usuario/Nombre" /></td>
                        <td><x:out select="$usuario/Apellido" /></td>
                        <td><x:out select="$usuario/Email" /></td>
                        <td><x:out select="$usuario/Telefono" /></td>
                        <td><x:out select="$usuario/Direccion" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Botón de regreso -->
        <a href="index.jsp" class="btn-regresar">Regresar a la Página Principal</a>
    </div>
</body>
</html>

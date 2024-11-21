<%-- 
    Document   : mostrar
    Created on : 13/11/2024, 07:04:49 PM
    Author     : arman
--%>
<%@ page import="java.sql.*" %>
<%@ page import="configuration.ConnectionBD" %>
<html>
<head>
    <title>Mostrar Registros</title>
    <!-- Enlace a Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">
</head>
<body>
            <h2>Lista de Registros</h2>

    <div class="container">
        <div class="table-container">
            <table class="table table-striped  table-bordered table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ConnectionBD connectionBD = new ConnectionBD();
                        Connection conn = connectionBD.getConnectionBD();
                        String sql = "SELECT * FROM mi_tabla";
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery(sql);
                        while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getString("id") %></td>
                        <td><%= rs.getString("nombre") %></td>
                    </tr>
                    <%
                        }
                        conn.close();
                    %>
                </tbody>
            </table>
        </div>

        <!-- Formularios a la derecha -->
        <div class="forms-container">
            <form action="verBean.jsp" method="GET">
                                            <h3>Mostrar Datos del Bean</h3>

                <button type="submit" class="btn btn-primary btn-sm rounded">Ver Datos en Bean</button>
            </form>

            <form action="<%= request.getContextPath() %>/crear_xml_servlet" method="get">
                            <h3>Generar XML desde la Base de Datos</h3>

                <button type="submit" class="btn btn-primary btn-sm rounded">Generar XML</button>
            </form>

            <form action="<%= request.getContextPath() %>/verxml" method="GET">
                            <h3>Mostrar XML desde la Base de Datos</h3>

                <button type="submit" class="btn btn-primary btn-sm rounded">Mostrar XML</button>
            </form>
        </div>
    </div>
</body>

<style>
    h2 {
    font-family: 'Arial', sans-serif; /* Fuente clara y moderna */
    font-size: 2rem; /* Tamaño de fuente mayor */
    color: #333; /* Color oscuro para el texto */
    text-align: center; /* Centrado del texto */
    padding: 10px; /* Espaciado alrededor del título */
    margin-bottom: 30px; /* Espacio debajo del título */
    background: linear-gradient(45deg, #4e73df, #1cc88a); /* Degradado de color */
    color: white; /* Color de texto blanco */
    border-radius: 10px; /* Bordes redondeados */
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); /* Sombra sutil */
    text-transform: uppercase; /* Texto en mayúsculas */
    letter-spacing: 2px; /* Espaciado entre letras */
    transition: all 0.3s ease; /* Transición suave para los efectos */
}

/* Efecto al pasar el mouse */
h2:hover {
    transform: translateY(-5px); /* Mueve el título ligeramente hacia arriba */
    box-shadow: 0px 10px 15px rgba(0, 0, 0, 0.2); /* Sombra más fuerte al pasar el mouse */
    cursor: pointer; /* Cambia el cursor a mano */
}

/* Estilo general para la sección que contiene la tabla y los formularios */
.container {
    display: flex; /* Usamos flexbox para alineación */
    justify-content: space-between; /* Coloca la tabla a la izquierda y los formularios a la derecha */
    align-items: flex-start; /* Alineación de los elementos en la parte superior */
    gap: 30px; /* Espacio entre la tabla y los formularios */
}

/* Estilo para el formulario */
form {
    background-color: #f8f9fa;
    border-radius: 8px;
    padding: 20px;
    margin-bottom: 20px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    transition: box-shadow 0.3s ease;
}

/* Efecto de hover para el formulario */
form:hover {
    box-shadow: 0px 8px 12px rgba(0, 0, 0, 0.2);
}

/* Estilo para los títulos h3 */
h3 {
    font-family: 'Arial', sans-serif;
    font-size: 1.5rem;
    color: #4e73df;
    text-align: left;
    margin-bottom: 10px;
    text-transform: uppercase;
    letter-spacing: 1px;
}

/* Estilo para los botones */
button {
    background-color: #4e73df;
    color: white;
    border: none;
    padding: 10px 20px;
    font-size: 1rem;
    border-radius: 30px;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.3s ease;
}

button:hover {
    background-color: #1cc88a;
    transform: translateY(-3px);
}

button.btn-sm {
    padding: 8px 16px;
    font-size: 0.9rem;
}

    
</style>
</html>

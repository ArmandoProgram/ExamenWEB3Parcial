/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import configuration.ConnectionBD;

@WebServlet(name = "CrearXMLServlet", urlPatterns = {"/crear_xml_servlet"})
public class CrearXMLServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            // Obtener la conexión de la clase ConnectionBD
            ConnectionBD connectionBD = new ConnectionBD();
            try (Connection conn = connectionBD.getConnectionBD()) {
                String sql = "SELECT * FROM mi_tabla";
                try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {

                    // Crear el documento XML
                    DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
                    DocumentBuilder builder = factory.newDocumentBuilder();
                    Document document = builder.newDocument();

                    // Nodo raíz
                    Element root = document.createElement("Usuarios");
                    document.appendChild(root);

                    // Recorrer los resultados de la base de datos
                    while (rs.next()) {
                        Element usuarioElement = document.createElement("Usuario");

                        Element idElement = document.createElement("ID");
                        idElement.appendChild(document.createTextNode(rs.getString("id")));
                        usuarioElement.appendChild(idElement);

                        Element nombreElement = document.createElement("Nombre");
                        nombreElement.appendChild(document.createTextNode(rs.getString("nombre")));
                        usuarioElement.appendChild(nombreElement);

                        Element apellidoElement = document.createElement("Apellido");
                        apellidoElement.appendChild(document.createTextNode(rs.getString("apellido")));
                        usuarioElement.appendChild(apellidoElement);

                        Element emailElement = document.createElement("Email");
                        emailElement.appendChild(document.createTextNode(rs.getString("email")));
                        usuarioElement.appendChild(emailElement);

                        Element telefonoElement = document.createElement("Telefono");
                        telefonoElement.appendChild(document.createTextNode(rs.getString("telefono")));
                        usuarioElement.appendChild(telefonoElement);

                        Element direccionElement = document.createElement("Direccion");
                        direccionElement.appendChild(document.createTextNode(rs.getString("direccion")));
                        usuarioElement.appendChild(direccionElement);

                        root.appendChild(usuarioElement);
                    }

                    // Guardar el documento XML en un archivo
                    TransformerFactory transformerFactory = TransformerFactory.newInstance();
                    Transformer transformer = transformerFactory.newTransformer();
                    DOMSource source = new DOMSource(document);

                    File file = new File("C://holamuchacho/usuarios.xml");
                    StreamResult result = new StreamResult(file);
                    transformer.transform(source, result);

                    out.println("<p>Archivo XML generado con éxito en: " + file.getAbsolutePath() + "</p>");
                }
            }
        } catch (Exception e) {
            response.getWriter().println("Ocurrió un error: " + e.getMessage());
            e.printStackTrace();
        }
    }
}

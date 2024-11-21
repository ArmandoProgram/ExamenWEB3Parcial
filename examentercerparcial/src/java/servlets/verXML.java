/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

/**
 * Servlet que muestra el contenido de un archivo XML generado a partir de la base de datos.
 */
@WebServlet(name = "verXML", urlPatterns = {"/verxml"})
public class verXML extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            File file = new File("C://holamuchacho/usuarios.xml");
            if (file.exists()) {
                // Crear DocumentBuilder para leer el XML
                DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
                DocumentBuilder builder = factory.newDocumentBuilder();
                Document document = builder.parse(file);

                // Normalizar el documento
                document.getDocumentElement().normalize();

                // Obtener la raíz y los elementos del XML
                Element root = document.getDocumentElement();
                NodeList usuarios = root.getElementsByTagName("Usuario");

                // Generar salida HTML
                out.println("<html>");
                out.println("<head><title>Usuarios desde XML</title></head>");
                out.println("<body>");
                out.println("<h2>Usuarios almacenados en el XML</h2>");
                out.println("<table border='1'>");
                out.println("<tr>");
                out.println("<th>ID</th>");
                out.println("<th>Nombre</th>");
                out.println("<th>Apellido</th>");
                out.println("<th>Email</th>");
                out.println("<th>Teléfono</th>");
                out.println("<th>Dirección</th>");
                out.println("</tr>");

                // Recorrer todos los nodos de usuario
                for (int i = 0; i < usuarios.getLength(); i++) {
                    Node usuario = usuarios.item(i);
                    if (usuario.getNodeType() == Node.ELEMENT_NODE) {
                        Element usuarioElement = (Element) usuario;

                        String id = usuarioElement.getElementsByTagName("ID").item(0).getTextContent();
                        String nombre = usuarioElement.getElementsByTagName("Nombre").item(0).getTextContent();
                        String apellido = usuarioElement.getElementsByTagName("Apellido").item(0).getTextContent();
                        String email = usuarioElement.getElementsByTagName("Email").item(0).getTextContent();
                        String telefono = usuarioElement.getElementsByTagName("Telefono").item(0).getTextContent();
                        String direccion = usuarioElement.getElementsByTagName("Direccion").item(0).getTextContent();

                        out.println("<tr>");
                        out.println("<td>" + id + "</td>");
                        out.println("<td>" + nombre + "</td>");
                        out.println("<td>" + apellido + "</td>");
                        out.println("<td>" + email + "</td>");
                        out.println("<td>" + telefono + "</td>");
                        out.println("<td>" + direccion + "</td>");
                        out.println("</tr>");
                    }
                }

                out.println("</table>");
                out.println("</body>");
                out.println("</html>");
            } else {
                // Archivo XML no encontrado
                out.println("<html>");
                out.println("<head><title>Error</title></head>");
                out.println("<body>");
                out.println("<h2>Error</h2>");
                out.println("<p>El archivo XML no existe. Genera el archivo antes de intentar verlo.</p>");
                out.println("</body>");
                out.println("</html>");
            }
        } catch (Exception e) {
            response.getWriter().println("Ocurrió un error al leer el archivo XML: " + e.getMessage());
            e.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "Muestra los datos desde el archivo XML generado";
    }
}

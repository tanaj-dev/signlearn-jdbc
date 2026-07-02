import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.sql.*;

@WebServlet("/registro")
public class RegistroServlet extends HttpServlet {

    private static final String DB_URL  = "jdbc:mysql://zephyr.proxy.rlwy.net:51879/railway";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "bmaZRFlqDDKnlXvNMuHYsfpvwBHVWyMM";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String documento = request.getParameter("documento");
        String nombres   = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String correo    = request.getParameter("correo");
        String telefono  = request.getParameter("telefono");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new ServletException("Driver no encontrado", e);
        }
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
            String sqlV = "SELECT id FROM usuarios WHERE documento = ? OR correo = ?";
            PreparedStatement psV = conn.prepareStatement(sqlV);
            psV.setString(1, documento);
            psV.setString(2, correo);
            ResultSet rs = psV.executeQuery();
            if (rs.next()) {
                request.setAttribute("mensaje", "El documento o correo ya esta registrado.");
                request.setAttribute("exito", false);
            } else {
                String sqlI = "INSERT INTO usuarios (documento, nombres, apellidos, correo, telefono) VALUES (?, ?, ?, ?, ?)";
                PreparedStatement psI = conn.prepareStatement(sqlI);
                psI.setString(1, documento);
                psI.setString(2, nombres);
                psI.setString(3, apellidos);
                psI.setString(4, correo);
                psI.setString(5, telefono);
                psI.executeUpdate();
                request.setAttribute("mensaje", "Usuario registrado exitosamente!");
                request.setAttribute("exito", true);
            }
        } catch (SQLException e) {
            request.setAttribute("mensaje", "Error: " + e.getMessage());
            request.setAttribute("exito", false);
        }
        request.getRequestDispatcher("/registro.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/registro.jsp").forward(request, response);
    }
}
package cn.techtutorial.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RemoveProductServlet")
@MultipartConfig(maxFileSize = 16177215) // upload file's size up to 16MB
public class RemoveProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Database connection settings
    private String dbURL = "jdbc:mysql://localhost:3307/login";
    private String dbUser = "root";
    private String dbPass = "12345";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productName = request.getParameter("productName");
        Connection conn = null;
        String message = null;

        try {
            // Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // SQL statement
            String sql = "DELETE FROM products WHERE name = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, productName);

            // Execute SQL statement
            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                message = "Products with name \"" + productName + "\" removed successfully!";
            } else {
                message = "No products found with the name \"" + productName + "\".";
            }
        } catch (SQLException | ClassNotFoundException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            request.setAttribute("Message", message);
            request.getRequestDispatcher("/message.jsp").forward(request, response);
        }
    }
}
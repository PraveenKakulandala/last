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

@WebServlet("/AddProductServlet")
@MultipartConfig(maxFileSize = 16177215) // upload file's size up to 16MB
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Database connection settings
    private String dbURL = "jdbc:mysql://localhost:3307/login";
    private String dbUser = "root";
    private String dbPass = "12345";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("productId");
        String productName = request.getParameter("productName");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        
        String image =  request.getParameter("image");
       
        Connection conn = null;
        String message = null;

        try {
            // Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // SQL statement
            String sql = "INSERT INTO products (id, name, category, price, image) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, productId);
            statement.setString(2, productName);
            statement.setString(3, category);
            statement.setDouble(4, price);
            statement.setString(5, image);

            // Execute SQL statement
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "Product added successfully!";
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
            getServletContext().getRequestDispatcher("/message.jsp").forward(request, response);
        }
    }
}
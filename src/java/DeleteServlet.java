/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author USER
 */
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    
    private static final String DB_URL = "jdbc:derby://localhost:1527/studentProfiles";
    private static final String DB_USER = "app";
    private static final String DB_PASSWORD = "app";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String id = request.getParameter("id");
        String studentName = "";
        boolean success = false;
        String message = "";
        
        if (id == null || id.trim().isEmpty()) {
            message = "Error: No profile ID specified.";
        } else {
            Connection conn = null;
            PreparedStatement getNameStmt = null;
            PreparedStatement deleteStmt = null;
            ResultSet rs = null;
            
            try {
                
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                
                
                String getNameSql = "SELECT NAME FROM PROFILES WHERE ID = ?";
                getNameStmt = conn.prepareStatement(getNameSql);
                getNameStmt.setInt(1, Integer.parseInt(id));
                rs = getNameStmt.executeQuery();
                if (rs.next()) {
                    studentName = rs.getString("NAME");  
                }
                
                // Delete the profile
                String deleteSql = "DELETE FROM PROFILES WHERE ID = ?";
                deleteStmt = conn.prepareStatement(deleteSql);
                deleteStmt.setInt(1, Integer.parseInt(id));
                
                int rowsAffected = deleteStmt.executeUpdate();
                
                if (rowsAffected > 0) {
                    success = true;
                    message = "Profile for '" + studentName + "' has been successfully deleted.";
                } else {
                    message = "Profile not found or already deleted.";
                }
                
            } catch (ClassNotFoundException e) {
                message = "Database driver error: " + e.getMessage();
                e.printStackTrace();
            } catch (SQLException e) {
                message = "Database error: " + e.getMessage();
                e.printStackTrace();
            } catch (NumberFormatException e) {
                message = "Invalid profile ID format.";
            } finally {
                // Close all resources
                try {
                    if (rs != null) rs.close();
                    if (getNameStmt != null) getNameStmt.close();
                    if (deleteStmt != null) deleteStmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        
        
        request.setAttribute("success", success);
        request.setAttribute("message", message);
        request.setAttribute("studentName", studentName);
        
        // Forward to delete result page
        request.getRequestDispatcher("deleteResult.jsp").forward(request, response);
    }
}
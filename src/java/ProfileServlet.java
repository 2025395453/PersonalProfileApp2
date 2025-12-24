import beans.ProfileBean;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    
    
    private static final String DB_URL = "jdbc:derby://localhost:1527/studentProfiles";
    private static final String DB_USER = "app";
    private static final String DB_PASSWORD = "app";
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Get form parameters
        String name = request.getParameter("name");
        String studentId = request.getParameter("studentId");
        String program = request.getParameter("program");
        String email = request.getParameter("email");
        String hobbies = request.getParameter("hobbies");
        String intro = request.getParameter("intro");
        
        // 2. Create ProfileBean object using input data
        ProfileBean profile = new ProfileBean();
        profile.setName(name);
        profile.setStudentId(studentId);
        profile.setProgram(program);
        profile.setEmail(email);
        profile.setHobbies(hobbies);
        profile.setIntro(intro);
        
        // 3. Insert into database using JDBC
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean success = false;
        String message = "";
        
        try {
            // Load Derby JDBC driver
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            
            // Establish connection
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            
            // SQL INSERT statement
            // Update the INSERT statement
String sql = "INSERT INTO PROFILES (NAME, STUDENT_ID, PROGRAM, EMAIL, HOBBIES, INTRO) " +
             "VALUES (?, ?, ?, ?, ?, ?)";
            
            // Create prepared statement
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, profile.getName());
            pstmt.setString(2, profile.getStudentId());
            pstmt.setString(3, profile.getProgram());
            pstmt.setString(4, profile.getEmail());
            pstmt.setString(5, profile.getHobbies());
            pstmt.setString(6, profile.getIntro());
            
            // Execute insert
            int rowsAffected = pstmt.executeUpdate();
            
            if (rowsAffected > 0) {
                success = true;
                message = "Profile saved successfully to database!";
            } else {
                message = "Failed to save profile. No rows affected.";
            }
            
        } catch (ClassNotFoundException e) {
            message = "JDBC Driver not found: " + e.getMessage();
            e.printStackTrace();
        } catch (SQLException e) {
            message = "Database error: " + e.getMessage();
            
            // Check for duplicate student ID
            if (e.getSQLState().equals("23505")) { // SQLState for unique constraint violation
                message = "Error: Student ID already exists!";
            }
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        // 4. Set attributes for JSP page
        request.setAttribute("profile", profile); // Pass the whole bean
        request.setAttribute("message", message);
        request.setAttribute("success", success);
        
        // Also set individual attributes for backward compatibility
        request.setAttribute("name", profile.getName());
        request.setAttribute("studentId", profile.getStudentId());
        request.setAttribute("program", profile.getProgram());
        request.setAttribute("email", profile.getEmail());
        request.setAttribute("hobbies", profile.getHobbies());
        request.setAttribute("intro", profile.getIntro());
        
        // 5. Forward to JSP
        RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
        rd.forward(request, response);
    }
}
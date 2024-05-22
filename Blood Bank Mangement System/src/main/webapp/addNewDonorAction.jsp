<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String father = request.getParameter("father");
String mother = request.getParameter("mother");
String mobilenumber = request.getParameter("mobilenumber");
String gender = request.getParameter("gender");
String email = request.getParameter("email"); // Add this line
String bloodgroup = request.getParameter("bloodgroup");
String address = request.getParameter("address");
try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("INSERT INTO donor (id, name, father, mother, mobilenumber, gender, email, bloodgroup, address) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
    ps.setString(1, id);
    ps.setString(2, name);
    ps.setString(3, father);
    ps.setString(4, mother);
    ps.setString(5, mobilenumber);
    ps.setString(6, gender);
    ps.setString(7, email); // Add this line
    ps.setString(8, bloodgroup);
    ps.setString(9, address);
    int rowsAffected = ps.executeUpdate();
    if (rowsAffected > 0) {
        response.sendRedirect("addNewDonor.jsp?msg=valid");
    } else {
        response.sendRedirect("addNewDonor.jsp?msg=invalid");
    }
} catch (Exception e) {
    e.printStackTrace(); // Print the exception for debugging purposes
    response.sendRedirect("addNewDonor.jsp?msg=invalid");
}
%>

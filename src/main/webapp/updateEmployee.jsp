<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Update Employee</title>
<link rel="stylesheet" href="style.css">
</head>

<body>

<div class="form-container large">
    <h2>Update Employee</h2>

    <!-- Search Section -->
    <form method="GET" action="updateEmployee.jsp">
        <input type="text" name="empId" placeholder="Enter Employee ID" required>
        <button type="submit" class="btn">Search</button>
        <a href="index.jsp" class="back">Back</a>
    </form>
    <br><br>

<%
    String empId = request.getParameter("empId");
    String method = request.getMethod();

    /* =============================
       1. SEARCH EMPLOYEE (GET)
       ============================= */
    if ("GET".equalsIgnoreCase(method) && empId != null) {

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            con = DriverManager.getConnection(
                 "jdbc:mysql://localhost:3306/43r","root","root18");

            String sql = "SELECT empId, empName, email, department, salary FROM employee WHERE empId=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, empId);

            rs = pstmt.executeQuery();

            if (rs.next()) {
%>

    <!-- Update Form -->
    <form method="POST" action="updateEmployee.jsp">

        <input type="text" name="empId" value="<%= rs.getString("empId") %>" readonly>

        <input type="text" name="empName" value="<%= rs.getString("empName") %>" required>
        <input type="email" name="email" value="<%= rs.getString("email") %>" required>
        <input type="text" name="department" value="<%= rs.getString("department") %>" required>
        <input type="number" name="salary" value="<%= rs.getDouble("salary") %>" required>

        <button type="submit" class="btn">Update</button>
    </form>

<%
            } else {
                out.println("<p>No employee found with ID: " + empId + "</p>");
            }

        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            try { if (rs != null) rs.close(); } catch(Exception ex){}
            try { if (pstmt != null) pstmt.close(); } catch(Exception ex){}
            try { if (con != null) con.close(); } catch(Exception ex){}
        }
    }

    /* =============================
       2. UPDATE EMPLOYEE (POST)
       ============================= */
    if ("POST".equalsIgnoreCase(method)) {

        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection con = null;
        PreparedStatement up = null;

        try {
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/43r","root","root18");

            String sqlUpdate = 
                "UPDATE employee SET empName=?, email=?, department=?, salary=? WHERE empId=?";

            up = con.prepareStatement(sqlUpdate);

            up.setString(1, request.getParameter("empName"));
            up.setString(2, request.getParameter("email"));
            up.setString(3, request.getParameter("department"));
            up.setDouble(4, Double.parseDouble(request.getParameter("salary")));
            up.setString(5, request.getParameter("empId"));

            int row = up.executeUpdate();

            if (row > 0) {
                out.println("<p>Employee Updated Successfully</p>");
            } else {
                out.println("<p>No employee found. Update failed.</p>");
            }

        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            try { if (up != null) up.close(); } catch(Exception ex){}
            try { if (con != null) con.close(); } catch(Exception ex){}
        }
    }
%>

</div>

</body>
</html>

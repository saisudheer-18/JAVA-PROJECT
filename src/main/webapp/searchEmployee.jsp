<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Search Employee</title>
<link rel="stylesheet" href="style.css">
</head>

<body>

<div class="form-container large">   
    <h2>Search Employee</h2>

    <form action="searchEmployee.jsp" method="POST">
        <input type="text" name="empId" placeholder="Enter Employee ID" required>
        <button type="submit" class="btn">Search</button>
        <a href="index.jsp" class="back">Back</a>
    </form>

<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {

        String empId = request.getParameter("empId");

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/43r", "root", "root18");

            String sql = "SELECT empId, empName, email, department, salary FROM employee WHERE empId=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, empId);

            rs = pstmt.executeQuery();

            if (rs.next()) {
%>

    <div class="table-wrapper">
        <table>
            <tr>
                <th>EMP ID</th>
                <th>EMP NAME</th>
                <th>EMAIL</th>
                <th>DEPARTMENT</th>
                <th>SALARY</th>
            </tr>

            <%
                do {
            %>
                <tr>
                    <td><%= rs.getString("empId") %></td>
                    <td><%= rs.getString("empName") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("department") %></td>
                    <td><%= rs.getDouble("salary") %></td>
                </tr>
            <%
                } while (rs.next());
            %>

        </table>
    </div>

<%
            } else {
                out.println("<p>No employee found with ID: " + empId + "</p>");
            }

        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception ex) {}
            try { if (pstmt != null) pstmt.close(); } catch (Exception ex) {}
            try { if (con != null) con.close(); } catch (Exception ex) {}
        }
    }
%>

</div>

</body>
</html>

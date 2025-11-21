<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>All Employees</title>
<link rel="stylesheet" href="style.css">
</head>

<body>
<div class="form-container large">

    <h2>All Employees</h2>

    <a href="index.jsp" class="back">Back</a>
    <br><br>

<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/43r", "root", "root18");

        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM employee");

        if (!rs.isBeforeFirst()) {
            out.println("<p>No employees found in the database.</p>");
        } else {
%>
    <table border="1" cellpadding="10">
        <tr>
            <th>EMP ID</th>
            <th>EMP NAME</th>
            <th>EMAIL</th>
            <th>DEPARTMENT</th>
            <th>SALARY</th>
        </tr>

        <%
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("empId") %></td>
            <td><%= rs.getString("empName") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("department") %></td>
            <td><%= rs.getDouble("salary") %></td>
        </tr>
        <%
            }
        %>

    </table>

<%
        }

        con.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

</div>
</body>
</html>

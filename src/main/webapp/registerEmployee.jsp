<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Register Employee</title>
<link rel="stylesheet" href="style.css">
</head>
<body>

<div class="form-container">
    <h2>Register Employee</h2>

    <form action="registerEmployee.jsp" method="post">

        <input type="text" name="empId" placeholder="Employee ID" required>
        <input type="text" name="empName" placeholder="Employee Name" required>
        <input type="email" name="email" placeholder="Email" required>
        <input type="text" name="department" placeholder="Department" required>
        <input type="number" name="salary" placeholder="Salary" required>

        <button type="submit" class="btn primary">Register</button>
        <a href="index.jsp" class="back">Back</a>
    </form>

    <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {

            String empId = request.getParameter("empId");
            String empName = request.getParameter("empName");
            String email = request.getParameter("email");
            String department = request.getParameter("department");
            String salaryStr = request.getParameter("salary");

            Connection con = null;
            PreparedStatement pstmt = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/43r", "root", "root18");

                // Correct: Always specify column names
                String sql = "INSERT INTO employee (empId, empName, email, department, salary) VALUES (?, ?, ?, ?, ?)";
                pstmt = con.prepareStatement(sql);

                pstmt.setString(1, empId);
                pstmt.setString(2, empName);
                pstmt.setString(3, email);
                pstmt.setString(4, department);
                pstmt.setInt(5, Integer.parseInt(salaryStr));

                pstmt.executeUpdate();

                out.println("<p class='success'>Employee Registered Successfully!</p>");

            } catch (Exception e) {
                out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
            } finally {
                try { if (pstmt != null) pstmt.close(); } catch(Exception ex) {}
                try { if (con != null) con.close(); } catch(Exception ex) {}
            }
        }
    %>

</div>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Delete Employee</title>
<link rel="stylesheet" href="style.css">
</head>
<body>

	<div class="form-container">
		<h2>Delete Employee</h2>

		<form action="deleteEmployee.jsp" method="POST">
			<input type="text" name="empId" placeholder="Enter Employee ID"
				required>

			<button type="submit" class="btn delete">Delete</button>
			<a href="index.jsp" class="back">Back</a>
		</form>
		<%
		if(request.getMethod().equals("POST")){
			int row=0;
			try{
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/43r","root","root18");
			PreparedStatement pstmt=con.prepareStatement("delete from employee where empId=?");
			pstmt.setString(1,request.getParameter("empId"));
			row=pstmt.executeUpdate();
			pstmt.close();
			con.close();
		}catch(Exception e){
				out.println("Error: "+e.getMessage());
			}
			if(row>0){
				out.println("Deleted Successfully");
			}
			else{
				out.println("Error Is Occur In The Check Once");
			}
			
			}			
		%>

	</div>
</body>
</html>

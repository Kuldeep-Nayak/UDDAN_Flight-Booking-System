<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validating...</title>
</head>
<body>
<%
String email = request.getParameter("Email");
String pass = request.getParameter("Password");

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system", "deep2702");
	
	String qry = "select * from demo where email = ? and pass = ?";
	PreparedStatement psmt = con.prepareStatement(qry);
	psmt.setString(1, email);
    psmt.setString(2, pass);
    ResultSet rs = psmt.executeQuery();
	if(rs.next()){
			session.setAttribute("email", email);
			response.sendRedirect("book.html");
			out.print("Matched");
		
			
		}
	else{
		out.println("<script>alert('Invalid credentials. Please try again.'); window.location='signin.html';</script>");
	}
	rs.close();
	psmt.close();
	con.close();
	
	}catch(Exception e){
		System.out.println(e);
	} %>
</body>
</html>
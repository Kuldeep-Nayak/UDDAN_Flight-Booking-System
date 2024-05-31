<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String name = request.getParameter("Name");
	String email = request.getParameter("Email");
	String pass = request.getParameter("Password");
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system", "deep2702");
		
		String qry = "insert into demo values('"+name+"','"+email+"','"+pass+"')";
		Statement smt = con.createStatement();
		int i = smt.executeUpdate(qry);
		if(i>0){
				out.println("<script>alert('Registration Successful.'); window.location='signin.html';</script>");
		}else{
			out.println("<script>alert('Registration Failed.'); window.location='signup.html';</script>");
		}
		smt.cancel();
		con.close();
	}catch(Exception e){
	 %> <%=e %><%
	}	
%>
</body>
</html>
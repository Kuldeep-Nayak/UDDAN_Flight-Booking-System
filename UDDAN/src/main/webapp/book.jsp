<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
    <%
    	String from = (String)request.getParameter("from");
   		String to = (String)request.getParameter("to");
   		int c =0;
   		if(from.equals(to)){
   			out.println("<script>alert('Invalid source and destination.'); window.location='book.html';</script>");
   		}
   			else{
   		try{
   			Class.forName("oracle.jdbc.driver.OracleDriver");
   			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system", "deep2702");
   			
   			String qry = "select * from flightdetails where source = ? and destination = ?";
   			PreparedStatement psmt = con.prepareStatement(qry);
   			psmt.setString(1, from);
   			psmt.setString(2, to);
   			ResultSet rs = psmt.executeQuery();
   			%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Details Of Booking</title>
    <style>
        th, td{
            border: 1px solid black;
            padding: 12px;
            justify-content: space-evenly;
            margin: 0;
            border-radius: 5px; 
        }
        th{
        	background-color: pink;
        	
        }
        td{
        	background-color: bisque;
        }
        .tableContainer{
        	margin: 20%;
        	display: flex;
        	flex-wrap: wrap;
        	border-radius: 5px;
        	
        }
        nav {
  			padding: 2%;
		    display: flex;
		    justify-content: space-around;
		    height: 85px;
		    width: 85%;
		    position: absolute;
		    padding: 0 30px;
		    top: 0;
		    left: 5%;
		    background: #fce5e5;
		    display: flex;
		    flex-wrap: wrap;
		    justify-content: space-between;
		    align-items: center;
		    border-bottom-left-radius: 50px;
		    border-bottom-right-radius: 12px;
		    box-shadow: 12px 10px 10px 0 rgba(0, 0, 0, 0.279);
			}
		nav a {
			color: black;
			text-decoration: none;
		}
		nav a:hover {
			text-decoration: underline;
			color: rgb(140, 34, 240);
			background-color: #eda0c9;
			transform: translate(10px, 20px);
			transform: scale(1,2);
		}
		.web-name{
			color: green;
		}
		body{
			background-image: url(background.jpg);
			background-repeat: no repeat;
			width: 100%;
		    height: 100vh;
		    background-size: cover; 
			background-position: center; 
			padding: 0;
			margin: 0; 
			font-family: "Montserrat", sans-serif;
			font-weight: 500; 	
		}
		.navbar{
			margin-top: 0;
		}
		Button{
			padding-left: 29px; 
			padding-right: 20px;
			background-color: aqua;
			display:flex;
        	flex-wrap: wrap;
			margin-left: 40%;
			margin-bottom: 30%;
			font-size: 20px;
			border-radius: 9px;
			width: 100px;
		}
		Button:hover{
			background-color: lime;
			
		}
    </style>
</head>
<body>
	<div class="navbar">
		<nav>
	      <div class="web-name"><h2>UDDAN</h2></div>
	      <a href="./index.html">Home</a>
	      <a href="./signup.html">Sign Up</a>
	      <a href="./signin.html">Sign In</a>
	    </nav>
	</div> 
    <table class="tableContainer">
        <tr>
            <th>Source</th>
            <th>Destination</th>
            <th>Airline</th>
            <th>Time of Departure</th>
            <th>Flight Duration</th>
            <th>Price</th>
            <th>Payment</th>
        </tr>
        <%
        while(rs.next()){
        	c++;
        	%>
        	
        	<tr>
           <td>
            <%= rs.getString("source") %>
           </td><td>
            <%= rs.getString("destination") %>
           </td>
           <td>
            <%= rs.getString("airline") %>
           </td>
           <td>
            <%= rs.getString("tod") %>
           </td>
           <td>
            <%= rs.getString("fldur") %>
           </td>
           <td>
            <%= rs.getString("price") %>
           </td>
           <td>
           		<a href="payment.html">Pay</a>
           </td>
        </tr>
        	<%
        }if(c==0){
        //	out.print("No flight available"); %>
        	<script>
        	alert("No flights Available")
        	</script>
        	<% 
        } 
        %>
        
    </table>
</body>
</html>

<%
rs.close();
psmt.close();
con.close();
   		}catch(Exception e){
   			out.print(e);
   		}}
    %>
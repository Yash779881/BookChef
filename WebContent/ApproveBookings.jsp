<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="database.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Approve Bookings</title>
</head>
<body>
			<% 
			try
			{
				String bid = request.getParameter("id");
				Connection con = ConnectDB.dbCon();
				PreparedStatement ps = con.prepareStatement("update bookings_db set status=? where bid=?");
				ps.setString(1,"Approved");
				ps.setInt(2,Integer.parseInt(bid));
				int i = ps.executeUpdate();
				if(i>0){
					response.sendRedirect("ViewPendingBookings.jsp");
				}else{
					response.sendRedirect("error.html");
				}
			}
		catch(Exception e){
			e.printStackTrace();
		}
		%>							
		
</body>
</html>
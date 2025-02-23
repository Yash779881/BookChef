<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="database.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Approve User</title>
</head>
<body>
			<% 
			try
			{
				String cid = request.getParameter("id");
				Connection con = ConnectDB.dbCon();
				PreparedStatement ps = con.prepareStatement("update chef_db set cstatus=? where cid=?");
				ps.setString(1,"Disapproved");
				ps.setInt(2,Integer.parseInt(cid));
				int i = ps.executeUpdate();
				if(i>0){
					response.sendRedirect("ViewPendingChef.jsp");
				}else{
					response.sendRedirect("error.html");
				}
			}
		catch(Exception e){
			e.printStackTrace();
		}
		%>							
		</tbody> 
	</table>
</body>
</html>
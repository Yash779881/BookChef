<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="database.*" %>
<%@ page import="services.*" %>
<%@ page import="java.time.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Booking</title>
    <%
    try {
        int bid = 0;
        int uid = GettersSetters.getGetUid();
        int cid = Integer.parseInt(request.getParameter("cid"));
        Connection con = ConnectDB.dbCon();
        PreparedStatement ps = con.prepareStatement("insert into bookings_db values(?,?,?,?,?,?,?)");

        ps.setInt(1, bid);
        ps.setInt(2, uid);
        ps.setInt(3, cid);
        ps.setString(4, "Best Booking");

        // Convert LocalDate and LocalTime to strings
        String currentDate = LocalDate.now().toString();
        String currentTime = LocalTime.now().toString();

        ps.setString(5, currentDate);
        ps.setString(6, currentTime);
        ps.setString(7, "Pending");
        
        int i = ps.executeUpdate();
        if (i > 0) {
            response.sendRedirect("ViewBookingsWithStatus.jsp");
        } else {
            response.sendRedirect("error.html");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    %>
</head>
<body>

</body>
</html>

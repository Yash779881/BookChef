<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="database.*" %>
<%@ page import="services.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Approved Bookings | Chef Dashboard</title>
<style>
    body {
        margin: 0;
        font-family: 'Arial', sans-serif;
        background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
        display: flex;
        height: 100vh;
    }
    .sidebar {
        background: #007BFF;
        width: 250px;
        height: 100%;
        padding: 20px;
        box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        display: flex;
        flex-direction: column;
    }
    .sidebar a {
        display: block;
        color: white;
        padding: 15px;
        text-decoration: none;
        border-radius: 5px;
        margin-bottom: 10px;
        text-align: center;
    }
    .sidebar a:hover {
        background: #0056b3;
    }
    .content {
        flex-grow: 1;
        padding: 20px;
        background: white;
        overflow: auto;
    }
    .content h1 {
        color: #007BFF;
        margin-top: 0;
    }
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        padding: 10px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #007BFF;
        color: white;
    }
    tr:hover {
        background-color: #f5f5f5;
    }
    a {
        color: #007BFF;
        text-decoration: none;
    }
    a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <div class="sidebar">
        <a href="ViewPendingBookings.jsp">View Pending Bookings</a>
        <a href="ViewTodaysBooking.jsp">View Today's Bookings</a>
        <a href="ViewBookingsByDate.jsp">View Bookings By Date</a>
        <a href="ViewApprovedBokings.jsp">View Approved Bookings</a>
        <a href="ViewDisapprovedBookings.jsp">View Disapproved Bookings</a>
        <a href="ChefChangePassword.jsp">Change Password</a>
        <a href="home.html" class="logout">Log Out</a>
    </div>
    <div class="content">
        <h1>Approved Bookings</h1>
        <table class="table table-hover"> 
            <thead> 
                <tr> 
                    <th>Id</th> 
                    <th>User Id</th> 
                    <th>Chef Id</th>
                    <th>Booking Details</th>
                    <th>Booking Date</th>
                    <th>Booking Time</th>
                </tr> 
            </thead> 
            <tbody> 
            <% 
            try {
                int cid = GettersSetters.getGetCid();
                Connection con = ConnectDB.dbCon();
                PreparedStatement ps = con.prepareStatement("select * from bookings_db where status=? and cid=?");
                ps.setString(1, "Approved");
                ps.setInt(2, cid);
                ResultSet i = ps.executeQuery();
                while (i.next()) {
            %>
                <tr>  
                    <td><%=i.getInt(1)%></td> 
                    <td><%=i.getInt(2)%></td> 
                    <td><%=i.getInt(3)%></td> 
                    <td><%=i.getString(4)%></td> 
                    <td><%=i.getString(5)%></td>
                    <td><%=i.getString(6)%></td>
                </tr> 
                <% 
                }
            } catch(Exception e) {
                e.printStackTrace();
            }
            %>                            
            </tbody> 
        </table>
    </div>
</body>
</html>

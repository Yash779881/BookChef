<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="database.*" %>
<%@ page import="services.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>View Bookings With Status</title>
<style>
    body {
        margin: 0;
        font-family: 'Arial', sans-serif;
        background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
        display: flex;
        height: 100vh;
        overflow: hidden;
    }
    .sidebar {
        width: 250px;
        background: #007BFF;
        color: white;
        display: flex;
        flex-direction: column;
        padding: 20px;
    }
    .sidebar a {
        color: white;
        text-decoration: none;
        margin: 10px 0;
        padding: 10px;
        background: rgba(255, 255, 255, 0.1);
        border-radius: 4px;
    }
    .sidebar a:hover {
        background: rgba(255, 255, 255, 0.2);
    }
    .content {
        flex: 1;
        padding: 20px;
        overflow-y: auto;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
        background: white;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        overflow: hidden;
    }
    th, td {
        padding: 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    th {
        background: #007BFF;
        color: white;
    }
    tr:nth-child(even) {
        background: #f2f2f2;
    }
    tr:hover {
        background: #e9f5ff;
    }
</style>
</head>
<body>
    <div class="sidebar">
        <h2>Menu</h2>
        <a href="ViewAllChef.jsp">View All Chef (City Wise)</a>
        <a href="SearchChef.jsp">Search Chef</a>
        <a href="ViewBookingsWithStatus.jsp">View Bookings with Status</a>
        <a href="UserChangePassword.jsp">Change Password</a>
        <a href="home.html">Log Out</a>
    </div>
    <div class="content">
        <h1>View Bookings With Status</h1>
        <table class="table table-hover"> 
            <thead> 
                <tr> 
                    <th>Id</th> 
                    <th>User Id</th>    
                    <th>Chef Id</th> 
                    <th>Booking Details</th>
                    <th>Booking Date</th>
                    <th>Booking Time</th>
                    <th>Status</th>
                </tr> 
            </thead> 
            <tbody> 
            <% 
            try {
                int uid = GettersSetters.getGetUid();
                Connection con = ConnectDB.dbCon();
                PreparedStatement ps = con.prepareStatement("select * from bookings_db where uid=?");
                ps.setInt(1, uid);
                ResultSet i = ps.executeQuery();
                while (i.next()) {
            %>
                <tr>  
                    <td><%= i.getInt(1) %></td> 
                    <td><%= i.getInt(2) %></td> 
                    <td><%= i.getInt(3) %></td> 
                    <td><%= i.getString(4) %></td> 
                    <td><%= i.getString(5) %></td>
                    <td><%= i.getString(6) %></td>
                    <td><%= i.getString(7) %></td>
                </tr> 
            <% 
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            %>                            
            </tbody> 
        </table>
    </div>
</body>
</html>

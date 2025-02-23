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
<title>Change Password | Chef Dashboard</title>
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
    form {
        max-width: 400px;
        margin: 0 auto;
        padding: 20px;
        background: #f9f9f9;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    input[type="password"] {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ddd;
        border-radius: 5px;
    }
    input[type="submit"] {
        background: #007BFF;
        color: white;
        border: none;
        padding: 10px 15px;
        border-radius: 5px;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background: #0056b3;
    }
    h3 {
        color: #007BFF;
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
        <h1>Change Password</h1>
        <form action="ChefChangePassword.jsp" method="post">
            <input type="password" name="coldpass" placeholder="Enter Old Password" required>
            <input type="password" name="cnewpass" placeholder="Enter New Password" required>
            <input type="submit" value="Submit">
        </form>
        <% 
        try {
            int id = GettersSetters.getGetCid();
            String cnewpass = request.getParameter("cnewpass");
            String coldpass = request.getParameter("coldpass");
            if (cnewpass != null && coldpass != null) {
                Connection con = ConnectDB.dbCon();
                PreparedStatement ps = con.prepareStatement("update chef_db set cpass=? where cid=? and cpass=?");
                ps.setString(1, cnewpass);
                ps.setInt(2, id);
                ps.setString(3, coldpass);
                int i = ps.executeUpdate();
                if (i > 0) {
        %> 
        <h3>Password Changed Successfully</h3>
        <% 
                } else {
        %> 
        <h3>Password is not changed</h3>
        <% 
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>
    </div>
</body>
</html>

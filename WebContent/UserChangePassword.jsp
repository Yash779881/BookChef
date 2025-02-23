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
    <title>User Change Password</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            display: flex;
            height: 100vh;
            background-color: #f4f4f4;
        }
        .sidebar {
            width: 250px;
            background-color: #333;
            color: white;
            padding: 20px;
            position: fixed;
            height: 100%;
            overflow: auto;
        }
        .sidebar a {
            color: white;
            text-decoration: none;
            display: block;
            padding: 10px;
            margin: 5px 0;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .sidebar a:hover {
            background-color: #575757;
        }
        .main-content {
            margin-left: 250px;
            padding: 20px;
            flex: 1;
        }
        .form-container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            margin: 0 auto;
        }
        h1 {
            color: #007BFF;
            margin-bottom: 20px;
        }
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background: #007BFF;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background: #0056b3;
        }
        .message {
            margin-top: 20px;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h2>User Dashboard</h2>
        <a href="ViewAllChef.jsp">View All Chefs (City Wise)</a>
        <a href="SearchChef.jsp">Search Chef</a>
        <a href="ViewBookingsWithStatus.jsp">View Bookings with Status</a>
        <a href="UserChangePassword.jsp">Change Password</a>
        <a href="home.html">Log Out</a>
    </div>
    <div class="main-content">
        <div class="form-container">
            <form action="UserChangePassword.jsp" method="post">
                <h1>Change Password</h1>
                <input type="password" name="uoldpass" placeholder="Enter Old Password" required>
                <input type="password" name="unewpass" placeholder="Enter New Password" required>
                <input type="submit" value="Submit">
                <div class="message">
                    <% 
                    try {
                        int id = GettersSetters.getGetUid();
                        String unewpass = request.getParameter("unewpass");
                        String uoldpass = request.getParameter("uoldpass");
                        if (unewpass != null && uoldpass != null) {
                            Connection con = ConnectDB.dbCon();
                            PreparedStatement ps = con.prepareStatement("UPDATE users_db SET upass=? WHERE uid=? AND upass=?");
                            ps.setString(1, unewpass);
                            ps.setInt(2, id);
                            ps.setString(3, uoldpass);
                            int i = ps.executeUpdate();
                            if (i > 0) {
                    %> 
                    <p>Password Changed Successfully</p>
                    <% 
                            } else {
                    %> 
                    <p>Password was not changed</p>
                    <% 
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    %>
                </div>
            </form>
        </div>
    </div>
</body>
</html>

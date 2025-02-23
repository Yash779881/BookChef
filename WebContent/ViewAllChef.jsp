<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="database.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>View Approved Chef</title>
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
    .form-container {
        background: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        text-align: center;
        margin-bottom: 20px;
    }
    .form-container h1 {
        margin-top: 0;
        color: #007BFF;
    }
    .form-container input[type="text"] {
        padding: 10px;
        margin: 10px 0;
        width: calc(100% - 22px);
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    .form-container input[type="submit"] {
        padding: 10px 20px;
        background: #007BFF;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    .form-container input[type="submit"]:hover {
        background: #0056b3;
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
        <div class="form-container">
            <h1>Enter City Here</h1>
            <form action="ViewAllChef.jsp" method="get">
                <input type="text" name="ccity" placeholder="Enter City">
                <input type="submit" value="Enter">
            </form>
        </div>
        <table> 
            <thead> 
                <tr> 
                    <th>Id</th> 
                    <th>Chef Name</th> 
                    <th>Speciality</th>
                    <th>Open Time</th>
                    <th>Close Time</th>
                    <th>Address</th>
                    <th>Area</th>
                    <th>City</th>
                    <th>Pin Code</th>
                    <th>Contact Number</th>
                    <th>Email</th>
                </tr> 
            </thead> 
            <tbody> 
            <% 
            try {
                String ccity = request.getParameter("ccity");
                Connection con = ConnectDB.dbCon();
                PreparedStatement ps = con.prepareStatement("select * from chef_db where cstatus=? and ccity=?");
                ps.setString(1, "Approved");
                ps.setString(2, ccity);
                ResultSet i = ps.executeQuery();
                while (i.next()) {
            %>
                <tr>  
                    <td><%= i.getInt(1) %></td> 
                    <td><%= i.getString(2) %></td> 
                    <td><%= i.getString(3) %></td> 
                    <td><%= i.getString(4) %></td>
                    <td><%= i.getString(5) %></td>
                    <td><%= i.getString(6) %></td> 
                    <td><%= i.getString(7) %></td>
                    <td><%= i.getString(8) %></td>
                    <td><%= i.getString(9) %></td>     
                    <td><%= i.getString(10) %></td>
                    <td><%= i.getString(11) %></td>
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

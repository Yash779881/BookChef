<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="database.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Users | Book Chef</title>
<style>
    body {
        margin: 0;
        font-family: 'Arial', sans-serif;
        background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        overflow: hidden;
    }
    .table-container {
        background: rgba(255, 255, 255, 0.9);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 20px;
        border-radius: 10px;
        max-width: 90%;
        overflow-y: auto;
        height: 80%;
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
        background-color: #f1f1f1;
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
    <div class="table-container">
        <h1>View Users</h1>
        <table class="table table-hover"> 
            <thead> 
                <tr> 
                    <th>Id</th> 
                    <th>Chef Name</th> 
                    <th>Speciality</th>
                    <th>Address</th>
                    <th>Area</th>
                    <th>City</th>
                    <th>Pin Code</th>
                    <th>Contact Number</th>
                    <th>Email</th>
                    <th>Status</th>
                    <th>Action-1</th>
                    <th>Action-2</th>
                </tr> 
            </thead> 
            <tbody> 
                <% 
                try {
                    Connection con = ConnectDB.dbCon();
                    PreparedStatement ps = con.prepareStatement("select * from chef_db where cstatus=?");
                    ps.setString(1,"Pending");
                    ResultSet i = ps.executeQuery();
                    while(i.next()) {
                %>
                <tr>  
                    <td><%=i.getInt(1)%></td> 
                    <td><%=i.getString(2)%></td> 
                    <td><%=i.getString(3)%></td> 
                    <td><%=i.getString(6)%></td> 
                    <td><%=i.getString(7)%></td>
                    <td><%=i.getString(8)%></td>
                    <td><%=i.getString(9)%></td>	 
                    <td><%=i.getString(10)%></td>
                    <td><%=i.getString(11)%></td>
                    <td><%=i.getString(13)%></td>
                    <td><a href="ApproveChef.jsp?id=<%=i.getInt(1)%>">Approve</a></td>
                    <td><a href="DisapproveChef.jsp?id=<%=i.getInt(1)%>">Disapprove</a></td>
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.html"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String msg = request.getParameter("msg");
if ("valid".equals(msg)) {
%>
    <center><font color="green" size="5"> Successfully Updated</font></center>
<%
} else if ("invalid".equals(msg)) {
%>
    <center><font color="red" size="5"> Something Went Wrong! Try Again</font></center>
<%
}

Connection con = null;
Statement st = null;
ResultSet rs = null;
int id = 1;

try {
    con = ConnectionProvider.getCon();
    st = con.createStatement();
    rs = st.executeQuery("SELECT MAX(id) FROM donor");

    if (rs.next()) {
        id = rs.getInt(1) + 1;
    }
} catch (SQLException e) {
    e.printStackTrace(); // Handle this appropriately
} finally {
    // Close resources in finally block
    try {
        if (rs != null) rs.close();
        if (st != null) st.close();
        if (con != null) con.close();
    } catch (SQLException e) {
        e.printStackTrace(); // Handle this appropriately
    }
}
%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="style.css" type="text/css" media="screen">
    <style>
        input[type="text"], input[type="password"], input[type="email"], select,input[type="number"]
        {
            border: none;
            background:silver;
            height: 50px;
            font-size: 16px;
            padding:15px;
            width:60%;    
            border-radius: 25px;
            margin-left:20%;
        }
        h2,h1
        {    
            margin-left:20%;
        }
        
        hr
        {
            width:60%;    
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 style="color:red;">Donor ID: <%= id %></h1>
    </div>

    <div class="container">
        <form action="addNewDonorAction.jsp" method="post">
            <input type="hidden" name="id" value="<%= id %>">
            <h2>Name</h2>
            <input type="text" placeholder="Enter Name" name="name" required oninput="validateName(this)">
            <hr>
            <h2>Father Name </h2>
            <input type="text" placeholder="Enter Father Name" name="father" required oninput="validateName(this)"> 
            <h2>Mother Name </h2>
            <input type="text" placeholder="Enter Mother Name" name="mother" required oninput="validateName(this)"> 
            <hr>
            <h2>Mobile Number</h2>
            <input type="text" placeholder="Enter Mobile Number" name="mobilenumber" required onblur="validatePhoneNumber(this)">
<hr>
            <h2>Gender</h2>
            <select name="gender">
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Others">Other</option>
            </select>
            <hr>
            <h2>Email</h2>
           <input type="email" placeholder="Enter Email" name="email" required onblur="validateEmail(this)">
<hr>
            <h2>Blood Group</h2>
            <select name="bloodgroup" required>
                <option value="A+">A+</option>
                <option value="A-">A-</option>
                <option value="B+">B+</option>
                <option value="B-">B-</option>
                <option value="O+">O+</option>
                <option value="O-">O-</option>
                <option value="AB+">AB+</option>
                <option value="AB-">AB-</option>
            </select>
            <hr>
            <h2>Address</h2>
            <input type="text" placeholder="Enter Address" name="address" required>
            <br>
            <center><button type="submit" class="button"> Save</button></center>
        </form>
    </div>

    <br>
    <br>
    <br>
    <br>
    <h3><center>All Right Reserved @ BPUT :: 2024 </center></h3>
    <script>
        function validateName(input) {
            var nameRegex = /^[a-zA-Z ]{1,40}$/;
            if (!nameRegex.test(input.value)) {
                alert("Name must contain only letters and be within 40 characters.");
                input.value = "";
            }
        }

        function validatePhoneNumber(input) {
            var phoneRegex = /^\d{10}$/;
            if (!phoneRegex.test(input.value)) {
                alert("Phone number must be 10 digits.");
                input.value = "";
            }
        }

        function validateEmail(input) {
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(input.value)) {
                alert("Invalid email address.");
                input.value = "";
            }
        }
    </script>
</body>
</html>

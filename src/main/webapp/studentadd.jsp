<%@ page import="java.sql.*, prj2.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Student - Hostel Management</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #ffdde1, #ee9ca7);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-box {
            background: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 12px 25px rgba(0, 0, 0, 0.15);
            width: 450px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            font-weight: 500;
        }

        input[type="text"],
        input[type="date"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #f9f9f9;
            font-size: 14px;
            transition: 0.3s border ease;
        }

        input:focus {
            border-color: #ee6e73;
        }

        .btn {
            width: 100%;
            margin-top: 20px;
            padding: 12px;
            background-color: #ee6e73;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s ease;
        }

        .btn:hover {
            background-color: #d9434e;
        }

        .success-msg {
            text-align: center;
            margin-top: 20px;
            color: green;
            font-weight: bold;
        }

        .error-msg {
            text-align: center;
            margin-top: 20px;
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="form-box">
    <h2>Add Student</h2>
    <form method="post">
        <label for="id">Student ID:</label>
        <input type="text" name="id" id="id" required />

        <label for="name">Name:</label>
        <input type="text" name="name" id="name" required />

        <label for="room">Room Number:</label>
        <input type="text" name="room" id="room" required />

        <label for="date">Admission Date:</label>
        <input type="date" name="date" id="date" required />

        <label for="paid">Fees Paid:</label>
        <input type="text" name="paid" id="paid" required />

        <label for="pending">Pending Fees:</label>
        <input type="text" name="pending" id="pending" required />

        <button type="submit" class="btn">Add Student</button>
    </form>

    <%
    if (request.getMethod().equals("POST")) {
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO HostelStudents VALUES (?, ?, ?, ?, ?, ?)");
            ps.setInt(1, Integer.parseInt(request.getParameter("id")));
            ps.setString(2, request.getParameter("name"));
            ps.setString(3, request.getParameter("room"));
            ps.setDate(4, Date.valueOf(request.getParameter("date")));
            ps.setDouble(5, Double.parseDouble(request.getParameter("paid")));
            ps.setDouble(6, Double.parseDouble(request.getParameter("pending")));
            ps.executeUpdate();
    %>
            <div class="success-msg">Student added successfully.</div>
    <%
        } catch (Exception e) {
    %>
            <div class="error-msg">Error: <%= e.getMessage() %></div>
    <%
        }
    }
    %>
</div>

</body>
</html>

<%@ page import="java.sql.*, prj2.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Student - Hostel Management</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #bdc3c7, #2c3e50);
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
            width: 400px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: 500;
        }

        input[type="text"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #f9f9f9;
            font-size: 14px;
            margin-bottom: 20px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #e74c3c;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #c0392b;
        }

        .msg {
            text-align: center;
            margin-top: 20px;
            font-weight: bold;
        }

        .success {
            color: green;
        }

        .fail {
            color: red;
        }
    </style>
</head>
<body>

<div class="form-box">
    <h2>Delete Student</h2>
    <form method="post">
        <label for="id">Enter Student ID to Delete:</label>
        <input type="text" name="id" id="id" required />
        <input type="submit" value="Delete" />
    </form>

    <%
    if (request.getMethod().equals("POST")) {
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM HostelStudents WHERE StudentID=?");
            ps.setInt(1, Integer.parseInt(request.getParameter("id")));
            int count = ps.executeUpdate();
            if (count > 0) {
    %>
                <div class="msg success">Student deleted successfully.</div>
    <%
            } else {
    %>
                <div class="msg fail">No student found with that ID.</div>
    <%
            }
        } catch (Exception e) {
    %>
            <div class="msg fail">Error: <%= e.getMessage() %></div>
    <%
        }
    }
    %>
</div>

</body>
</html>

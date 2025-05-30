<%@ page import="java.sql.*, prj2.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Update Student - Hostel Management</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #fceabb, #f8b500);
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
            width: 420px;
        }

        h2 {
            text-align: center;
            color: #34495e;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #34495e;
        }

        input[type="text"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            font-size: 15px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus {
            border-color: #f39c12;
            outline: none;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #f39c12;
            border: none;
            border-radius: 10px;
            color: white;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #d88c0e;
        }

        .msg {
            margin-top: 20px;
            text-align: center;
            font-weight: 600;
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
    <h2>Update Student Name</h2>
    <form method="post">
        <label for="id">Student ID:</label>
        <input type="text" name="id" id="id" required />

        <label for="name">New Name:</label>
        <input type="text" name="name" id="name" required />

        <input type="submit" value="Update" />
    </form>

    <%
    if (request.getMethod().equals("POST")) {
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE HostelStudents SET StudentName=? WHERE StudentID=?");
            ps.setString(1, request.getParameter("name"));
            ps.setInt(2, Integer.parseInt(request.getParameter("id")));
            int count = ps.executeUpdate();
            if (count > 0) {
    %>
                <div class="msg success">Student updated successfully.</div>
    <%
            } else {
    %>
                <div class="msg fail">Student not found.</div>
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

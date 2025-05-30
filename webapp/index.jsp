<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hostel Management System</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #74ebd5, #9face6);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: white;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            text-align: center;
            width: 400px;
            animation: slideUp 0.6s ease-out;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(40px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        h2 {
            margin-bottom: 30px;
            font-size: 28px;
            color: #2c3e50;
        }

        .menu a {
            display: block;
            margin: 15px 0;
            padding: 12px;
            border-radius: 12px;
            background: #6c5ce7;
            color: white;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        .menu a:hover {
            background: #4834d4;
            transform: scale(1.05);
        }

        .menu a::before {
            content: " ";
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Hostel Management</h2>
        <div class="menu">
            <a href="studentadd.jsp">Add Student</a>
            <a href="studentupdate.jsp">Update Student</a>
            <a href="studentdelete.jsp">Delete Student</a>
            <a href="studentdisplay.jsp">View Students</a>
            <a href="report_form.jsp">Reports</a>
        </div>
    </div>

</body>
</html>

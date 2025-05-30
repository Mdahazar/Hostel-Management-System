<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Generate Report - Hostel Management</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #ffecd2, #fcb69f);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background: #fff;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
            width: 450px;
            animation: fadeIn 0.6s ease-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.95); }
            to { opacity: 1; transform: scale(1); }
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
        }

        label, select, input {
            display: block;
            width: 100%;
            font-size: 16px;
            margin-bottom: 20px;
        }

        input[type="text"],
        input[type="date"],
        select {
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #f9f9f9;
            outline: none;
            transition: 0.3s border-color ease;
        }

        input:focus, select:focus {
            border-color: #ff7f50;
        }

        .btn {
            background-color: #ff7f50;
            color: white;
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .btn:hover {
            background-color: #ff5722;
            transform: scale(1.03);
        }
    </style>
</head>
<body>

    <div class="form-container">
        <h2> Generate Report</h2>
        <form method="post" action="report_result.jsp">
            <label for="reportType">Select Report Type:</label>
            <select name="reportType" id="reportType" required>
                <option value="pending">Students with Pending Fees</option>
                <option value="room">Students in a Room</option>
                <option value="date">Students Admitted in a Date Range</option>
            </select>

            <label for="room">Room (if applicable):</label>
            <input type="text" name="room" id="room" placeholder="e.g., 101B" />

            <label for="start">Start Date:</label>
            <input type="date" name="start" id="start" />

            <label for="end">End Date:</label>
            <input type="date" name="end" id="end" />

            <button type="submit" class="btn">Generate Report</button>
        </form>
    </div>

</body>
</html>

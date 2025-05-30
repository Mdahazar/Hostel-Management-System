<%@ page import="java.sql.*, prj2.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>View Students - Hostel Management</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #f0f4f8, #d9e2ec);
            padding: 40px;
            display: flex;
            justify-content: center;
        }

        .container {
            width: 95%;
            max-width: 1000px;
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #34495e;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 15px;
        }

        th, td {
            padding: 14px 18px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #2980b9;
            color: white;
            font-weight: 600;
            text-transform: uppercase;
        }

        tr:nth-child(even) {
            background-color: #f7fbff;
        }

        tr:hover {
            background-color: #d6eaff;
            cursor: default;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>All Students</h2>
        <%
        Connection con = DBConnection.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM HostelStudents");
        %>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Room</th>
                <th>Admission Date</th>
                <th>Fees Paid</th>
                <th>Pending Fees</th>
            </tr>
            <%
            while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("StudentID") %></td>
                <td><%= rs.getString("StudentName") %></td>
                <td><%= rs.getString("RoomNumber") %></td>
                <td><%= rs.getDate("AdmissionDate") %></td>
                <td><%= rs.getDouble("FeesPaid") %></td>
                <td><%= rs.getDouble("PendingFees") %></td>
            </tr>
            <%
            }
            %>
        </table>
    </div>
</body>
</html>

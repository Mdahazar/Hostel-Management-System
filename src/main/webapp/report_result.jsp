<%@ page import="java.sql.*, prj2.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Report Results - Hostel Management</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #c9d6ff, #e2e2e2);
            padding: 40px;
        }

        .container {
            background: white;
            padding: 30px;
            border-radius: 15px;
            max-width: 1000px;
            margin: auto;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #6c5ce7;
            color: white;
            font-weight: 600;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .no-results {
            text-align: center;
            font-size: 18px;
            color: #888;
            margin-top: 20px;
        }

        .back-btn {
            display: block;
            text-align: center;
            margin-top: 30px;
        }

        .back-btn a {
            background-color: #6c5ce7;
            color: white;
            padding: 12px 20px;
            border-radius: 10px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .back-btn a:hover {
            background-color: #4834d4;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Report Results</h2>

        <%
        String report = request.getParameter("reportType");
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = null;

        if ("pending".equals(report)) {
            ps = con.prepareStatement("SELECT * FROM HostelStudents WHERE PendingFees > 0");
        } else if ("room".equals(report)) {
            ps = con.prepareStatement("SELECT * FROM HostelStudents WHERE RoomNumber = ?");
            ps.setString(1, request.getParameter("room"));
        } else if ("date".equals(report)) {
            ps = con.prepareStatement("SELECT * FROM HostelStudents WHERE AdmissionDate BETWEEN ? AND ?");
            ps.setDate(1, Date.valueOf(request.getParameter("start")));
            ps.setDate(2, Date.valueOf(request.getParameter("end")));
        }

        ResultSet rs = ps.executeQuery();
        boolean hasResults = false;
        %>

        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Room</th>
                <th>Date</th>
                <th>Paid</th>
                <th>Pending</th>
            </tr>

            <%
            while (rs.next()) {
                hasResults = true;
            %>
            <tr>
                <td><%=rs.getInt("StudentID")%></td>
                <td><%=rs.getString("StudentName")%></td>
                <td><%=rs.getString("RoomNumber")%></td>
                <td><%=rs.getDate("AdmissionDate")%></td>
                <td><%=rs.getDouble("FeesPaid")%></td>
                <td><%=rs.getDouble("PendingFees")%></td>
            </tr>
            <% } %>
        </table>

        <% if (!hasResults) { %>
            <div class="no-results">No records found for this report.</div>
        <% } %>

        <div class="back-btn">
            <a href="report_form.jsp">Back to Report Form</a>
        </div>
    </div>

</body>
</html>

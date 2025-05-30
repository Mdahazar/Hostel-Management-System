# Hostel-Management-System
🚀 Features
Complete CRUD Operations
Add, update, delete, and view student marks seamlessly.

Advanced Search
Quickly search student records by Student ID.

Comprehensive Reports
Generate meaningful reports, including:

📈 Students with marks above a specified threshold

📚 Students who scored in a specific subject

🏆 Top N students based on total marks

Input Validation

✅ Client-side (HTML5, JavaScript)

✅ Server-side (JSP/Java)

Professional UI

Responsive, user-friendly interface built with Bootstrap 5

Smooth navigation and colorful, clean layouts

MVC Architecture

Modular design using JSP (View), Servlets (Controller), and JDBC/MySQL (Model)

Database Integration

MySQL backend with JDBC connection pooling


#🗃️ Database Schema
CREATE TABLE HostelStudents (
StudentID INT PRIMARY KEY,
StudentName VARCHAR(100),
RoomNumber VARCHAR(10),
AdmissionDate DATE,
FeesPaid DECIMAL(10,2),
PendingFees DECIMAL(10,2)
);

📋 Prerequisites
Ensure the following software is installed before running the project:

Java Development Kit (JDK 8 or higher)

Apache Tomcat (9.0 or higher)

MySQL Server or XAMPP

MySQL JDBC Driver (mysql-connector-java)

IDE: Eclipse (J2EE), IntelliJ IDEA, or NetBeans

Web Browser: Chrome, Firefox, or Edge

| Module Name       | Description                               |
| ----------------- | ----------------------------------------- |
| `MarkAdd.jsp`     | Add new student exam marks                |
| `MarkUpdate.jsp`  | Update marks for existing student entries |
| `MarkDelete.jsp`  | Delete a student’s exam record            |
| `MarkDisplay.jsp` | View all records or search by Student ID  |
| `MarkReports.jsp` | Generate dynamic reports                  |


🎨 UI Highlights
Clean layout using Bootstrap cards & tables

Color-coded buttons for actions (Add, Update, Delete)

Real-time form feedback and hover effects

Consistent font and spacing (Google Fonts – Poppins)

🔧 Technologies Used
Frontend: HTML, CSS, JSP, Bootstrap

Backend: Java (Servlets/JSP), JDBC

Database: MySQL

Server: Apache Tomcat

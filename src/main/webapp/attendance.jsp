<%@ page import="java.sql.*" %>
<%@ page import="com.attendance_pack.DBConnection" %>

<%

Integer staffId =
    (Integer) session.getAttribute("staff_id");

if (staffId == null) {

    response.sendRedirect("login.jsp");

    return;
}

%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Student Attendance</title>

<style>

body {
    font-family: Arial;
    margin: 40px;
    background: #f5f5f5;
}

.container {
    width: 900px;
    margin: auto;
    background: white;
    padding: 30px;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    border: 1px solid #ccc;
    padding: 12px;
    text-align: center;
}

th {
    background: #1976d2;
    color: white;
}

button {
    padding: 12px 25px;
    background: green;
    color: white;
    border: none;
    cursor: pointer;
}

</style>

</head>

<body>

<div class="container">

<h2>Student Attendance</h2>

<p>
Welcome,
<%= session.getAttribute("staff_username") %>
</p>

<p>
Today's Date:
<%= new java.util.Date() %>
</p>

<form action="attendance" method="post">

<table>

<tr>
    <th>Roll No</th>
    <th>Student Name</th>
    <th>Department</th>
    <th>Attendance</th>
</tr>

<%

try {

    Connection con =
        DBConnection.getConnection();

    String sql =
        "SELECT * FROM students " +
        "ORDER BY roll_no";

    PreparedStatement ps =
        con.prepareStatement(sql);

    ResultSet rs =
        ps.executeQuery();

    while (rs.next()) {

%>

<tr>

<td>
    <%= rs.getString("roll_no") %>
</td>

<td>
    <%= rs.getString("student_name") %>
</td>

<td>
    <%= rs.getString("department") %>
</td>

<td>

<input type="hidden"
       name="student_id"
       value="<%= rs.getInt("student_id") %>">

<input type="radio"
       name="status_<%= rs.getInt("student_id") %>"
       value="Present"
       required>

Present

<input type="radio"
       name="status_<%= rs.getInt("student_id") %>"
       value="Absent">

Absent

</td>

</tr>

<%

    }

    con.close();

} catch (Exception e) {

    out.println(e.getMessage());

}

%>

</table>

<br>

<button type="submit">
    Submit Attendance
</button>

</form>

<br>

<a href="logout">Logout</a>

</div>

</body>

</html>
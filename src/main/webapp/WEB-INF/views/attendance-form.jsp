<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Mark Attendance</title>

    <style>
        body {
            font-family: Arial;
            margin: 20px;
            background-color: #f4f6f8;
        }

        h2 {
            color: #333;
        }

        form {
            background: white;
            padding: 20px;
            width: 400px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
        }

        label {
            font-weight: bold;
        }

        select, input {
            width: 100%;
            padding: 8px;
            margin: 8px 0 15px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
                button {
            width: 100%;
            padding: 10px;
            background: #27ae60;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background: #219150;
        }
    </style>
</head>

<body>

<h2>Mark Attendance</h2>

<form action="/attendance/save" method="post">

    <label>Student</label>
    <select name="studentId">
        <c:forEach var="s" items="${students}">
            <option value="${s.id}">${s.name}</option>
        </c:forEach>
    </select>

    <label>Course</label>
    <select name="courseId">
        <c:forEach var="c" items="${courses}">
            <option value="${c.id}">${c.courseName}</option>
        </c:forEach>
    </select>

    <label>Date</label>
    <input type="date" name="date" required />

    <label>Status</label>
    <select name="status">
        <option value="PRESENT">Present</option>
        <option value="ABSENT">Absent</option>
        <option value="LATE">Late</option>
    </select>

    <button type="submit">Save Attendance</button>

</form>

</body>
</html>
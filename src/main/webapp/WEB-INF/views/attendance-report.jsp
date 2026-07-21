<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Attendance Report</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:"Segoe UI",Tahoma,Geneva,Verdana,sans-serif;
}

body{
    min-height:100vh;
    background:
    linear-gradient(rgba(15,23,42,.72),rgba(15,23,42,.72)),
    url('https://images.unsplash.com/photo-1523240795612-9a054b0db644?auto=format&fit=crop&w=1600&q=80');
    background-size:cover;
    background-position:center;
    background-attachment:fixed;
}

.wrapper{
    width:92%;
    margin:auto;
    padding:25px 0 40px;
}

/* NAVBAR */
.navbar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:18px 28px;
    border-radius:18px;
    background:rgba(10,18,45,.88);
    backdrop-filter:blur(12px);
}

.brand h1{
    color:white;
    font-size:30px;
}

.brand p{
    color:#dbeafe;
    margin-top:5px;
}

.nav-links a{
    text-decoration:none;
    color:white;
    padding:10px 16px;
    margin-left:10px;
    border-radius:8px;
    background:linear-gradient(135deg,#5b21b6,#7c3aed);
    font-weight:600;
}

/* TITLE */
.title{
    text-align:center;
    color:white;
    margin:35px 0;
}

.title h2{
    font-size:40px;
}

.title p{
    color:#e2e8f0;
}

/* TABLE */
.table-card{
    background:rgba(255,255,255,.12);
    backdrop-filter:blur(14px);
    border-radius:20px;
    padding:25px;
    box-shadow:0 15px 35px rgba(0,0,0,.35);
}

table{
    width:100%;
    border-collapse:collapse;
    overflow:hidden;
    border-radius:12px;
}

thead{
    background:#312e81;
}

thead th{
    color:white;
    padding:15px;
    text-align:left;
}

tbody{
    background:white;
}

tbody td{
    padding:15px;
    border-bottom:1px solid #e2e8f0;
    color:#334155;
}

/* STATUS BADGES */
.status-present{
    color:#15803d;
    font-weight:bold;
}

.status-absent{
    color:#dc2626;
    font-weight:bold;
}

.status-late{
    color:#b45309;
    font-weight:bold;
}

</style>

</head>

<body>

<div class="wrapper">

    <div class="navbar">

        <div class="brand">
            <h1>Student Management System</h1>
            <p>Attendance Report</p>
        </div>

        <div class="nav-links">
            <a href="/reports">Back</a>
            <a href="/students/">Dashboard</a>
        </div>

    </div>

    <div class="title">
        <h2>Attendance Report</h2>
        <p>Student attendance records</p>
    </div>

    <div class="table-card">

        <table>

            <thead>
                <tr>
                    <th>ID</th>
                    <th>Student</th>
                    <th>Course</th>
                    <th>Date</th>
                    <th>Status</th>
                </tr>
            </thead>

            <tbody>

                <c:forEach var="a" items="${attendanceList}">
                    <tr>
                        <td>${a.id}</td>
                        <td>${a.student.name}</td>
                        <td>${a.course.courseName}</td>
                        <td>${a.date}</td>

                        <td>
                            <c:choose>
                                <c:when test="${a.status == 'PRESENT'}">
                                    <span class="status-present">PRESENT</span>
                                </c:when>

                                <c:when test="${a.status == 'ABSENT'}">
                                    <span class="status-absent">ABSENT</span>
                                </c:when>

                                <c:otherwise>
                                    <span class="status-late">LATE</span>
                                </c:otherwise>
                            </c:choose>
                        </td>

                    </tr>
                </c:forEach>

            </tbody>

        </table>

    </div>

</div>

</body>
</html>
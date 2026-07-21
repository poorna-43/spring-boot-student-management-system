<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Attendance List</title>

<style>

/* ===== BASE STYLE (same as student page) ===== */

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
    box-shadow:0 8px 20px rgba(0,0,0,.35);
}

.brand h1{
    color:white;
    font-size:30px;
}

.brand p{
    color:#dbeafe;
    margin-top:5px;
}

.nav-links{
    display:flex;
    gap:15px;
}

.nav-links a{
    text-decoration:none;
    color:white;
    padding:12px 18px;
    border-radius:10px;
    background:linear-gradient(135deg,#5b21b6,#7c3aed);
    font-weight:600;
    transition:.3s;
}

.nav-links a:hover{
    transform:translateY(-2px);
}

/* TITLE */

.title{
    text-align:center;
    color:white;
    margin:35px 0;
}

.title h2{
    font-size:42px;
    margin-bottom:8px;
}

.title p{
    color:#e2e8f0;
    font-size:18px;
}

/* TABLE CARD */

.table-card{
    background:rgba(255,255,255,.12);
    backdrop-filter:blur(14px);
    border-radius:25px;
    padding:30px;
    box-shadow:0 15px 35px rgba(0,0,0,.35);
}

.top-bar{
    display:flex;
    justify-content:flex-end;
    margin-bottom:25px;
}

.add-btn{
    text-decoration:none;
    color:white;
    padding:13px 22px;
    border-radius:10px;
    font-weight:bold;
    background:linear-gradient(135deg,#16a34a,#22c55e);
}

table{
    width:100%;
    border-collapse:collapse;
    border-radius:15px;
    overflow:hidden;
}

thead{
    background:#312e81;
}

thead th{
    color:white;
    padding:18px;
    text-align:left;
}

tbody{
    background:white;
}

tbody td{
    padding:16px;
    color:#334155;
    border-bottom:1px solid #e2e8f0;
}

tbody tr:hover{
    background:#f8fafc;
}

/* STATUS */

.status-present{
    background:#dcfce7;
    color:#15803d;
    padding:7px 15px;
    border-radius:20px;
    font-size:13px;
    font-weight:bold;
}

.status-absent{
    background:#fee2e2;
    color:#dc2626;
    padding:7px 15px;
    border-radius:20px;
    font-size:13px;
    font-weight:bold;
}

.status-late{
    background:#fef9c3;
    color:#a16207;
    padding:7px 15px;
    border-radius:20px;
    font-size:13px;
    font-weight:bold;
}

@media(max-width:900px){

    .navbar{
        flex-direction:column;
        gap:20px;
    }

    table{
        display:block;
        overflow-x:auto;
    }
}

</style>

</head>

<body>

<div class="wrapper">

    <!-- NAVBAR -->
    <div class="navbar">

        <div class="brand">
            <h1>Student Management System</h1>
            <p>Attendance Records</p>
        </div>

        <div class="nav-links">

            <a href="/students/">Dashboard</a>

            <a href="/attendance/add">Mark Attendance</a>

        </div>

    </div>

    <!-- TITLE -->
    <div class="title">
        <h2>Attendance List</h2>
        <p>View and manage attendance records</p>
    </div>

    <!-- TABLE -->
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

                <c:if test="${empty attendanceList}">

                    <tr>
                        <td colspan="5"
                            style="text-align:center;
                                   padding:35px;
                                   font-size:18px;
                                   color:#64748b;
                                   font-weight:bold;">
                            No Attendance Records Available
                        </td>
                    </tr>

                </c:if>

            </tbody>

        </table>

    </div>

</div>

</body>
</html>
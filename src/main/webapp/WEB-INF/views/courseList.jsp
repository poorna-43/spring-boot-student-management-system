<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Course Management</title>

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
        linear-gradient(rgba(15,23,42,0.75), rgba(15,23,42,0.75)),
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
    background:rgba(10,18,45,0.9);
    backdrop-filter:blur(12px);
    box-shadow:0 8px 20px rgba(0,0,0,0.35);
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
}

/* TITLE */
.title{
    text-align:center;
    color:white;
    margin:35px 0;
}

.title h2{
    font-size:42px;
}

.title p{
    color:#e2e8f0;
    margin-top:8px;
}

/* TABLE CARD */
.card{
    background:rgba(255,255,255,0.12);
    backdrop-filter:blur(12px);
    border-radius:25px;
    padding:25px;
    box-shadow:0 15px 35px rgba(0,0,0,0.35);
}

/* TOP BAR */
.top-bar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:20px;
    flex-wrap:wrap;
    gap:15px;
}

.add-btn{
    text-decoration:none;
    color:white;
    background:linear-gradient(135deg,#16a34a,#22c55e);
    padding:12px 18px;
    border-radius:10px;
    font-weight:bold;
}

table{
    width:100%;
    border-collapse:collapse;
    overflow:hidden;
    border-radius:15px;
}

thead{
    background:#312e81;
}

thead th{
    color:white;
    padding:16px;
    text-align:left;
}

tbody{
    background:white;
}

tbody td{
    padding:14px;
    border-bottom:1px solid #e2e8f0;
}</style>
</head>

<body>

<div class="wrapper">

    <!-- NAVBAR -->
    <div class="navbar">
        <div class="brand">
            <h1>Course Management</h1>
            <p>Manage all available courses</p>
        </div>

        <div class="nav-links">
            <a href="/students/">Dashboard</a>
            <a href="/courses/list">Courses</a>
        </div>
    </div>

    <!-- TITLE -->
    <div class="title">
        <h2>Course List</h2>
        <p>View and manage course details</p>
    </div>

    <!-- CARD -->
    <div class="card">

        <div class="top-bar">
            <a href="/courses/register" class="add-btn">+ Add Course</a>
        </div>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Course Name</th>
                    <th>Duration</th>
                    <th>Fee</th>
                    <th>Actions</th>
                </tr>
            </thead>

            <tbody>

                <!-- LOOP COURSES -->
                <c:forEach var="course" items="${courses}">

                    <tr>
                        <td>${course.id}</td>
                        <td>${course.courseName}</td>
                        <td>${course.duration} months</td>
                        <td>₹ ${course.fee}</td>

                        <td>
                            <a href="/courses/edit?id=${course.id}"
                               style="background:#f59e0b;padding:8px 12px;border-radius:8px;color:white;text-decoration:none;">
                               Edit
                            </a>

                            <a href="/courses/delete?id=${course.id}"
                               onclick="return confirm('Delete this course?')"
                               style="background:#dc2626;padding:8px 12px;border-radius:8px;color:white;text-decoration:none;margin-left:8px;">
                               Delete
                            </a>
                        </td>
                    </tr>

                </c:forEach>

                <!-- EMPTY STATE -->
                <c:if test="${empty courses}">
                    <tr>
                        <td colspan="5" style="text-align:center;padding:30px;color:#64748b;font-weight:bold;">
                            No Courses Available
                        </td>
                    </tr>
                </c:if>

            </tbody>
        </table>

    </div>

    <!-- FOOTER -->
    <div style="margin-top:30px;text-align:center;color:white;">
        © 2026 Student Management System | Course Module
    </div>

</div>

</body>
</html>
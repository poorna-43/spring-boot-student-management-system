<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Report</title>

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

.wrapper{ width:92%; margin:auto; padding:25px 0; }

.navbar{
    display:flex; justify-content:space-between; align-items:center;
    padding:18px 28px; border-radius:18px;
    background:rgba(10,18,45,.88);
}

.brand h1{ color:white; }
.brand p{ color:#dbeafe; }

.nav-links a{
    text-decoration:none; color:white;
    padding:10px 16px; margin-left:10px;
    border-radius:8px;
    background:linear-gradient(135deg,#5b21b6,#7c3aed);
}

.title{ text-align:center; color:white; margin:35px 0; }

.table-card{
    background:rgba(255,255,255,.12);
    backdrop-filter:blur(14px);
    border-radius:20px;
    padding:25px;
}

table{ width:100%; border-collapse:collapse; }

thead{ background:#312e81; }
thead th{ color:white; padding:15px; }

tbody{ background:white; }
tbody td{ padding:15px; border-bottom:1px solid #e2e8f0; }

</style>

</head>

<body>

<div class="wrapper">

    <div class="navbar">
        <div class="brand">
            <h1>Student Report</h1>
            <p>All Students</p>
        </div>

        <div class="nav-links">
            <a href="/reports">Back</a>
            <a href="/students/">Dashboard</a>
        </div>
    </div>

    <div class="title">
        <h2>Student Report</h2>
    </div>

    <div class="table-card">

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Mobile</th>
                    <th>Course</th>
                    <th>Status</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="s" items="${students}">
                    <tr>
                        <td>${s.id}</td>
                        <td>${s.name}</td>
                        <td>${s.email}</td>
                        <td>${s.mobile}</td>
                        <td>${s.course.courseName}</td>
                        <td>${s.status}</td>
                    </tr>
                </c:forEach>
            </tbody>

        </table>

    </div>

</div>

</body>
</html>
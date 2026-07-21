<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reports Dashboard</title>

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
}

.title{
    text-align:center;
    color:white;
    margin:40px 0;
}

.title h2{
    font-size:42px;
}

.title p{
    color:#e2e8f0;
    margin-top:10px;
    font-size:18px;
}

.cards{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(260px,1fr));
    gap:30px;
}

.card{
    background:rgba(255,255,255,.12);
    backdrop-filter:blur(15px);
    border-radius:20px;
    padding:35px;
    text-align:center;
    box-shadow:0 12px 30px rgba(0,0,0,.35);
    transition:.3s;
}

.card:hover{
    transform:translateY(-8px);
}

.card h3{
    color:white;
    margin-bottom:15px;
    font-size:25px;
}

.card p{
    color:#e2e8f0;
    margin-bottom:25px;
}

.card a{
    display:inline-block;
    text-decoration:none;
    color:white;
    padding:12px 24px;
    border-radius:10px;
    font-weight:bold;
    background:linear-gradient(135deg,#2563eb,#3b82f6);
}

.footer{
    text-align:center;
    margin-top:40px;
    color:white;
}

</style>

</head>

<body>

<div class="wrapper">

    <div class="navbar">

        <div class="brand">
            <h1>Student Management System</h1>
            <p>Reports Module</p>
        </div>

        <div class="nav-links">
            <a href="/students/">Dashboard</a>
        </div>

    </div>

    <div class="title">

        <h2>Reports Dashboard</h2>

        <p>Select a report to view.</p>

    </div>

    <div class="cards">

        <div class="card">

            <h3>Student Report</h3>

            <p>View all registered students.</p>

            <a href="/reports/students">Open Report</a>

        </div>

        <div class="card">

            <h3>Course Report</h3>

            <p>View all available courses.</p>

            <a href="/reports/courses">Open Report</a>

        </div>

        <div class="card">

            <h3>Attendance Report</h3>

            <p>View attendance records.</p>

            <a href="/reports/attendance">Open Report</a>

        </div>

        <div class="card">

            <h3>Fee Report</h3>

            <p>View fee payment details.</p>

            <a href="/reports/fees">Open Report</a>

        </div>

    </div>

    <div class="footer">

        © 2026 Student Management System | Reports

    </div>

</div>

</body>
</html>
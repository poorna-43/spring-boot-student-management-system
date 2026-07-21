<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Course</title>

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
url('https://images.unsplash.com/photo-1522202176988-66273c2fd55f?auto=format&fit=crop&w=1600&q=80');

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
margin:40px 0 25px;

}

.title h2{

font-size:40px;

}

.form-container{

width:700px;
max-width:100%;

margin:auto;

background:rgba(255,255,255,.14);

backdrop-filter:blur(14px);

border-radius:25px;

padding:40px;

box-shadow:0 15px 35px rgba(0,0,0,.35);

}

.form-group{

display:flex;
flex-direction:column;

margin-bottom:22px;

}

.form-group label{

color:white;

margin-bottom:8px;

font-weight:600;

}

.form-group input{

width:100%;

padding:14px;

border:none;

border-radius:12px;

outline:none;

font-size:15px;

}

.btn-group{

margin-top:30px;

display:flex;

justify-content:center;

gap:20px;

}

.btn{

padding:14px 35px;

border:none;

border-radius:12px;

font-weight:bold;

cursor:pointer;

text-decoration:none;

}

.btn-update{

background:#2563eb;
color:white;

}

.btn-back{

background:#16a34a;
color:white;

}

</style>

</head>

<body>

<div class="wrapper">

<div class="navbar">

<div class="brand">

<h1>Student Management System</h1>

<p>Edit Course</p>

</div>

<div class="nav-links">

<a href="/students">Dashboard</a>

<a href="/courses/list">Courses</a>

<a href="/students/list">Students</a>

</div>

</div>

<div class="title">

<h2>Edit Course</h2>

</div>

<div class="form-container">

<form action="/courses/update" method="post">

<!-- VERY IMPORTANT -->

<input type="hidden" name="id" value="${course.id}">
<div class="form-group">

<label>Course Name</label>

<input
type="text"
name="courseName"
value="${course.courseName}"
required>

</div>

<div class="form-group">

<label>Duration (Months)</label>

<input
type="number"
name="duration"
value="${course.duration}"
required>

</div>

<div class="form-group">

<label>Course Fee</label>

<input
type="number"
step="0.01"
name="fee"
value="${course.fee}"
required>

</div>

<div class="btn-group">

<button
type="submit"
class="btn btn-update">

Update Course

</button>

<a
href="/courses/list"
class="btn btn-back">

Back

</a>

</div>

</form>

</div>

<div style="
margin-top:35px;
text-align:center;
color:white;
font-size:15px;
letter-spacing:1px;">

© 2026 Student Management System | Spring Boot MVC Project

</div>

</div>

</body>
</html>
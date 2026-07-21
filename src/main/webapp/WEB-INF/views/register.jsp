<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Student</title>

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
        url('https://images.unsplash.com/photo-1523050854058-8df90110c9f1?auto=format&fit=crop&w=1600&q=80');
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
    background:rgba(10,18,45,.88);
    backdrop-filter:blur(12px);
    border-radius:18px;
    box-shadow:0 8px 20px rgba(0,0,0,.35);
}

.brand h1{
    color:white;
    font-size:30px;
}

.brand p{
    color:#dbeafe;
    margin-top:4px;
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
    transition:.3s;
    font-weight:600;
}

.nav-links a:hover{
    transform:translateY(-2px);
    background:linear-gradient(135deg,#6d28d9,#9333ea);
}

/* PAGE TITLE */

.title{
    text-align:center;
    color:white;
    margin:40px 0 25px;
}

.title h2{
    font-size:42px;
    margin-bottom:10px;
}

.title p{
    font-size:18px;
    color:#e2e8f0;
}

/* FORM CARD */

.form-container{
    width:900px;
    max-width:100%;
    margin:auto;
    background:rgba(255,255,255,.14);
    backdrop-filter:blur(14px);
    border-radius:25px;
    padding:40px;
    box-shadow:0 15px 35px rgba(0,0,0,.35);
}

.form-grid{
    display:grid;
    grid-template-columns:repeat(2,1fr);
    gap:25px;
}

.form-group{
    display:flex;
    flex-direction:column;
}

.form-group label{
    color:white;
    margin-bottom:8px;
    font-weight:600;
    font-size:16px;
}

.form-group input,
.form-group select,
.form-group textarea{

    width:100%;
    padding:14px 16px;
    border:none;
    border-radius:12px;
    outline:none;
    font-size:15px;
    background:rgba(255,255,255,.92);
    transition:.3s;

}

.form-group input:focus,
.form-group textarea:focus,
.form-group select:focus{

    box-shadow:0 0 12px rgba(59,130,246,.7);

}

textarea{
    resize:none;
    height:120px;
}

.full{
    grid-column:1/3;
}

/* BUTTONS */

.button-group{

    margin-top:35px;
    display:flex;
    justify-content:center;
    gap:20px;
    flex-wrap:wrap;

}

.btn{

    padding:14px 35px;
    border:none;
    border-radius:12px;
    cursor:pointer;
    font-size:16px;
    font-weight:bold;
    transition:.3s;
    text-decoration:none;

}

.btn-save{

    background:linear-gradient(135deg,#2563eb,#3b82f6);
    color:white;

}

.btn-reset{

    background:linear-gradient(135deg,#ea580c,#fb923c);
    color:white;

}

.btn-back{

    background:linear-gradient(135deg,#16a34a,#22c55e);
    color:white;

}

.btn:hover{

    transform:translateY(-3px);
    box-shadow:0 10px 20px rgba(0,0,0,.3);

}

/* RESPONSIVE */

@media(max-width:900px){

.form-grid{

grid-template-columns:1fr;

}

.full{

grid-column:1;

}

.navbar{

flex-direction:column;
gap:20px;

}

.nav-links{

flex-wrap:wrap;
justify-content:center;

}

.title h2{

font-size:34px;

}

}

</style>

</head>

<body>

<div class="wrapper">

<div class="navbar">

<div class="brand">

<h1>Student Management System</h1>

<p>Register New Student</p>

</div>

<div class="nav-links">

<a href="/students/">Dashboard</a>
<a href="/students/register">Register</a>
<a href="/students/list">Students</a>

</div>

</div>

<div class="title">

<h2>Student Registration</h2>

<p>Fill in the details below to register a new student.</p>

</div>

<div class="form-container">

<form action="/students/save" method="post">

<div class="form-grid">

<div class="form-group">

<label>Student Name</label>

<input
type="text"
name="name"
placeholder="Enter Student Name"
required>

</div>

<div class="form-group">

<label>Email Address</label>

<input
type="email"
name="email"
placeholder="Enter Email"
required>

</div>

<div class="form-group">

<label>Mobile Number</label>

<input
type="text"
name="mobile"
placeholder="Enter Mobile Number"
required>

</div>

<div class="form-group">

<label>Course</label>

<select name="course.id">
    <c:forEach var="c" items="${courses}">
        <option value="${c.id}">
            ${c.courseName}
        </option>
    </c:forEach>
</select>

</div>
                <div class="form-group full">

                    <label>Address</label>

                    <textarea
                        name="address"
                        placeholder="Enter Complete Address"
                        required></textarea>

                </div>

                <div class="form-group">

                    <label>Status</label>

                    <select name="status" required>

                        <option value="">Select Status</option>
                        <option value="Active">Active</option>
                        <option value="Inactive">Inactive</option>

                    </select>

                </div>

                <div class="form-group">

                    <label>Student ID</label>

                    <input
                        type="text"
                        value="Auto Generated"
                        disabled>

                </div>

            </div>

            <div class="button-group">

                <button
                    type="submit"
                    class="btn btn-save">
                    Register Student
                </button>

                <button
                    type="reset"
                    class="btn btn-reset">
                    Clear
                </button>

                <a
                    href="/students/"
                    class="btn btn-back">
                    Dashboard
                </a>

            </div>

        </form>

    </div>

    <div style="
        margin-top:35px;
        text-align:center;
        color:white;
        font-size:15px;
        opacity:.9;">

        © 2026 Student Management System | Spring Boot MVC Project

    </div>

</div>

</body>
</html>
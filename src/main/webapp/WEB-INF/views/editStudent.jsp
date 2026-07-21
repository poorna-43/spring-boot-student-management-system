<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Student</title>

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
    url('https://images.unsplash.com/photo-1513258496099-48168024aec0?auto=format&fit=crop&w=1600&q=80');
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
    background:linear-gradient(135deg,#5b21b6,#7c3aed);
    padding:12px 18px;
    border-radius:10px;
    font-weight:600;
    transition:.3s;
}

.nav-links a:hover{
    transform:translateY(-2px);
}

.title{
    text-align:center;
    color:white;
    margin:40px 0 25px;
}

.title h2{
    font-size:40px;
}

.title p{
    margin-top:8px;
    color:#e2e8f0;
    font-size:17px;
}

/* FORM */

.form-card{

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

}

.form-group input,
.form-group select,
.form-group textarea{

    width:100%;
    padding:14px;
    border:none;
    border-radius:12px;
    outline:none;
    background:white;
    font-size:15px;

}

.form-group input:focus,
.form-group textarea:focus,
.form-group select:focus{

    box-shadow:0 0 10px #60a5fa;

}

textarea{

    height:120px;
    resize:none;

}

.full{

    grid-column:1/3;

}

.button-group{

    margin-top:35px;

    display:flex;
    justify-content:center;
    gap:20px;
    flex-wrap:wrap;

}

.btn{

    text-decoration:none;
    color:white;
    padding:14px 30px;
    border:none;
    border-radius:12px;
    cursor:pointer;
    font-size:16px;
    font-weight:bold;

}

.update{

    background:linear-gradient(135deg,#2563eb,#3b82f6);

}

.reset{

    background:linear-gradient(135deg,#ea580c,#fb923c);

}

.back{

    background:linear-gradient(135deg,#16a34a,#22c55e);

}

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

}

}

</style>

</head>

<body>

<div class="wrapper">

<div class="navbar">

<div class="brand">

<h1>Student Management System</h1>

<p>Edit Student Details</p>

</div>

<div class="nav-links">

<a href="/students/">Dashboard</a>

<a href="/students/register">Register</a>

<a href="/students/list">Students</a>

</div>

</div>

<div class="title">

<h2>Edit Student</h2>

<p>Update student information below.</p>

</div>

<div class="form-card">

<form action="/students/update" method="post">

<input
type="hidden"
name="id"
value="${student.id}">

<div class="form-grid">

<div class="form-group">

<label>Student Name</label>

<input
type="text"
name="name"
value="${student.name}"
required>

</div>

<div class="form-group">

<label>Email</label>

<input
type="email"
name="email"
value="${student.email}"
required>

</div>

<div class="form-group">

<label>Mobile</label>

<input
type="text"
name="mobile"
value="${student.mobile}"
required>

</div>

<div class="form-group">

<label>Course</label>

<select name="course.id">

    <c:forEach var="c" items="${courses}">

        <option value="${c.id}" 
            <c:if test="${student.course.id == c.id}">
                selected="selected"
            </c:if>
        >
            ${c.courseName}
        </option>

    </c:forEach>

</select>

</div>
<div class="form-group full">

<label>Address</label>

<textarea
name="address"
required>${student.address}</textarea>

</div>

<div class="form-group">

<label>Status</label>

<select name="status">

<option value="Active"
${student.status=='Active'?'selected':''}>

Active

</option>

<option value="Inactive"
${student.status=='Inactive'?'selected':''}>

Inactive

</option>

</select>

</div>

<div class="form-group">

<label>Student ID</label>

<input
type="text"
value="${student.id}"
disabled>

</div>

</div>

<div class="button-group">

<button
type="submit"
class="btn update">

Update Student

</button>

<button
type="reset"
class="btn reset">

Reset

</button>

<a
href="/students/list"
class="btn back">

Back to List

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

© 2026 Student Management System | Edit Student

</div>

</div>

</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student List</title>

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
    transition:.3s;
    font-weight:600;
}

.nav-links a:hover{
    transform:translateY(-2px);
}

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
    justify-content:space-between;
    align-items:center;
    flex-wrap:wrap;
    gap:20px;
    margin-bottom:25px;
}

.search-box{
    display:flex;
    gap:12px;
}

.search-box input{
    width:320px;
    padding:12px 15px;
    border:none;
    outline:none;
    border-radius:10px;
}

.search-box button{
    border:none;
    padding:12px 22px;
    border-radius:10px;
    cursor:pointer;
    color:white;
    font-weight:bold;
    background:linear-gradient(135deg,#2563eb,#3b82f6);
}

.add-btn{
    text-decoration:none;
    color:white;
    background:linear-gradient(135deg,#16a34a,#22c55e);
    padding:13px 22px;
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

.status-active{
    background:#dcfce7;
    color:#15803d;
    padding:7px 15px;
    border-radius:20px;
    font-size:13px;
    font-weight:bold;
}

.status-inactive{
    background:#fee2e2;
    color:#dc2626;
    padding:7px 15px;
    border-radius:20px;
    font-size:13px;
    font-weight:bold;
}

.action{
    text-decoration:none;
    color:white;
    padding:8px 14px;
    border-radius:8px;
    margin-right:8px;
    font-size:13px;
    font-weight:bold;
}

.view{
    background:#2563eb;
}

.edit{
    background:#f59e0b;
}

.delete{
    background:#dc2626;
}

.action:hover{
    opacity:.9;
}

@media(max-width:900px){

    .navbar{
        flex-direction:column;
        gap:20px;
    }

    .top-bar{
        flex-direction:column;
        align-items:stretch;
    }

    .search-box{
        flex-direction:column;
    }

    .search-box input{
        width:100%;
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

    <div class="navbar">

        <div class="brand">
            <h1>Student Management System</h1>
            <p>Student Records</p>
        </div>

        <div class="nav-links">
            <a href="/students/">Dashboard</a>
            <a href="/students/register">Register</a>
            <a href="/students/list">Students</a>
        </div>

    </div>

    <div class="title">
        <h2>All Students</h2>
        <p>View, update and manage student information.</p>
    </div>

    <div class="table-card">

        <div class="top-bar">

            <form class="search-box" action="/students/search">

                <input
                    type="text"
                    name="keyword"
                    placeholder="Search Student...">

                <button type="submit">
                    Search
                </button>

            </form>

            <a href="/students/register" class="add-btn">
                + Register Student
            </a>

        </div>

        <table>

            <thead>

                <tr>

                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Mobile</th>
                    <th>Course</th>
                    <th>Status</th>
                    <th>Actions</th>

                </tr>

            </thead>

            <tbody>

            <c:forEach var="student" items="${students}">

                <tr>

                    <td>${student.id}</td>

                    <td>${student.name}</td>

                    <td>${student.email}</td>

                    <td>${student.mobile}</td>

                    <td>${student.course.courseName}</td>

                    <td>

                        <c:choose>

                            <c:when test="${student.status=='Active'}">

                                <span class="status-active">
                                    ${student.status}
                                </span>

                            </c:when>

                            <c:otherwise>

                                <span class="status-inactive">
                                    ${student.status}
                                </span>

                            </c:otherwise>

                        </c:choose>

                    </td>
                                        <td>

                        <a
                            href="/students/view?id=${student.id}"
                            class="action view">

                            View

                        </a>

                        <a
                            href="/students/edit?id=${student.id}"
                            class="action edit">

                            Edit

                        </a>

                        <a
                            href="/students/delete?id=${student.id}"
                            class="action delete"
                            onclick="return confirm('Are you sure you want to delete this student?')">

                            Delete

                        </a>

                    </td>

                </tr>

            </c:forEach>

            <c:if test="${empty students}">

                <tr>

                    <td colspan="7"
                        style="
                        text-align:center;
                        padding:35px;
                        font-size:18px;
                        color:#64748b;
                        font-weight:bold;">

                        No Student Records Available

                    </td>

                </tr>

            </c:if>

            </tbody>

        </table>

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
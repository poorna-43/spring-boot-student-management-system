<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Management Dashboard</title>

<style>
    *{
        margin:0;
        padding:0;
        box-sizing:border-box;
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
    }

    body{
        min-height:100vh;
        background:
            linear-gradient(rgba(15,23,42,0.72), rgba(15,23,42,0.72)),
            url('https://images.unsplash.com/photo-1523050854058-8df90110c9f1?auto=format&fit=crop&w=1600&q=80');
        background-size:cover;
        background-position:center;
        background-attachment:fixed;
        color:#fff;
    }

    .wrapper{
        width:92%;
        margin:0 auto;
        padding:25px 0 40px;
    }

    /* NAVBAR */
    .navbar{
        display:flex;
        justify-content:space-between;
        align-items:center;
        padding:18px 28px;
        border-radius:20px;
        background:rgba(10,18,45,0.88);
        backdrop-filter:blur(10px);
        box-shadow:0 8px 25px rgba(0,0,0,0.35);
        margin-bottom:28px;
    }

    .brand h1{
        font-size:32px;
        font-weight:700;
        margin-bottom:4px;
    }

    .brand p{
        color:#dbeafe;
        font-size:15px;
    }

    .nav-links{
        display:flex;
        gap:15px;
        flex-wrap:wrap;
    }

    .nav-links a{
        text-decoration:none;
        color:white;
        background:linear-gradient(135deg,#5b21b6,#7c3aed);
        padding:12px 18px;
        border-radius:12px;
        font-weight:600;
        transition:0.3s;
        box-shadow:0 4px 12px rgba(0,0,0,0.25);
    }

    .nav-links a:hover{
        transform:translateY(-2px);
        background:linear-gradient(135deg,#6d28d9,#9333ea);
    }

    /* HERO */
    .hero{
        display:flex;
        justify-content:space-between;
        align-items:center;
        gap:20px;
        padding:35px;
        border-radius:24px;
        background:linear-gradient(135deg, rgba(255,255,255,0.18), rgba(255,255,255,0.08));
        backdrop-filter:blur(12px);
        box-shadow:0 10px 30px rgba(0,0,0,0.28);
        margin-bottom:28px;
    }

    .hero-left h2{
        font-size:48px;
        margin-bottom:10px;
        color:#ffffff;
    }

    .hero-left p{
        font-size:18px;
        color:#e2e8f0;
        line-height:1.6;
        max-width:780px;
    }

    .hero-actions{
        margin-top:22px;
        display:flex;
        gap:14px;
        flex-wrap:wrap;
    }

    .btn{
        text-decoration:none;
        padding:13px 22px;
        border-radius:12px;
        font-weight:700;
        transition:0.3s;
        display:inline-block;
    }

    .btn-primary{
        background:linear-gradient(135deg,#2563eb,#3b82f6);
        color:#fff;
    }

    .btn-secondary{
        background:linear-gradient(135deg,#16a34a,#22c55e);
        color:#fff;
    }

    .btn:hover{
        transform:translateY(-2px);
        box-shadow:0 8px 18px rgba(0,0,0,0.25);
    }

    /* STATS */
    .stats{
        display:grid;
        grid-template-columns:repeat(4,1fr);
        gap:20px;
        margin-bottom:30px;
    }

    .stat-card{
        padding:25px;
        border-radius:22px;
        color:#fff;
        box-shadow:0 10px 24px rgba(0,0,0,0.25);
        transition:0.3s;
    }

    .stat-card:hover{
        transform:translateY(-5px);
    }

    .stat-card h3{
        font-size:18px;
        margin-bottom:14px;
        font-weight:600;
    }

    .stat-card .num{
        font-size:42px;
        font-weight:800;
        margin-bottom:8px;
    }

    .stat-card p{
        font-size:15px;
        opacity:0.95;
    }

    .purple{ background:linear-gradient(135deg,#7c3aed,#a855f7); }
    .green{ background:linear-gradient(135deg,#16a34a,#4ade80); }
    .orange{ background:linear-gradient(135deg,#ea580c,#fb923c); }
    .blue{ background:linear-gradient(135deg,#2563eb,#38bdf8); }

    /* MODULES */
    .section-title{
        font-size:28px;
        margin:20px 0 18px;
        color:#fff;
    }

    .module-grid{
        display:grid;
        grid-template-columns:repeat(4,1fr);
        gap:20px;
        margin-bottom:32px;
    }

    .module-card{
        background:rgba(255,255,255,0.12);
        backdrop-filter:blur(12px);
        border-radius:22px;
        padding:26px 22px;
        box-shadow:0 10px 24px rgba(0,0,0,0.22);
        transition:0.3s;
        text-align:center;
        color:#fff;
    }

    .module-card:hover{
        transform:translateY(-6px);
        background:rgba(255,255,255,0.18);
    }

    .module-icon{
        font-size:42px;
        margin-bottom:14px;
    }

    .module-card h3{
        font-size:22px;
        margin-bottom:10px;
    }

    .module-card p{
        font-size:14px;
        line-height:1.6;
        color:#edf2f7;
        min-height:64px;
    }

    .module-card a{
        display:inline-block;
        margin-top:16px;
        text-decoration:none;
        color:#fff;
        font-weight:700;
        padding:10px 18px;
        border-radius:10px;
        background:linear-gradient(135deg,#4f46e5,#7c3aed);
    }

    /* MAIN GRID */
    .dashboard-grid{
        display:grid;
        grid-template-columns:2fr 1fr;
        gap:22px;
        margin-top:10px;
    }

    .card{
        background:rgba(255,255,255,0.95);
        color:#1e293b;
        border-radius:22px;
        padding:24px;
        box-shadow:0 10px 28px rgba(0,0,0,0.22);
    }

    .card-header{
        display:flex;
        justify-content:space-between;
        align-items:center;
        margin-bottom:18px;
    }

    .card-header h2{
        color:#1e1b4b;
        font-size:28px;
    }

    .view-all-btn{
        text-decoration:none;
        background:linear-gradient(135deg,#5b21b6,#7c3aed);
        color:#fff;
        padding:10px 16px;
        border-radius:10px;
        font-weight:700;
    }

    /* TABLE */
    .table-wrap{
        overflow-x:auto;
    }

    table{
        width:100%;
        border-collapse:collapse;
    }

    thead{
        background:#f1f5f9;
    }

    thead th{
        padding:16px 14px;
        text-align:left;
        color:#334155;
        font-size:15px;
    }

    tbody td{
        padding:16px 14px;
        border-bottom:1px solid #e2e8f0;
        color:#334155;
        font-size:15px;
    }

    tbody tr:hover{
        background:#f8fafc;
    }

    .badge{
        padding:7px 14px;
        border-radius:999px;
        font-size:13px;
        font-weight:700;
        display:inline-block;
    }

    .badge-active{
        background:#dcfce7;
        color:#15803d;
    }

    .badge-inactive{
        background:#fee2e2;
        color:#dc2626;
    }

    .actions a{
        text-decoration:none;
        color:#fff;
        padding:8px 12px;
        border-radius:8px;
        font-size:13px;
        font-weight:700;
        margin-right:8px;
        display:inline-block;
    }

    .view-btn{
        background:#2563eb;
    }

    .edit-btn{
        background:#f59e0b;
    }

    /* QUICK PANEL */
    .quick-list{
        display:flex;
        flex-direction:column;
        gap:14px;
        margin-top:8px;
    }

    .quick-item{
        background:#f8fafc;
        border-left:6px solid #7c3aed;
        padding:16px;
        border-radius:14px;
    }

    .quick-item h4{
        color:#1e1b4b;
        margin-bottom:6px;
        font-size:18px;
    }

    .quick-item p{
        color:#475569;
        font-size:14px;
        line-height:1.5;
    }

    .quick-item a{
        display:inline-block;
        margin-top:10px;
        text-decoration:none;
        color:#4f46e5;
        font-weight:700;
    }

    /* FOOTER */
    .footer-note{
        margin-top:28px;
        text-align:center;
        color:#e2e8f0;
        font-size:15px;
    }

    /* RESPONSIVE */
    @media(max-width:1200px){
        .stats{ grid-template-columns:repeat(2,1fr); }
        .module-grid{ grid-template-columns:repeat(2,1fr); }
        .dashboard-grid{ grid-template-columns:1fr; }
    }

    @media(max-width:768px){
        .navbar{
            flex-direction:column;
            align-items:flex-start;
            gap:18px;
        }

        .hero{
            flex-direction:column;
            align-items:flex-start;
        }

        .hero-left h2{
            font-size:36px;
        }

        .stats{ grid-template-columns:1fr; }
        .module-grid{ grid-template-columns:1fr; }
        .brand h1{ font-size:26px; }
    }
</style>
</head>
<body>

<div class="wrapper">

    <!-- NAVBAR -->
    <div class="navbar">
        <div class="brand">
            <h1>Student Management System</h1>
            <p>Admin Dashboard</p>
        </div>

        <div class="nav-links">
            <a href="/students/">Dashboard</a>
            <a href="/students/register">Register Student</a>
            <a href="/students/list">View Students</a>
        </div>
    </div>

    <!-- HERO SECTION -->
    <div class="hero">
        <div class="hero-left">
            <h2>Welcome Back 👋</h2>
            <p>
                Manage student registrations, course details, attendance, fee records and reports
                from one centralized dashboard.
            </p>

            <div class="hero-actions">
                <a class="btn btn-primary" href="/students/register">Register Student</a>
                <a class="btn btn-secondary" href="/students/list">View All Students</a>
            </div>
        </div>
    </div>

    <!-- STATISTICS -->
    <div class="stats">
        <div class="stat-card purple">
            <h3>Total Students</h3>
            <div class="num">${totalStudents}</div>
            <p>Registered student records</p>
        </div>

        <div class="stat-card green">
            <h3>Active Students</h3>
            <div class="num">${activeStudents}</div>
            <p>Currently active in system</p>
        </div>

        <div class="stat-card orange">
            <h3>Courses</h3>
            <div class="num">${totalCourses}</div>
            <p>Available courses</p>
        </div>

        <div class="stat-card blue">
            <h3>Attendance</h3>
            <div class="num">92%</div>
            <p>Average attendance rate</p>
        </div>
    </div>

    <!-- MODULES -->
    <h2 class="section-title">Student Management Modules</h2>
    <div class="module-grid">

        <div class="module-card">
            <div class="module-icon">📝</div>
            <h3>Register Student</h3>
            <p>Add new student details like name, email, mobile, course, address and admission information.</p>
            <a href="/students/register">Open</a>
        </div>

        <div class="module-card">
            <div class="module-icon">📋</div>
            <h3>View Students</h3>
            <p>Display all student records with options to search, edit, delete and view profile details.</p>
            <a href="/students/list">Open</a>
        </div>

        <div class="module-card">
            <div class="module-icon">🔍</div>
            <h3>Search Student</h3>
            <p>Search student information using student id, name, email, course or mobile number.</p>
            <a href="/students/search">Open</a>
        </div>

        <div class="module-card">
            <div class="module-icon">📚</div>
            <h3>Manage Courses</h3>
            <p>Maintain course information, course duration, trainers, fee details and assigned students.</p>
            <a href="/courses/list">Open</a>
        </div>

        <div class="module-card">
            <div class="module-icon">📅</div>
            <h3>Attendance</h3>
            <p>Track student daily attendance, present/absent status and monthly attendance percentage.</p>
            <a href="/attendance/list">Open</a>
        </div>

        <div class="module-card">
            <div class="module-icon">💰</div>
            <h3>Fee Details</h3>
            <p>Manage fee payment status, pending amounts, due dates and complete payment history.</p>
            <a href="/fees/list">Open</a>
        </div>

        <div class="module-card">
            <div class="module-icon">📈</div>
            <h3>Reports</h3>
            <p>Generate student reports, admission reports, attendance summaries and fee collection reports.</p>
            <a href="/reports">Open</a>
        </div>

        <div class="module-card">
            <div class="module-icon">⚙️</div>
            <h3>Admin Settings</h3>
            <p>Manage admin profile, password settings, system configuration and dashboard preferences.</p>
            <a href="/admin/settings">Open</a>
        </div>

    </div>

    <!-- LOWER DASHBOARD -->
    <div class="dashboard-grid">

        <!-- RECENT STUDENTS TABLE -->
        <div class="card">
            <div class="card-header">
                <h2>Recent Students</h2>
                <a class="view-all-btn" href="/students/list">View All</a>
            </div>

            <div class="table-wrap">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Course</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach var="s" items="${students}">
                            <tr>
                                <td>${s.id}</td>
                                <td>${s.name}</td>
                                <td>${s.email}</td>
                                <td>${s.course}</td>
                                <td>
                                    <span class="${s.status == 'Inactive' ? 'badge badge-inactive' : 'badge badge-active'}">
                                        ${s.status}
                                    </span>
                                </td>
                                <td class="actions">
                                    <a class="view-btn" href="/students/view?id=${s.id}">View</a>
                                    <a class="edit-btn" href="/students/edit?id=${s.id}">Edit</a>
                                </td>
                            </tr>
                        </c:forEach>

                        <c:if test="${empty students}">
                            <tr>
                                <td colspan="6" style="text-align:center; padding:25px;">
                                    No student records available
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- QUICK ACCESS PANEL -->
        <div class="card">
            <div class="card-header">
                <h2>Quick Access</h2>
            </div>

            <div class="quick-list">
                <div class="quick-item">
                    <h4>New Admission</h4>
                    <p>Register a newly joined student with course and contact details.</p>
                    <a href="/students/register">Go to Registration →</a>
                </div>

                <div class="quick-item">
                    <h4>Update Student</h4>
                    <p>Edit student course, email, mobile number or status whenever required.</p>
                    <a href="/students/list">Manage Students →</a>
                </div>

                <div class="quick-item">
                    <h4>Attendance Entry</h4>
                    <p>Mark daily attendance and monitor student participation records.</p>
                    <a href="/attendance/list">Open Attendance →</a>
                </div>

                <div class="quick-item">
                    <h4>Fee Tracking</h4>
                    <p>Check pending fees, paid fees and payment due information.</p>
                    <a href="/fees/list">Open Fee Module →</a>
                </div>

                <div class="quick-item">
                    <h4>Reports</h4>
                    <p>Generate complete academic and fee reports for students.</p>
                    <a href="/reports">Open Reports →</a>
                </div>
            </div>
        </div>

    </div>

    <div class="footer-note">
        Student Management Dashboard
    </div>

</div>

</body>
</html>
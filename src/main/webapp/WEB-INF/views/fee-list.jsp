<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fee List</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
}

body {
    min-height: 100vh;
    background: linear-gradient(rgba(15,23,42,.72), rgba(15,23,42,.72)),
                url("https://images.unsplash.com/photo-1523240795612-9a054b0db644?auto=format&fit=crop&w=1600&q=80");
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
}

.wrapper {
    width: 92%;
    margin: auto;
    padding: 25px 0 40px;
}

.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 18px 28px;
    border-radius: 18px;
    background: rgba(10,18,45,.88);
    backdrop-filter: blur(12px);
    box-shadow: 0 8px 20px rgba(0,0,0,.35);
}

.brand h1 {
    color: white;
    font-size: 30px;
}

.brand p {
    color: #dbeafe;
    margin-top: 5px;
}

.nav-links {
    display: flex;
    gap: 15px;
}

.nav-links a {
    text-decoration: none;
    color: white;
    padding: 12px 18px;
    border-radius: 10px;
    background: linear-gradient(135deg, #5b21b6, #7c3aed);
    font-weight: 600;
}

.title {
    text-align: center;
    color: white;
    margin: 35px 0;
}

.title h2 {
    font-size: 42px;
    margin-bottom: 8px;
}

.title p {
    color: #e2e8f0;
    font-size: 18px;
}

.table-card {
    background: rgba(255,255,255,.12);
    backdrop-filter: blur(14px);
    border-radius: 25px;
    padding: 30px;
    box-shadow: 0 15px 35px rgba(0,0,0,.35);
}

.top-bar {
    display: flex;
    justify-content: flex-end;
    margin-bottom: 25px;
}

.add-btn {
    text-decoration: none;
    color: white;
    background: linear-gradient(135deg, #16a34a, #22c55e);
    padding: 13px 22px;
    border-radius: 10px;
    font-weight: bold;
}

table {
    width: 100%;
    border-collapse: collapse;
    border-radius: 15px;
    overflow: hidden;
}

thead {
    background: #312e81;
}

thead th {
    color: white;
    padding: 18px;
    text-align: left;
}

tbody {
    background: white;
}

tbody td {
    padding: 16px;
    border-bottom: 1px solid #e2e8f0;
    color: #334155;
}

tbody tr:hover {
    background: #f8fafc;
}

.status-paid {
    background: #dcfce7;
    color: #15803d;
    padding: 6px 14px;
    border-radius: 20px;
    font-weight: bold;
}

.status-partial {
    background: #fef3c7;
    color: #b45309;
    padding: 6px 14px;
    border-radius: 20px;
    font-weight: bold;
}

.status-unpaid {
    background: #fee2e2;
    color: #dc2626;
    padding: 6px 14px;
    border-radius: 20px;
    font-weight: bold;
}

.action {
    text-decoration: none;
    color: white;
    padding: 8px 14px;
    border-radius: 8px;
    font-size: 13px;
    font-weight: bold;
    background: #dc2626;
}
</style>
</head>

<body>
<div class="wrapper">
    <div class="navbar">
        <div class="brand">
            <h1>Student Management System</h1>
            <p>Fee Records</p>
        </div>
        <div class="nav-links">
            <a href="/students/">Dashboard</a>
            <a href="/fees/add">Add Fee</a>
        </div>
    </div>

    <div class="title">
        <h2>Fee Details</h2>
        <p>View and manage student fee payments.</p>
    </div>

    <div class="table-card">
        <div class="top-bar">
            <a href="/fees/add" class="add-btn">+ Add Fee</a>
        </div>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Student</th>
                    <th>Total Fee</th>
                    <th>Paid</th>
                    <th>Due</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="fee" items="${feeList}">
                    <tr>
                        <td>${fee.id}</td>
                        <td>${fee.student.name}</td>
                        <td>${fee.totalAmount}</td>
                        <td>${fee.paidAmount}</td>
                        <td>${fee.dueAmount}</td>
                        <td>${fee.date}</td>
                        <td>
                            <c:choose>
                                <c:when test="${fee.status=='PAID'}">
                                    <span class="status-paid">PAID</span>
                                </c:when>
                                <c:when test="${fee.status=='PARTIAL'}">
                                    <span class="status-partial">PARTIAL</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="status-unpaid">UNPAID</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <a href="/fees/delete?id=${fee.id}" class="action"
                               onclick="return confirm('Delete this fee record?')">
                                Delete
                            </a>
                        </td>
                    </tr>
                </c:forEach>

                <c:if test="${empty feeList}">
                    <tr>
                        <td colspan="8" style="text-align:center;padding:30px;font-weight:bold;">
                            No Fee Records Available
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>

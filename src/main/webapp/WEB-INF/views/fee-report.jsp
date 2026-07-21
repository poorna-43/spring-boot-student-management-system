<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fee Report</title>

<style>
/* same UI */
*{margin:0;padding:0;box-sizing:border-box;font-family:"Segoe UI";}
body{min-height:100vh;background:
linear-gradient(rgba(15,23,42,.72),rgba(15,23,42,.72)),
url('https://images.unsplash.com/photo-1523240795612-9a054b0db644?auto=format&fit=crop&w=1600&q=80');
background-size:cover;background-position:center;background-attachment:fixed;}

.wrapper{width:92%;margin:auto;padding:25px 0;}

.navbar{display:flex;justify-content:space-between;align-items:center;padding:18px 28px;
background:rgba(10,18,45,.88);border-radius:18px;}

.brand h1{color:white;}
.brand p{color:#dbeafe;}

.nav-links a{color:white;text-decoration:none;padding:10px 16px;margin-left:10px;
background:linear-gradient(135deg,#5b21b6,#7c3aed);border-radius:8px;}

.title{text-align:center;color:white;margin:35px 0;}

.table-card{background:rgba(255,255,255,.12);backdrop-filter:blur(14px);
padding:25px;border-radius:20px;}

table{width:100%;border-collapse:collapse;}
thead{background:#312e81;}
thead th{color:white;padding:15px;}
tbody{background:white;}
tbody td{padding:15px;border-bottom:1px solid #e2e8f0;}

.status-paid{color:green;font-weight:bold;}
.status-partial{color:orange;font-weight:bold;}
.status-unpaid{color:red;font-weight:bold;}
</style>

</head>

<body>

<div class="wrapper">

    <div class="navbar">
        <div class="brand">
            <h1>Fee Report</h1>
            <p>Payment Details</p>
        </div>

        <div class="nav-links">
            <a href="/reports">Back</a>
            <a href="/students/">Dashboard</a>
        </div>
    </div>

    <div class="title"><h2>Fee Report</h2></div>

    <div class="table-card">

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Student</th>
                    <th>Total</th>
                    <th>Paid</th>
                    <th>Due</th>
                    <th>Date</th>
                    <th>Status</th>
                </tr>
            </thead>

            <tbody>

                <c:forEach var="f" items="${feeList}">
                    <tr>
                        <td>${f.id}</td>
                        <td>${f.student.name}</td>
                        <td>${f.totalAmount}</td>
                        <td>${f.paidAmount}</td>
                        <td>${f.dueAmount}</td>
                        <td>${f.date}</td>
                        <td>${f.status}</td>
                    </tr>
                </c:forEach>

            </tbody>

        </table>

    </div>

</div>

</body>
</html>
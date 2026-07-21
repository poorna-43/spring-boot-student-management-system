<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fee Management</title>

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
	font-weight:600;
	transition:.3s;
}

.nav-links a:hover{
	transform:translateY(-2px);
}

/* TITLE */

.title{
	text-align:center;
	color:white;
	margin:35px 0;
}

.title h2{
	font-size:40px;
	margin-bottom:8px;
}

.title p{
	color:#e2e8f0;
	font-size:18px;
}

/* FORM CARD */

.form-card{
	width:650px;
	margin:auto;
	background:rgba(255,255,255,.12);
	backdrop-filter:blur(14px);
	padding:35px;
	border-radius:25px;
	box-shadow:0 15px 35px rgba(0,0,0,.35);
}

.form-group{
	margin-bottom:20px;
}

.form-group label{
	display:block;
	color:white;
	margin-bottom:8px;
	font-weight:bold;
}

.form-group input,
.form-group select{
	width:100%;
	padding:13px;
	border:none;
	outline:none;
	border-radius:10px;
	font-size:15px;
}

.button-group{
	display:flex;
	justify-content:space-between;
	margin-top:25px;
}

.btn{
	text-decoration:none;
	border:none;
	cursor:pointer;
	padding:13px 24px;
	border-radius:10px;
	color:white;
	font-size:15px;
	font-weight:bold;
}

.save{
	background:linear-gradient(135deg,#16a34a,#22c55e);
}

.cancel{
	background:linear-gradient(135deg,#dc2626,#ef4444);
}

.btn:hover{
	opacity:.9;
}

@media(max-width:768px){

	.form-card{
		width:95%;
	}

	.button-group{
		flex-direction:column;
		gap:15px;
	}

}

</style>

</head>

<body>

<div class="wrapper">

	<div class="navbar">

		<div class="brand">
			<h1>Student Management System</h1>
			<p>Fee Management</p>
		</div>

		<div class="nav-links">
			<a href="/students/">Dashboard</a>
			<a href="/fee/list">Fee List</a>
		</div>

	</div>

	<div class="title">
		<h2>Student Fee Form</h2>
		<p>Enter fee payment details</p>
	</div>

	<div class="form-card">

		<form action="/fee/save" method="post">

			<div class="form-group">

				<label>Select Student</label>

				<select name="studentId" required>

					<option value="">-- Select Student --</option>

					<c:forEach var="student" items="${students}">
						<option value="${student.id}">
							${student.name}
						</option>
					</c:forEach>

				</select>

			</div>

			<div class="form-group">

				<label>Total Fee</label>

				<input
					type="number"
					step="0.01"
					name="totalAmount"
					required>

			</div>

			<div class="form-group">

				<label>Paid Amount</label>

				<input
					type="number"
					step="0.01"
					name="paidAmount"
					required>

			</div>

			<div class="form-group">

				<label>Payment Date</label>

				<input
					type="date"
					name="date"
					required>

			</div>
						<div class="button-group">

				<button type="submit" class="btn save">
					Save Fee
				</button>

				<a href="/fee/list" class="btn cancel">
					Cancel
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

		© 2026 Student Management System | Fee Management Module

	</div>

</div>

</body>
</html>
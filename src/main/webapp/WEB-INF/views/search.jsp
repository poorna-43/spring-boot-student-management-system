<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Student</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
}

body {
	min-height: 100vh;
	background: linear-gradient(rgba(15, 23, 42, .72), rgba(15, 23, 42, .72)),
		url('https://images.unsplash.com/photo-1498243691581-b145c3f54a5a?auto=format&fit=crop&w=1600&q=80');
	background-size: cover;
	background-position: center;
	background-attachment: fixed;
}

.wrapper {
	width: 92%;
	margin: auto;
	padding: 25px 0 40px;
}

/* NAVBAR */
.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 18px 28px;
	background: rgba(10, 18, 45, .88);
	backdrop-filter: blur(12px);
	border-radius: 18px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, .35);
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
	background: linear-gradient(135deg, #5b21b6, #7c3aed);
	padding: 12px 18px;
	border-radius: 10px;
	font-weight: 600;
	transition: .3s;
}

.nav-links a:hover {
	transform: translateY(-2px);
}

/* SEARCH CARD */
.search-card {
	width: 900px;
	max-width: 100%;
	margin: 45px auto;
	background: rgba(255, 255, 255, .14);
	backdrop-filter: blur(15px);
	border-radius: 25px;
	padding: 40px;
	box-shadow: 0 15px 35px rgba(0, 0, 0, .35);
}

.search-card h2 {
	text-align: center;
	color: white;
	font-size: 36px;
	margin-bottom: 10px;
}

.search-card p {
	text-align: center;
	color: #dbeafe;
	margin-bottom: 35px;
}

.search-box {
	display: flex;
	gap: 15px;
	flex-wrap: wrap;
}

.search-box input {
	flex: 1;
	min-width: 250px;
	padding: 15px;
	border: none;
	border-radius: 12px;
	outline: none;
	font-size: 15px;
}

.search-box button {
	padding: 15px 30px;
	border: none;
	border-radius: 12px;
	cursor: pointer;
	color: white;
	font-size: 15px;
	font-weight: bold;
	background: linear-gradient(135deg, #2563eb, #3b82f6);
}

.search-box button:hover {
	opacity: .9;
}

.result-card {
	margin-top: 35px;
	background: white;
	border-radius: 18px;
	overflow: hidden;
}

table {
	width: 100%;
	border-collapse: collapse;
}

thead {
	background: #312e81;
}

thead th {
	color: white;
	padding: 16px;
	text-align: left;
}

tbody td {
	padding: 16px;
	border-bottom: 1px solid #e2e8f0;
	color: #334155;
}

tbody tr:hover {
	background: #f8fafc;
}

.active {
	background: #dcfce7;
	color: #15803d;
	padding: 6px 15px;
	border-radius: 20px;
	font-weight: bold;
}

.inactive {
	background: #fee2e2;
	color: #dc2626;
	padding: 6px 15px;
	border-radius: 20px;
	font-weight: bold;
}

.action {
	text-decoration: none;
	color: white;
	padding: 8px 12px;
	border-radius: 8px;
	font-size: 13px;
	margin-right: 8px;
	font-weight: bold;
}

.view {
	background: #2563eb;
}

.edit {
	background: #f59e0b;
}

@media ( max-width :900px) {
	.navbar {
		flex-direction: column;
		gap: 20px;
	}
	.nav-links {
		flex-wrap: wrap;
	}
	.search-box {
		flex-direction: column;
	}
	.search-box input {
		width: 100%;
	}
	.result-card {
		overflow-x: auto;
	}
}
</style>

</head>

<body>

	<div class="wrapper">

		<div class="navbar">

			<div class="brand">

				<h1>Student Management System</h1>

				<p>Search Student</p>

			</div>

			<div class="nav-links">

				<a href="/students/">Dashboard</a> <a href="/students/register">Register</a>

				<a href="/students/list">Students</a>

			</div>

		</div>

		<div class="search-card">

			<h2>Search Student</h2>

			<p>Search using Student ID, Name, Email, Mobile or Course.</p>

			<form action="/students/search" method="get">

				<div class="search-box">

					<input type="text" name="keyword"
						placeholder="Enter Student ID, Name, Email, Mobile or Course"
						required>

					<button type="submit">Search</button>

				</div>

			</form>

			<div class="result-card">

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

								<td>${student.course}</td>

								<td><c:choose>

										<c:when test="${student.status=='Active'}">

											<span class="active"> ${student.status} </span>

										</c:when>

										<c:otherwise>

											<span class="inactive"> ${student.status} </span>

										</c:otherwise>

									</c:choose></td>

								<td><a href="/students/view?id=${student.id}"
									class="action view"> View </a> <a
									href="/students/edit?id=${student.id}" class="action edit">

										Edit </a> <a href="/students/delete?id=${student.id}"
									class="action delete"
									onclick="return confirm('Are you sure you want to delete this student?')">

										Delete </a></td>

							</tr>

						</c:forEach>

						<c:if test="${empty students}">

							<tr>

								<td colspan="7"
									style="text-align: center; padding: 35px; font-size: 18px; color: #64748b; font-weight: bold;">

									No Student Found</td>

							</tr>

						</c:if>

					</tbody>

				</table>

			</div>

			<div
				style="display: flex; justify-content: center; gap: 20px; margin-top: 35px; flex-wrap: wrap;">

				<a href="/students/list"
					style="text-decoration: none; background: linear-gradient(135deg, #2563eb, #3b82f6); color: white; padding: 14px 28px; border-radius: 12px; font-weight: bold;">

					📋 View All Students </a> <a href="/students/register"
					style="text-decoration: none; background: linear-gradient(135deg, #16a34a, #22c55e); color: white; padding: 14px 28px; border-radius: 12px; font-weight: bold;">

					➕ Register Student </a> <a href="/students/"
					style="text-decoration: none; background: linear-gradient(135deg, #7c3aed, #9333ea); color: white; padding: 14px 28px; border-radius: 12px; font-weight: bold;">

					🏠 Dashboard </a>

			</div>

		</div>

		<div
			style="margin-top: 35px; text-align: center; color: white; font-size: 15px; letter-spacing: 1px;">

			© 2026 Student Management System | Search Student</div>

	</div>

</body>

</html>
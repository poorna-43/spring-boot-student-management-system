<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Student</title>

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
		url('https://images.unsplash.com/photo-1522202176988-66273c2fd55f?auto=format&fit=crop&w=1600&q=80');
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
	border-radius: 18px;
	background: rgba(10, 18, 45, .88);
	backdrop-filter: blur(12px);
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
	transition: .3s;
	font-weight: 600;
}

.nav-links a:hover {
	transform: translateY(-2px);
}

/* PROFILE CARD */
.profile-card {
	width: 900px;
	max-width: 100%;
	margin: 40px auto;
	background: rgba(255, 255, 255, .14);
	backdrop-filter: blur(14px);
	border-radius: 25px;
	box-shadow: 0 15px 35px rgba(0, 0, 0, .35);
	overflow: hidden;
}

.profile-header {
	background: linear-gradient(135deg, #4f46e5, #7c3aed);
	color: white;
	text-align: center;
	padding: 35px;
}

.avatar {
	width: 120px;
	height: 120px;
	border-radius: 50%;
	background: white;
	color: #4f46e5;
	font-size: 60px;
	display: flex;
	align-items: center;
	justify-content: center;
	margin: auto;
	margin-bottom: 18px;
	font-weight: bold;
}

.profile-header h2 {
	font-size: 34px;
}

.profile-header p {
	margin-top: 8px;
	font-size: 17px;
}

.profile-body {
	padding: 40px;
}

.details {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	gap: 25px;
}

.item {
	background: rgba(255, 255, 255, .85);
	padding: 18px;
	border-radius: 15px;
}

.item h4 {
	color: #4f46e5;
	margin-bottom: 8px;
	font-size: 16px;
}

.item p {
	color: #334155;
	font-size: 16px;
	word-break: break-word;
}

.full {
	grid-column: 1/3;
}

@media ( max-width :900px) {
	.navbar {
		flex-direction: column;
		gap: 20px;
	}
	.nav-links {
		flex-wrap: wrap;
		justify-content: center;
	}
	.details {
		grid-template-columns: 1fr;
	}
	.full {
		grid-column: 1;
	}
	.profile-header h2 {
		font-size: 28px;
	}
}
</style>

</head>

<body>

	<div class="wrapper">

		<div class="navbar">

			<div class="brand">

				<h1>Student Management System</h1>

				<p>Student Profile</p>

			</div>

			<div class="nav-links">

				<a href="/students/">Dashboard</a> <a href="/students/register">Register</a>

				<a href="/students/list">Students</a>

			</div>

		</div>

		<div class="profile-card">

			<div class="profile-header">

				<div class="avatar">👨‍🎓</div>

				<h2>${student.name}</h2>

				<p>Student Information</p>

			</div>

			<div class="profile-body">

				<div class="details">

					<div class="item">

						<h4>Student ID</h4>

						<p>${student.id}</p>

					</div>

					<div class="item">

						<h4>Student Name</h4>

						<p>${student.name}</p>

					</div>

					<div class="item">

						<h4>Email Address</h4>

						<p>${student.email}</p>

					</div>

					<div class="item">

						<h4>Mobile Number</h4>

						<p>${student.mobile}</p>

					</div>

					<div class="item">

						<h4>Course</h4>

						<p>${student.course}</p>

					</div>

					<div class="item full">

						<h4>Address</h4>

						<p>${student.address}</p>

					</div>
					<div class="item">

						<h4>Status</h4>

						<p>

							<span
								style="
display:inline-block;
padding:8px 18px;
border-radius:25px;
font-weight:bold;
background:${student.status=='Active' ? '#dcfce7' : '#fee2e2'};
color:${student.status=='Active' ? '#15803d' : '#dc2626'};
">

								${student.status} </span>

						</p>

					</div>

				</div>

				<div
					style="display: flex; justify-content: center; gap: 18px; margin-top: 40px; flex-wrap: wrap;">

					<a href="/students/edit/${student.id}"
						style="text-decoration: none; background: linear-gradient(135deg, #f59e0b, #fbbf24); color: white; padding: 14px 28px; border-radius: 12px; font-weight: bold; transition: .3s;">

						✏ Edit Student </a> <a href="/students/delete/${student.id}"
						onclick="return confirm('Delete this student?')"
						style="text-decoration: none; background: linear-gradient(135deg, #dc2626, #ef4444); color: white; padding: 14px 28px; border-radius: 12px; font-weight: bold;">

						🗑 Delete Student </a> <a href="/students/list"
						style="text-decoration: none; background: linear-gradient(135deg, #2563eb, #3b82f6); color: white; padding: 14px 28px; border-radius: 12px; font-weight: bold;">

						📋 Back to Student List </a>

				</div>

			</div>

		</div>

		<div
			style="margin-top: 35px; text-align: center; color: white; font-size: 15px; letter-spacing: 1px;">

			© 2026 Student Management System | Student Profile</div>

	</div>

</body>

</html>
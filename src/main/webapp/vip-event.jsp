<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>DevOps Engineering - Scaler</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<style>
body {
	font-family: Arial, sans-serif;
	padding-top: 150px; /* Prevents overlap with the fixed form */
}

.reg-flex{

}

.hero-section {
	background: url('https://via.placeholder.com/1200x500') no-repeat center
		center;
	background-size: cover;
	color: white;
	padding: 60px 0;
	position: relative;
}

.overlay {
	background: rgba(0, 0, 0, 0.5);
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

.content {
	position: relative;
	z-index: 2;
}

.container {
	margin-top: 20px;
}

.title {
	font-weight: bold;
	color: black;
}

.info-section {
	padding: 20px;
}

.highlight {
	font-weight: bold;
}

/* Fixed Form Container */
.fixed-form-container {
	position: fixed;
	top: 100px; /* Just below the navbar */ right : 20px; width : 350px;
	z-index: 999;
	background: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 350px;
	right: 20px;
}

.register-btn {
	background: #ff4d4d;
	color: white;
	font-weight: bold;
	border: none;
	padding: 10px;
	width: 100%;
	border-radius: 5px;
}

.register-btn:hover {
	background: #e63946;
}

.already-account {
	color: blue;
	text-decoration: none;
}

.alert {
	color: red;
	font-size: 14px;
}

.countdown {
	font-size: 14px;
	color: red;
	font-weight: bold;
}

/* Navbar */
.navbar {
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 1000;
	background: white;
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
}

/* Light blue section headers */
.section-header {
	background: #f0f8ff;
	padding: 10px 15px;
	font-size: 20px;
	font-weight: bold;
	color: #1a3d7c;
	border-radius: 5px;
	margin-bottom: 15px;
}

/* Bullet points styling */
.content-section ul {
	list-style-type: disc;
	padding-left: 20px;
}

/* Certificates styling */
.certificate-text {
	font-weight: bold;
}

/* Icons with text section */
.masterclass-for {
	background: #f0f8ff;
	padding: 15px;
	border-radius: 5px;
	margin-top: 20px;
}

.audience-section {
	display: flex;
	justify-content: space-around;
	text-align: center;
	margin-top: 15px;
}

.audience-item {
	flex: 1;
	text-align: center;
}

.audience-item img {
	width: 50px;
	margin-bottom: 10px;
}

.audience-item p {
	font-size: 14px;
	color: #333;
}
</style>
</head>
<body>

	<!-- Navbar -->
	<nav class="navbar navbar-light bg-light">
		<div class="container">
			<a class="navbar-brand fw-bold" href="#">PCS Cloud Lab</a> <a
				class="btn btn-outline-primary" href="#">Login</a>
		</div>
	</nav>
	<div class="reg-flex">
		<!-- Hero Section -->
		<section class="hero-section text-center">
			<div class="overlay"></div>
			<div class="container content">
				<div class="row align-items-center">
					<div class="col-md-6 text-white">
						<span class="badge bg-warning text-dark p-2">Free Guidance</span>
						<h2 class="mt-3">Learn the right skills & tools for</h2>
						<h1 class="fw-bold bg-success text-white d-inline-block p-2">DevOps
							Engineering</h1>
						<p class="mt-3">
							PCS Cloud Lab Masterclass with <strong>Anshuman Singh</strong>,
							Ex-Tech Lead, Meta
						</p>
						<p>
							<strong>Tuesday, 18th March | 7:30 - 9:30 PM</strong>
						</p>
					</div>
				</div>
			</div>
		</section>

		<!-- Registration Form (Fixed) -->
		<div class="fixed-form-container">
			<h4 class="title">Register NOW!</h4>
			<p class="countdown">
				Starts in <span>00 d : 05 h : 36 m</span>
			</p>
			<a href="#" class="already-account">Already have an account?
				Click here</a>

			<form class="mt-3">
				<div class="mb-2">
					<input type="email" class="form-control" placeholder="Email">
				</div>
				<div class="mb-2 d-flex">
					<select class="form-select" style="width: 30%;">
						<option>+91</option>
					</select> <input type="text" class="form-control" placeholder="Phone">
				</div>
				<div class="mb-2">
					<input type="text" class="form-control" placeholder="Name">
				</div>

				<button class="register-btn">REGISTER FOR FREE</button>

				<p class="text-muted text-center mt-2" style="font-size: 12px;">
					By continuing, you agree to Scaler’s <a href="#">Terms</a> and <a
						href="#">Privacy Policy</a>.
				</p>
			</form>
		</div>
	</div>

	<!-- Main Content -->
	<div class="container">
		<div class="row">
			<div class="col-md-7">
				<h2 class="title">Roadmap to DevOps Engineering</h2>
				<p>
					<strong>STARTS ON:</strong> March 18, 2025 7:30 PM (IST) <strong>ENDS
						ON:</strong> March 18, 2025 9:30 PM (IST) <strong>VENUE:</strong> Online
				</p>
				<hr>
				<div class="info-section bg-light rounded">
					<h5 class="title text-black- p-2">About this Masterclass</h5>
					<p>From fast-growing startups to global tech giants, every
						company relies on engineers to scale, deploy, and manage
						infrastructure efficiently—while keeping costs low and quality
						high.</p>
					<p>Enter DevOps Engineers—the key players who bridge the gap
						between development and operations, foster seamless collaboration,
						and drive smooth software delivery.</p>
					<p>Curious about how to become one?</p>
					<p>
						Join this Scaler Masterclass with industry expert <span
							class="highlight">Anshuman Singh</span> on <span
							class="highlight">Tuesday, 18th March</span>, from <span
							class="highlight">7:30 PM</span>. Learn the key skills,
						responsibilities, and career pathways of DevOps engineers, and get
						expert tips on how to crack interviews.
					</p>
				</div>

				<div class="info-section bg-light rounded mt-3">
					<h5 class="title text-black p-2">What you will gain from this
						Masterclass</h5>
					<ul>
						<li>Learn what day-to-day work of a DevOps Engineer looks
							like</li>
						<li>Understand DevOps career paths and skills required</li>
						<li>Get tips on cracking DevOps interviews</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="container mt-4">
		<!-- Meet Anshuman Singh Section -->
		<div class="section-header">Meet Instructor Name</div>
		<div class="content-section">
			<ul>
				<li>Co-founder, PCS Global</li>
				<li>Worked with Mark Zuckerberg and led the team that built
					Facebook Messenger</li>
				<li>Was responsible for setting up Facebook’s office outside
					the US</li>
				<li>Ex-Tech Team Lead at Facebook</li>
				<li>Star coder who represented India in the ICPC world finals
					twice</li>
			</ul>
		</div>

		<!-- Certificates Section -->
		<p>
			<span class="certificate-text">Certificates:</span> All attendees get
			certificates from Scaler Academy! Please be careful while entering
			your details <br>while registering, since they will go on your
			certificates.
		</p>

		<!-- This Masterclass is for Section -->
		<div class="section-header">This Masterclass is for</div>
		<div class="audience-section">
			<div class="audience-item">
				<!-- <img src="https://cdn-icons-png.flaticon.com/512/1940/1940922.png" alt="SDE Upskill"> -->
				<p>
					<i class="fa-solid fa-book-open-reader"></i> SDEs looking to
					upskill
				</p>

			</div>
			<div class="audience-item">
				<!-- <img src="https://cdn-icons-png.flaticon.com/512/1940/1940936.png" alt="SDE Change"> -->
				<p>
					<i class="fa-solid fa-chalkboard-user"></i> SDEs wanting to change
					from Service to Product Companies
				</p>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer class="bg-danger text-white text-center py-3 mt-4">
		<p>
			Need Help? Talk to us at <a href="tel:08047939631" class="text-white">08047939631</a>
			or <a href="#" class="text-white">Request a Call</a>
		</p>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
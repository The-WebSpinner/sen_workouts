<title>TODOS</title>
<head>
	<script src ="./assets/js/jquerybs.min.js"></script>
    <script src ="./assets/js/jquery.min.js"></script>
    <script src ="./assets/js/todo.js"></script>
    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="stylesheet" href="./assets/css/style1.css">
</head>

<body>
	<div class = "mx-auto text-center mt-5">
		<h3 class="jumbotron">TODOS</h3>
		<div class="form-floating w-25 mx-auto text-center">
			<input type="text" class="textbox form-control box" id="textbox" placeholder="enter">
			<label for = "textbox">What needs to be done?</label>
		</div>
		<ol class="form-floating w-25 mx-auto text-center shad hide" id="display"></ol>
		<nav class="navbar navbar-expand-lg navbar-light bggg mx-auto text-center  w-25">
			<div class="container mx-auto text-center ">
				<div class="collapse navbar-collapse " id="navbarNav">
					<ul class="navbar-nav text-center mx-auto">
						<li class="nav-item">
							<a class="nav-link active" aria-current="page" id="allBtn"href="#all">All</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#active" id="activeBtn">Active</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" id="completedBtn" href="#completed">Completed</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" id="clearBtn" href="#">Clear completed</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		</div>
	</div>

	<div class=" mt-3 item">
		<span id="item" class="leftitem text-light">0</span><span class="leftitem text-light">-Items Left</span>
	</div>



</body>
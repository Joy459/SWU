<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import=" javax.swing.*" import="java.util.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>One Place Shop</title>


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
zoom:150%;
}
#menubar{
  display: flex;
    flex-wrap: nowrap;
    
}
#search{
 position:relative;
left: 200px;

top:1px;
width:800px;
min-width:10px;


}
#sbutn{
 
left:473px;
font-size:12px; 
height:40px;
width:58px;
 
}

.cart-size {
	color: white;
	background: #2E8B57;
	position: relative;
	right: -840px;
	top: -12px;
	width: 25px;
	height: 25px;
}

.cbutton {
position: relative;
	left: 33%;
	top: -60px;
	background: #04bd86;
}

#cart {
	position: relative;
	right: -975px;
	top: -131px;
}

#logout {
		position: relative;
	right:-430px;
  top:-48px;
}

#login {
	position: relative;
	right: -775px;
  top: -10px;
}

#signup {
	position: relative;
	right: -780px;
	top: -10px;
}
.position {
	position: absolute;
	top: 25%;
	left: 10%
}
#user-greater {
	position: relative;
	right: -750px;
	top: -10px;
	color: #00995c;
	font-weight: bold;
	font-size: 17px;
	font-family: Arial;
	top: -60px;
}

.hov:hover {
	border-style: outset;
}
</style>
 

<link rel="stylesheet" href="CSS/menu-bar.css">
<link rel="stylesheet" href="CSS/search-bar.css">
<link rel="stylesheet" href="CSS/slideshow.css">
<link rel="stylesheet" href="CSS/icons.css">
<link rel="stylesheet" href="CSS/login-popup.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>


<style>
 
#slideshow {
	margin: 80px auto;
	position: relative;
	width: 240px;
	height: 240px;
	padding: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
}

#slideshow>div {
	position: absolute;
	top: 10px;
	left: 10px;
	right: 10px;
	bottom: 100px;
}
</style>







<div>
<form action="search" class="searchbar" id="search">
	<input type="text" placeholder="Search Products" name="search-bar">
	 <button class="btn btn-outline-success" id="sbutn" type="submit">Search</button>
	 
</form>
</div>

<a href="home.jsp"> <img src="images/home1/logo.png" id="logo"
	class="hov" title=ShopWithUs width="100" height="60">

</a>



<div class="topnav" id="menubar" >
	<a href="home.jsp">Home</a> <a href="bestSellers.jsp">Best Sellers</a>
	<a href="customerService.jsp">Customer Service</a> <a href="books.jsp">Books</a>
	<a href="toys.jsp">Toys</a> <a href="games.jsp">Games</a> <a
		href="giftCards.jsp">Gift Cards</a> <a href="electronics.jsp">Electronics</a>
	<!-- only display sellyourproducts tab if user is logged in -->
	<%if (session.getAttribute("email") != null) {out.print("<a href=" + '"' + "sellYourProducts.jsp" + '"' + ">Sell Your Products</a>");}%>

</div>




</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.mySlides {
	display: none;
}
</style>


<body>



	<%
	String name = (String) session.getAttribute("firstName");
	String email = (String) session.getAttribute("email");

	String login = " <a  onclick=" + '"' + "openForm()" + '"' + " >" + " <img src=" + '"' + "images" + '/' + "home1" + '/'
			+ "login.png" + '"' + "id=" + '"' + "login" + '"' + "class=" +

			'"' + "hov" + '"' + "title=ShopWithUs width=" + '"' + "80" + '"' + "height=" + '"' + "30" + '"' + "> </a>";

	String signup = " <a  href=" + '"' + "signup.jsp" + '"' + " >" + " <img src=" + '"' + "images" + '/' + "home1" + '/'
			+ "signup.png" + '"' + "id=" + '"' + "signup" + '"' + "class=" +

			'"' + "hov" + '"' + "title=ShopWithUs width=" + '"' + "80" + '"' + "height=" + '"' + "30" + '"' + "> </a>";

	String userGreating = "<h1 id =" + '"' + "user-greater" + '"' + "class=" + "> Hi " + name + "<" + '/' + "h1>";

	String logout = " <div> <form action=" + '"' + "Logout" + '"' + "method =" + '"' + "post" + '"' + "id=" + '"' + "logout"
			+ '"' + "> <input type=" + '"' + "image" + '"' + "src=" + '"' + "images" + '/' + "home1" + '/' + "logout.png"
			+ '"' + "id=" + '"' + "logout" + '"' + "class=" + '"' + "hov" + '"' + "width=" + '"' + "80" + '"' + "height="
			+ '"' + "30" + '"' + "alt=" + '"' + "submit" + '"' + '/' + "> </a>" + "<" + '/' + "form><" + '/' + "div>";
	String cart = " <a  href=" + '"' + "cart.jsp" + '"' + " >" + " <img src=" + '"' + "images" + '/' + "home1" + '/'
			+ "cart.jpg" + '"' + "id=" + '"' + "cart" + '"' + "class=" +

			'"' + "hov" + '"' + "title=ShopWithUs width=" + '"' + "80" + '"' + "height=" + '"' + "30" + '"' + "> </a>";

	//if user is not logged in display login and signup icons 		
	if (email == null) {

		out.print(login + signup);

		String message = (String) session.getAttribute("loginmessage");

		//error message for failed login attempt 
		if (message != null) {

			JOptionPane.showMessageDialog(null, message, "Error", JOptionPane.ERROR_MESSAGE);

			session.setAttribute("loginmessage", null);
		}

	}

	else {

		//when user is logged in display greating, cart icon , cart items size counter and logout icon 
		ArrayList<ArrayList<String>> cartval = (ArrayList<ArrayList<String>>) session.getAttribute("cart");
		String cartSize = "<button" + " class=" + '"' + "cart-size" + '"' + "onclick=" + '"' + "location.href='cart.jsp'"
		+ '"' + " type=" + '"' + "button" + '"' + ">" + cartval.size() + "</button>";

		out.print(cartSize + userGreating + logout + cart);

	}
	%>



	<div class="position">
		<a href="bestSellers.jsp"> <img class="mySlides"
			src="images/home2/best-sellers.jpg" width="600" height="370">
		</a> <a href="books.jsp"> <img class="mySlides"
			src="images/home2/books.png" width="600" height="370"></a> <a
			href="customerService.jsp"><img class="mySlides"
			src="images/home2/cust-servi.png" width="600" height="370"></a> <a
			href="electronics.jsp"><img class="mySlides"
			src="images/home2/electronic.jpeg" width="600" height="370"></a> <a
			href="games.jsp"> <img class="mySlides"
			src="images/home2/games.jpg" width="600" height="370"></a> <a
			href="giftCards.jsp"> <img class="mySlides"
			src="images/home2/gift-cards.jpg" width="600" height="370"></a> <a
			href="sellYourProducts.jsp"> <img class="mySlides"
			src="images/home2/sell-your-product.png" width="600" height="370"></a>
		<a href="toys.jsp"> <img class="mySlides"
			src="images/home2/toys.jpg" width="600" height="370"></a>

		<button class="w3-button w3-black w3-display-left"
			onclick="plusDivs(-1)">&#10094;</button>
		<button class="w3-button w3-black w3-display-right"
			onclick="plusDivs(1)">&#10095;</button>
	</div>



<script>

//slideshow for the home page
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}



//popup login 
function openForm() {
  document.getElementById("myForm1").style.display = "block";
}
//close login popup 
function closeForm() {
  document.getElementById("myForm1").style.display = "none";
}

 
</script>




	<div class="form-popup" id="myForm1">
		<form action="LoginAuthenticator" method="post" class="form-container">
			<h1>Login</h1>

			<label for="email"><b>Email</b></label> <input type="text"
				placeholder="Enter Email" name="email" required> <label
				for="psw"><b>Password</b></label> <input type="password"
				placeholder="Enter Password" name="password" required>

			<button type="submit" class="btn">Login</button>
			<button type="button" class="btn cancel" onclick="closeForm()">Close</button>
		</form>
	</div>
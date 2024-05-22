<head>
 <link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
.mySlides {display:none;}

input[type="text"], input[type="mail"]
{
    border: none;
    background:silver;
    height: 50px;
    font-size: 16px;
	margin-left:2%;
	padding:15px;	
}
select[name="bloodgroup"] {
    border: none;
    background: silver;
    height: 50px;
    font-size: 16px;
    margin-left: 2%;
    padding: 15px;
    /* Add any additional styling here */
}

</style>
</head>
<body>

<div class="header">
  <a href="#default" class="logo"><img class="logo" src="Logo1.png"></a>
  <div class="header-right">
    <a class="active" href="index.jsp">Home</a>
    <a href="adminLogin.jsp">Admin Login</a>
    <a href ="faq.html">FAQ</a>
  </div>
</div>

<div style="max-width:100%">
  <img class="mySlides"  src="slide1.jpg" >
  <img class="mySlides"  src="slide2.png" >
</div>
<script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 2000); // Change image every 2 seconds
}
</script>


<body>
  <br>
  <%
  String msg = request.getParameter("msg");
  if("valid".equals(msg)){
  %>
  <center><font color = "green" size = "5">Form Submitted Successfully. You will Get Notified Within 24 Hours..</font></center>
  <%}
  %>
  <%
  if("invalid".equals(msg)){
  %>
  <center><font color = "red" size = "5">Invalid Data Try Again..</font></center>
  <%}
  %>
 <center><h1>Enter Your Details for Request for Blood</h1></center>
 <form action="indexFormAction.jsp" method="post" onsubmit="return validateForm()">
 <center>
 <input type = "text" name = "name" placeholder ="Enter Name" required>
 <input type = "text" name = "mobilenumber" placeholder = "Enter Your Mobile Number" required>
 <input type = "mail" name = "email" placeholder ="Enter Email Address" required>
 <select name="bloodgroup" required>
  <option value="" disabled selected id="option">Select Blood Group</option>
  <option value="A+">A+</option>
  <option value="A-">A-</option>
  <option value="B+">B+</option>
  <option value="B-">B-</option>
  <option value="AB+">AB+</option>
  <option value="AB-">AB-</option>
  <option value="O+">O+</option>
  <option value="O-">O-</option>
</select>

 <button class = "button1"><span>Submit</span></button>
 </center>
 </form>
  <br>
  <br>
  </div>
</div>

<div class="row1"> 
<div class="container"> 
<br>         
<br>
    </tbody>
  </table>
</div>
</div>
<h3><center>All Right Reserved @ BPUT :: 2024  </center></h3>
<a><script>
// Function to validate name field
function validateName() {
    var nameInput = document.getElementsByName("name")[0].value;
    if (!/^[a-zA-Z ]{1,30}$/.test(nameInput)) {
        alert("Name should contain maximum 30 characters and only alphabets.");
        return false;
    }
    return true;
}

// Function to validate mobile number field
function validateMobileNumber() {
    var mobileNumberInput = document.getElementsByName("mobilenumber")[0].value;
    if (!/^\d{10}$/.test(mobileNumberInput)) {
        alert("Mobile number must be 10 digits long and contain only numbers.");
        return false;
    }
    return true;
}

// Function to validate email field
function validateEmail() {
    var emailInput = document.getElementsByName("email")[0].value;
    // Regular expression to match only valid email format: alphabets, numbers, '@', and '.'
    if (!/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(emailInput)) {
        alert("Please enter a valid email address with only the '@' symbol allowed.");
        return false;
    }
    return true;
}

// Function to perform overall form validation
function validateForm() {
    return validateName() && validateMobileNumber() && validateEmail();
}
</script></a>
</body>
</html>


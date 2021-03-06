<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>book appointment</title>
<link rel="stylesheet" type="text/css" href="css/bookappointstyle.css">

<script type="text/javascript">
function validateForm() {
	  var x = document.forms["myForm"]["name"].value;
	  var y = document.forms["myForm"]["age"].value;
	  var z = document.forms["myForm"]["mob"].value;
	  
	  if (x == "") {
	    alert("Name must be filled out");
	    return false;
	  }
	  
	  else if (y == "") {
		    alert("Age must be filled out");
		    return false;
		  }
	  
	  else if (z == "") {
		    alert("Mobile number must be filled out");
		    return false;
		  }
	  alert("Appointment Registered!");
	}
	var citiesByState = {
			Skin: ["Surbhi Patel"],
			Bone: ["Prithvi Singh","Raj Prohit"],
			Heart: ["Shubham Jain","Shashwat Jain"],
			Dental:["Samriddhi Arya"],
			Eye:["Silky Jain"],
			DietDeficiency:["Siddharth Jain"],
			Physio:["Shaurya Verma"],
			GeneralFlu:["Neetu Sharma","Astha Jain","Hemant Shrivas"]
	}
	function makeSubmenu(value) {
			if(value.length==0) document.getElementById("citySelect").innerHTML = "<option></option>";
			else {
			var citiesOptions = "";
			for(cityId in citiesByState[value]) {
			citiesOptions+="<option>"+citiesByState[value][cityId]+"</option>";
			}
			document.getElementById("citySelect").innerHTML = citiesOptions;
			}
	}
	function displaySelected() { var country = document.getElementById("countrySelect").value;
			var city = document.getElementById("citySelect").value;
			alert(country+"\n"+city);
	}
	function resetSelection() {
			document.getElementById("countrySelect").selectedIndex = 0;
			document.getElementById("citySelect").selectedIndex = 0;
	}
</script>
</head>
<% Date d = new Date() ;%>
<body>
<form action="bookappointaction.jsp" method="post">

<div class="topnav" style="background: lightgrey">
  <div class ="logo">
      <a href="home.html"><img src ="access-512.png"></a>
  </div>
  <a href="home.html">Home</a>
  <a class="active" href="bookappoint.jsp">Book appointment</a>
  <a href="booktest.jsp">Book tests & checkups</a>
</div>

<div class="dropdown">
	  <button class="dropbtn">More</button>
	  <div class="dropdown-content">
	  	<a href="docreg.html">Are you a doctor</a>
	  	<a href="pathoreg.html">Add your pathology</a>
	    <a href="#">Read articles</a>
	    <a href="contact.html">Contact us</a>
	    <a href="about.html">About us</a>
  	  </div>
   </div> 

  <div class="col1-md-6">
    <h1>Book an appointment</h1>
    <p>Please fill up the details below.</p>
    <hr>
    
    <label for="name"><b>Name</b></label>
    <input type="text" placeholder="Enter Name" name="name" required>
    
    <label for="email"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" required>

    <label for="mob"><b>Contact No.</b></label>
    <input type="text" placeholder="Enter contact no." name="mob" maxlength="10" minlength="10" required>
    
    <label for="dob"><b>Date of birth: </b></label><br><br>
    <input type="date" name="dob" required><br><br>
    
    <label for="sex"><b>Sex:</b></label>
	<select name="sex">
	<option value="male">Male</option>
	<option value="female">Female</option>
	<option value="others">Others</option>
	</select>
    
    <label for="dis"><b>Disease:</b></label>
	<select id="countrySelect" size="1" onchange="makeSubmenu(this.value)" name="dis">
			<option value="" disabled selected>select Disease</option>
			<option>Skin</option>
			<option>Bone</option>
			<option>Heart</option>
			<option>Dental</option>
			<option>Eye</option>
			<option>DietDeficiency</option>
			<option>Physio</option>
			<option>GeneralFlu</option>
	</select>
	<label for="Doc"><b>Doctor:</b></label>
	<select id="citySelect" size="1"  name="doc">
			<option value="" disabled selected>choose Doctor</option>
			<option></option>
	</select>
			
				
	
	<label for="other"><b>Other minor problems if any</b></label>
    <input type="text" placeholder="Mention other problems if any" name="other">
    
    <label for="appdate"><b>Appointment Date: </b></label>(please select dates carefully)<br><br>
    <input type="date" name="appdate" required><br><br>
    
    <label for="ts"><b>Preffered Time-slot</b></label> (time slots may change)
	<select name = "ts" style="color:black">
		<option value = "11am to 12pm" id="timeslot" selected>11am to 12pm</option>
        <option value = "12pm to 1pm" id="timeslot" >12pm to 1pm</option>
    	<option value = "2pm to 3pm" id="timeslot">2pm to 3pm</option>
      	<option value = "3pm to 4pm" id="timeslot">3pm to 4pm</option>
        <option value = "4pm to 5pm" id="timeslot">4pm to 5pm</option>
       	<option value = "6pm to 7pm" id="timeslot">6pm to 7pm</option>
      	<option value = "7pm to 8pm" id="timeslot">7pm to 8pm</option>
	</select>
	
	<label for="add"><b>Address</b></label>
    <input type="text" placeholder="Enter address" maxlength="12" name="add" required>

    <label for="state"><b>State</b></label>
    <input type="text" placeholder="Enter state" name="state" required>
    
    <label for="city"><b>City</b></label>
    <input type="text" placeholder="Enter city" name="city" required>
    
    <input type="hidden" name="cdate"  value="<%= d%>" />
    
    <hr>

    <p>By registering you agree to our <a href="#">Terms & Privacy</a>.</p>
    <button type="submit" class="registerbtn">Book Now</button>
    
    </div>

</form>
</body>
</html>
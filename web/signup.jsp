<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
      <!--creating a form to take user input and sending it to signupAction.jsp page-->
      <form action="signupAction.jsp" method="post">
          <input type="text" name="name" placeholder="Enter name" required>
          <input type="email" name="email" placeholder="Enter email" required>
          <input type="number" name="mobileNumber" placeholder="Enter mobile number" required>
          <select name="securityQuestion" required>
              <option value="What was your first car?">What was your first car?</option>
              <option value="What is the name of your first pet?">What is the name of your first pet?</option>
              <option value="What elementary school did you attend?">What elementary school did you attend?</option>
              <option value="What is the name of your birth town?">What is the name of your birth town?</option>    
          </select>
          <input type="text" name="answer" placeholder="Enter answer" required>
          <input type="password" name="password" placeholder="Enter password" required>
          <input type="submit" value="Signup">
      </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>

<%
   //get the message from loginAction.jsp
   String msg = request.getParameter("msg");
   //if msg is "valid" then print that successfully registered 
   if("valid".equals(msg))
   {
%>           
    <h1>Successfully Registered</h1>
<%
    }
%>
<%
    //if msg is "invalid" then print that something went wrong
    if("invalid".equals(msg))
   {
%>    
    <h1>Some thing Went Wrong! Try Again !</h1>
<%
    }
%>
    <h2>NiKi's Groceries </h2>
    <p>The NiKi's Groceries is now online. The web page that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>

</body>
</html>
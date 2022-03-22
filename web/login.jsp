<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Login</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
      <!--creating a form to take user input and sending it to loginAction.jsp page-->
      <form action="loginAction.jsp" method="post">
          <input type="email" name="email" placeholder="Enter Email" required>
          <input type="password" name="password" placeholder="Enter Password" required>
          <input type="submit" value="Login">
      </form>
      <h2><a href="signup.jsp">SignUp</a></h2>
       <h2><a href="forgotPassword.jsp">Forgot Password?</a></h2>
  </div>
  <div class='whysignLogin'>
  <%
      //get the message from loginAction.jsp
      String msg=request.getParameter("msg");
      //if msg is "notexist" then print that the username and password are incorrect
      if("notexist".equals(msg))
      {
  %>
  <h1>Incorrect Username or Password</h1>
  <%
      }
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
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>ForgotPassword</title>
<style>
    body  {
  background-color: #2cb88e;
}
</style>
</head>
<body>
<div id='container'>
  <div class='signup'>
      <form action="forgotPasswordAction.jsp" method="post">
          <input type="email" name="email" placeholder="Enter email" required>
          <input type="number" name="mobileNumber" placeholder="Enter mobile number" required>
          <select name="securityQuestion">
              <option value="What was your first car?">What was your first car?</option>
              <option value="What is the name of your first pet?">What is the name of your first pet?</option>
              <option value="What elementary school did you attend?">What elementary school did you attend?</option>
              <option value="What is the name of your birth town?">What is the name of your birth town?</option> 
          </select>
          <input type="text" name="answer" placeholder="Enter answer" required>
          <input type="password" name="newPassword" placeholder="Enter new password" required>
          <input type="submit" value="Save">
      </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whyforgotPassword'>
   <%
       String msg=request.getParameter("msg");
       if("done".equals(msg))
       {
    %>
        <h1>Password Changed Successfully!</h1>
    <%
        }
        
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
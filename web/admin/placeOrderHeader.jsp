<%@page errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
    <%
        String email=session.getAttribute("email").toString();
    %>
            <center><h2>NiKi's Groceries</h2></center>
            <a href="adminHome.jsp">Admin home <i class='fab fa-elementor'></i></a>
            <a href="placeOrder.jsp">All Products<i class="fa fa-institution"></i></a>
            <a href="myCart.jsp">My Cart<i class='fas fa-cart-arrow-down'></i></a>
          </div>
           <br>
           <!--table-->

<%@page import= "project.ConnectionProvider"%>
<%@page import= "java.sql.*"%>
<%@include file= "adminHeader.jsp" %>
<%@include file= "../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
</head>
<body>
<%
    String msg=request.getParameter("msg");
    if("done".equals(msg))
    {
%>
<h3 class="alert">Product Added Successfully!</h3>
<%
    }

    if("wrong".equals(msg))
    {
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%
    }
    //setting the id, it is by default 1; else finds the highest value and increments value by 1
    int id=1;
    try
    {
        Connection con = ConnectionProvider.getCon();
        Statement st= con.createStatement();
        ResultSet rs=st.executeQuery("Select max(id) from product");
        while(rs.next())
        {
            id=rs.getInt(1);
            id=id+1;
        }
    }
    catch(Exception e)
    {
        System.out.println("Exception: "+e);
    }
%>
<form action="addNewProductAction.jsp" method="post">

<h3 style="color: yellow;">Product ID: <%out.println(id);%> </h3>
<input type="hidden" name="id" value="<%out.println(id);%>">

<div class="left-div">
 <h3>Enter Name</h3>
 <input class="input-style" type="text" name="name" placeholder="Enter name" required>
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
<select class="input-style" name="category">
    <option value="Biscuits & Cookies">Biscuits & Cookies</option>
    <option value="Breakfast Cereals">Breakfast Cereals</option>
    <option value="Chocolates & Candies">Chocolates & Candies</option>
    <option value="Frozen Veggies & Snacks">Frozen Veggies & Snacks</option>
    <option value="Noodle, Pasta, Vermicelli">Noodle, Pasta, Vermicelli</option>
    <option value="Pickles & Chutney">Pickles & Chutney</option>
    <option value="Ready To Cook & Eat">Ready To Cook & Eat</option>
    <option value="Snacks & Namkeen">Snacks & Namkeen</option>
    <option value="Spreads, Sauces, Ketchup">Spreads, Sauces, Ketchup</option>
</select>
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
<input class="input-style" type="number" step="0.01" name="price" placeholder="Enter price" required>
<hr>
</div>

<div class="right-div">
<h3>Available</h3>
<select class="input-style" name="active">
    <option value="Yes">Yes</option>
    <option value="No">No</option>
</select>
<hr>
</div>
<button class="button"> Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>

<br><br><br>
</body>
</html>
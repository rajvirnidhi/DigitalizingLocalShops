<%@page import= "project.ConnectionProvider"%>
<%@page import= "java.sql.*"%>
<%@include file= "../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/addressPaymentForOrder-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>
<style>
    body  {
  background-color: #2cb88e;
}
</style>
<script type="text/javascript"> 
    if(window.history.forward() != null)
    { window.history.forward(); } 
</script>
<%
response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Expires","0");
response.setDateHeader("Expires",-1);
%>
</head>
<body>
<br>
<table>
<thead>

<%
    String email= session.getAttribute("email").toString();
    double total=0;
    int sno=0;
    
    try
    {
        Connection con = ConnectionProvider.getCon();
        Statement st= con.createStatement();
        ResultSet rs1=st.executeQuery("select sum(total) from cart where email='"+email+"' and status is NULL");
        while(rs1.next())
        {
            total=rs1.getDouble(1);
            total=Math.round(total*Math.pow(10,2))/Math.pow(10,2);
        }
%>
          <tr>
          <th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i> <%out.println(total);%> </th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
          </tr>
        </thead>
        <tbody>
        <%
        ResultSet rs= st.executeQuery("select * from product inner join cart on product.id=cart.product_id and cart.email='"+email+"' and cart.status is NULL");
        while(rs.next())
        {
        %>
          <tr>
          <%sno=sno+1;%>
           <td><%out.println(sno);%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(4)%></td>
            <td><%=rs.getString(8)%> </td>
            <td><i class="fa fa-inr"></i><%=rs.getString(10)%> </td>
            </tr>
       <%
            }
        }
        catch(Exception e)
        {
            System.out.println("Exception: "+e);
        }
       %>  
        </tbody>
      </table>
      
<hr style="width: 100%">
<form action="addressPaymentForOrderAction.jsp" method="post">
 
<div class="right-div">
<h3>Enter name</h3>
<input class="input-style" type="text" name="name" value="Buyer"  placeholder="Enter name" required>
</div>

<div class="left-div">
<h3>Mobile Number</h3>
<input class="input-style" type="number" name="mobileNumber" value="0123456789" placeholder="Enter mobile number" required>
</div>
    <br><br>
    <br><br>
<div class="right-div">
    <button class="button" type="submit"> Proceed to generate bill and save <i class='far fa-arrow-alt-circle-right'></i></button>
</div>
</form>

      <br>
      <br>
      <br>

</body>
</html>
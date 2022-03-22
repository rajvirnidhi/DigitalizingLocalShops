<%@page import= "project.ConnectionProvider"%>
<%@page import= "java.sql.*"%>
<%@include file= "footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/bill.css">
<title>Bill</title>
</head>
<body>
<%
    String email= session.getAttribute("email").toString();
    double total=0;
    int sno=0;
    
    try
    {
        Connection con = ConnectionProvider.getCon();
        Statement st= con.createStatement();
        ResultSet rs1=st.executeQuery("select sum(total) from cart where email='"+email+"' and status='bill'");
        while(rs1.next())
        {
            total=rs1.getDouble(1);
            total=Math.round(total*Math.pow(10,2))/Math.pow(10,2);
        }
        
        ResultSet rs=st.executeQuery("select * from users inner join cart where cart.email='"+email+"' and cart.status='bill'");
        while(rs.next())
        {
%>
<h3>Niki's Groceries Bill</h3>
<hr>
<div class="left-div"><h3>Name: <%=rs.getString(1)%> </h3></div>
<div class="right-div-right"><h3>Email: <%out.println(email);%> </h3></div>
<div class="right-div"><h3>Mobile Number: <%=rs.getString(20)%> </h3></div>  

<div class="left-div"><h3>Order Date: <%=rs.getString(21)%> </h3></div>
<div class="right-div-right"><h3>Payment Method: <%=rs.getString(23)%> </h3></div>
<div class="right-div"><h3>Expected Delivery: <%=rs.getString(22)%> </h3></div> 

<div class="left-div"><h3>Transaction Id: <%=rs.getString(24)%> </h3></div>
<div class="right-div-right"><h3>City: <%=rs.getString(17)%> </h3></div> 
<div class="right-div"><h3>Address: <%=rs.getString(16)%> </h3></div> 

<div class="left-div"><h3>State: <%=rs.getString(18)%> </h3></div>
<div class="right-div-right"><h3>Country: <%=rs.getString(19)%> </h3></div>  

<hr>
<%
    break;
    }
%>

	
	<br>
	
<table id="customers">
<h3>Product Details</h3>
  <tr>
    <th>S.No</th>
    <th>Product Name</th>
    <th>category</th>
    <th>Price</th>
    <th>Quantity</th>
     <th>Sub Total</th>
  </tr>
  <%
        ResultSet rs2= st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.email='"+email+"' and cart.status='bill'");
        while(rs2.next())
        {
            sno=sno+1;
    %>
  <tr>
    <td><%out.println(sno);%></td>
    <td><%=rs2.getString(17)%></td>
    <td><%=rs2.getString(18)%></td>
    <td><%=rs2.getString(19)%></td>
    <td><%=rs2.getString(3)%></td>
     <td><%=rs2.getString(5)%></td>
  </tr>
  <tr>
<%}%>
</table>
<h3>Total: <%out.println(total);%> </h3>
<a href="continueShopping.jsp"><button class="button left-button">Continue Shopping</button></a>
<a onclick="window.print();"><button class="button right-button">Print</button></a>
<br><br><br><br>
<%
    }
    catch(Exception e)
    {
        System.out.println("Exception: "+e);
    }
%>
</body>
</html>
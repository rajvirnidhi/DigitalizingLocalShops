<%@page import= "project.ConnectionProvider"%>
<%@page import= "java.sql.*"%>
<%@include file= "../footer.jsp" %>
<%@page import= "java.time.LocalDate"%>

<html>
<head>
<link rel="stylesheet" href="../css/bill.css">
<title>Bill</title>
</head>
<body>
<%
    LocalDate date = LocalDate.now();
    String email= session.getAttribute("email").toString();
    //String name=request.getParameter("name");
    //String mobileNumber=request.getParameter("mobileNumber");
    double total=0;
    int sno=0;
    String status="Paid";
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
        
        /*ResultSet rs=st.executeQuery("select * from users inner join cart where cart.email='"+email+"' and users.email='"+email+"' and cart.status='bill'");
        while(rs.next())
        {*/
%>
<h3>Niki's Groceries Bill</h3>
<hr>
<div class="left-div"><h3>Order Date: <%out.println(date);%> </h3></div>
<hr>
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
<%}
        
%>
</table>
<h3>Total: <%out.println(total);%> </h3>
<a href="placeOrder.jsp"><button class="button left-button">Continue Shopping</button></a>
<a onclick="window.print();"><button class="button right-button">Print</button></a>
<br><br><br><br>
<%
       PreparedStatement ps1= con.prepareStatement("update cart set status='paid' where email='admin@gmail.com'");
        ps1.executeUpdate();
    }
    catch(Exception e)
    {
        System.out.println("Exception: "+e);
    }
%>
</body>
</html>
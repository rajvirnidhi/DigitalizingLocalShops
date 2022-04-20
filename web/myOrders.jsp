<%@page import= "project.ConnectionProvider"%>
<%@page import= "java.sql.*"%>
<%@include file= "header.jsp" %>
<%@include file= "footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
body  {
  background-color: #2cb88e;
}
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Orders <i class='fab fa-elementor'></i></div>
<%
    String msg=request.getParameter("msg");
    if("added".equals(msg))
    {
%>
<h3 class="alert">Product added successfully!</h3>
<%
    }

    if("exist".equals(msg))
    {
%>
<h3 class="alert">Product already exist in you cart! Quantity  increased!</h3>
<%
    }

    if("invalid".equals(msg))
    {
%>
<h3 class="alert">Something went wrong! Try again!</h3>
<%
    }
%>
<table>
        <thead>
          <tr>
            <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">category</th>
            <th scope="col"><i class="fa fa-inr"></i>  Price</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th scope="col">Order Date</th>
             <th scope="col">Expected Delivery Date</th>
             <th scope="col">Payment Method</th>
              <th scope="col">Status</th>
              <th scope="col">Place this order again</th>
              
          </tr>
        </thead>
        <tbody>
<%
    int sno=0;
    try
    {
        Connection con = ConnectionProvider.getCon();
        Statement st= con.createStatement();
        ResultSet rs=st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.email='"+email+"' and cart.orderDate is not NULL");
        while(rs.next())
        {
            sno+=1;
%>

          <tr>
            <td><%out.println(sno);%></td>
            <td><%=rs.getString(17)%></td>
            <td><%=rs.getString(18)%></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(19)%></td>
            <td><%=rs.getString(3)%></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(5)%></td>
             <td><%=rs.getString(11)%></td>
              <td><%=rs.getString(12)%></td>
               <td><%=rs.getString(13)%></td>
               <td><%=rs.getString(15)%></td>
               <td><a href="replaceOrderAction.jsp?id=<%=rs.getString(2)%> & qty=<%=rs.getString(3)%>">Place again<i class='fas fa-cart-plus'></i></a></td>
            </tr>
<%
      }
    }
    catch(Exception e)
    {
        
    }
%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>
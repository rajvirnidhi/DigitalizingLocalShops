<%@page import= "project.ConnectionProvider"%>
<%@page import= "java.sql.*"%>
<%@include file= "adminHeader.jsp" %>
<%@include file= "../footer.jsp" %>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Report</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Report <i class="fa fa-address-book"></i></div>
<h3 class="alert">Top 5 selling product</h3>
<table id="mostSoldItems">
          <tr>
            <th>Product</th>
            <th>sold quantity</th>
          </tr>
        
<%
    try
    {
        Connection con = ConnectionProvider.getCon();
        Statement st= con.createStatement();
        ResultSet rs=st.executeQuery("select product.name, sum(cart.quantity) from product, cart where product.id=cart.product_id group by product.name order by sum(cart.quantity) desc limit 5");
        while(rs.next())
        {
%>      
          <tr>
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(2)%></td>
          </tr>
 <%  
        }
    }
    catch(Exception e)
    {
        System.out.println("Exception: "+e);
    }
%> 
</table>
<br><br><br><br>
<h3 class="alert">Today's sales</h3>
<table id="mostSoldItems">
          <tr>
            <th>Product</th>
            <th>Quantity</th>
            <th><i class="fa fa-inr"></i> Amount</th>
          </tr>
        
<%
    try
    {
        Connection con = ConnectionProvider.getCon();
        Statement st= con.createStatement();
        ResultSet rs=st.executeQuery("select product.name, cart.quantity, cart.total from product, cart where product.id=cart.product_id and cart.orderDate=CURRENT_DATE()");
        while(rs.next())
        {
%>      
          <tr>
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
          </tr>
 <%  
        }
    }
    catch(Exception e)
    {
        System.out.println("Exception: "+e);
    }
%> 
</table>
<%
    try
    {
        Connection con = ConnectionProvider.getCon();
        Statement st= con.createStatement();
        ResultSet rs1=st.executeQuery("select sum(cart.total) from cart where cart.orderDate=CURRENT_DATE()");
        while(rs1.next())
        {
%>      
        <h2 style="color:red;background-color:yellow; text-align:center;">Total sales of the day: <i class="fa fa-inr"></i> <%=rs1.getString(1)%>           </h2>
 <%  
        }
    }
    catch(Exception e)
    {
        System.out.println("Exception: "+e);
    }
%> 
<br>

<br><br><br><br>
</body>
</html>
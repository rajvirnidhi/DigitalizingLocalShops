<%@page import= "project.ConnectionProvider"%>
<%@page import= "java.sql.*"%>
<%
    String email= session.getAttribute("email").toString();
    String address=request.getParameter("address");
    String city=request.getParameter("city");
    String state=request.getParameter("state");
    String country =request.getParameter("country");
    
    try
    {
        Connection con = ConnectionProvider.getCon();
        PreparedStatement ps= con.prepareStatement("update users set address=?,city=?,state=?,country=? where email=?");
        ps.setString(1,address);
        ps.setString(2,city);
        ps.setString(3,state);
        ps.setString(4,country);
        ps.setString(5,email);
        ps.executeUpdate();
    
        PreparedStatement ps1= con.prepareStatement("update cart set address=?, city=?, state=?, country=? where email=? and address is NULL");
        ps1.setString(1,address);
        ps1.setString(2,city);
        ps1.setString(3,state);
        ps1.setString(4,country);
        ps.setString(5,email);
        ps.executeUpdate();
        
        if(city.equalsIgnoreCase("rajkot") && state.equalsIgnoreCase("gujarat"))
        {
           response.sendRedirect("addressPaymentForOrder.jsp?msg=valid");
        }
       else
        {
           response.sendRedirect("addressPaymentForOrder.jsp?msg=invalid");
        }
    }
    catch(Exception e)
    {
        System.out.println("Exception: "+e);
    }    
    
    
%>

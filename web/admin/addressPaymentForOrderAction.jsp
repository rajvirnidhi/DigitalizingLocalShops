<%@page import= "project.ConnectionProvider"%>
<%@page import= "java.sql.*"%>
<%
    String email= session.getAttribute("email").toString();
    String name=request.getParameter("name");
    String mobileNumber=request.getParameter("mobileNumber");
    String status="bill";
    
    try
    {
        Connection con = ConnectionProvider.getCon();
        
        PreparedStatement ps1= con.prepareStatement("update cart set mobileNumber=?, status=? where email=? and address is NULL and status is NULL");
        ps1.setString(1,mobileNumber);
        ps1.setString(2,status);
        ps1.setString(3,email);
        ps1.executeUpdate();
        response.sendRedirect("bill.jsp");
    }
    catch(Exception e)
    {
        System.out.println("Exception: "+e);
    }
%>

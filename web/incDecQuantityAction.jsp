<%@page import= "project.ConnectionProvider"%>
<%@page import= "java.sql.*"%>
<%
    String email=session.getAttribute("email").toString();
    String id=request.getParameter("id");
    String incdec=request.getParameter("quantity");
    double price=0;
    double total=0;
    int quantity=0;
    double final_total=0;
    
    try
    {
        Connection con = ConnectionProvider.getCon();
        Statement st= con.createStatement();
        ResultSet rs= st.executeQuery("Select * from cart where email='"+email+"' and product_id='"+id+"' and address is NULL");
        while(rs.next())
        {
            price=rs.getDouble(4);
            total=rs.getDouble(5);
            quantity=rs.getInt(3);
        }
        if(quantity==1 && incdec.equals("dec"))
        {
            response.sendRedirect("myCart.jsp?msg=notPossible");
        }
        else if(quantity!=1 && incdec.equals("dec"))
        {
            total= Math.round(total*Math.pow(10,2))/Math.pow(10,2);
            total-=price;
            quantity-=1;
            total= Math.round(total*Math.pow(10,2))/Math.pow(10,2);
            st.executeUpdate("update cart set total='"+total+"', quantity='"+quantity+"' where email='"+email+"' and product_id='"+id+"' and address is NULL");
            response.sendRedirect("myCart.jsp?msg=dec");
        }
        else
        {
            total= Math.round(total*Math.pow(10,2))/Math.pow(10,2);
            total+=price;
            quantity+=1;
            total= Math.round(total*Math.pow(10,2))/Math.pow(10,2);
            st.executeUpdate("update cart set total='"+total+"', quantity='"+quantity+"' where email='"+email+"' and product_id='"+id+"' and address is NULL");
            response.sendRedirect("myCart.jsp?msg=inc");
        }
    }
    catch(Exception e)
    {
        System.out.println("Exception: "+e);
    }
%>
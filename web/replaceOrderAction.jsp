<%@page import= "project.ConnectionProvider"%>
<%@page import= "java.sql.*"%>
<%
    String email= session.getAttribute("email").toString();
    String product_id=request.getParameter("id");
    /*
    String qty="1";
    qty = request.getParameter("qty");
    int quantity = Integer.parseInt(qty);*/
    int quantity=1;
    double product_price=0;
    double product_total=0;
    double cart_total=0;
    int z=0;
    
    try
    {
        Connection con = ConnectionProvider.getCon();
        Statement st= con.createStatement();
        //get the price of product
        ResultSet rs=st.executeQuery("Select * from product where id='"+product_id+"'");
        while(rs.next())
        {
            product_price=rs.getDouble(4);
            product_total=product_price;
        }
        
        //check if user has already added the product to cart, if the product is already there in the cart then increase the quantity of product and product total
        ResultSet rs1=st.executeQuery("Select * from cart where product_id="+product_id+" and email='"+email+"' and address is NULL");
        while(rs1.next())
        {
            cart_total=rs1.getDouble(5);
            cart_total+=product_total;
            quantity=rs1.getInt(3);
            quantity+=1;
            z=1;
        }
        
        //if the product is already in the cart then the while loop will be executed thus setting z=1
        if(z==1)
        {
            product_total= Math.round(product_total*Math.pow(10,2))/Math.pow(10,2);
            cart_total= Math.round(cart_total*Math.pow(10,2))/Math.pow(10,2);
            st.executeUpdate("update cart set total='"+cart_total+"', quantity='"+quantity+"' where product_id='"+product_id+"' and email='"+email+"' and address is NULL");
            response.sendRedirect("myOrders.jsp?msg=exist");
        }
        
        // if the product is not there in the cart then z=0, and we need to insert the data into the table
        if(z==0)
        {
            PreparedStatement ps=con.prepareStatement("insert into cart(email,product_id,price,total,quantity) values(?,?,?,?,?)");
            ps.setString(1, email);
            ps.setString(2, product_id);
            ps.setDouble(3, product_price);
            product_total= Math.round(product_total*Math.pow(10,2))/Math.pow(10,2);
            ps.setDouble(4, product_total);
            ps.setInt(5, quantity);
            ps.executeUpdate();
            response.sendRedirect("myOrders.jsp?msg=added");
        }
    }
    catch(Exception e)
    {
        System.out.println("Exception: "+e);
        response.sendRedirect("myOrders.jsp?msg=invalid");
    }
%>
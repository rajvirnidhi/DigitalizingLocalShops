<%@page import= "project.ConnectionProvider"%>
<%@page import= "java.sql.*"%>
<%
    // get user entered data
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    //check if the user is admin then allow admin to access the admin home page
    if("admin@gmail.com".equals(email) && "admin".equals(password))
    {
        //set the session attribute and allow the admin to enter the admin home page
        session.setAttribute("email",email);
        response.sendRedirect("admin/adminHome.jsp");
    }
    //if the user is not admin then connect to users database
    else
    {
        int z=0;
        try
        {
            //get database connection
            Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            //get the result set where the username and the password entered by the user is in variables email and password
            ResultSet rs=st.executeQuery("select * from users where email='"+email+"' and password = '"+password+"'");
            while(rs.next())
            {
                //set z=1 when we get matching row
                z=1;
                //set the session attribute and allow the user to enter the home page
                session.setAttribute("email",email);
                response.sendRedirect("home.jsp");
            }
            //If the username or password does not match then z will be 0 so, go back to the login page
            if(z==0)
                response.sendRedirect("login.jsp?msg=notexist");
        }
        catch(Exception e)
        {
            System.out.println("Exception: "+e);
            response.sendRedirect("login.jsp?msg=invalid");
        }
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Credentials.Connect"%>
<!DOCTYPE html>
<%
    Connection conn = Connect.getConnection();
    PreparedStatement psmt = null;
    ResultSet rs = null;
    psmt = conn.prepareStatement("SELECT * FROM product");
    rs = psmt.executeQuery();
    Connect cnt = new Connect();
    if(request.getParameter("did") != null){
        cnt.setdata("DELETE from product where productID= " +request.getParameter("did") );
    }

%>
<html>
    <head>
        

    </head>

    <body>
       
               
                
                    <table >
                        <tr >
                            <th> Title</th>
                            <th >Description</th>
                            <th>Email</th>
                            <th>Price</th>          
                            <th>Phone</th>
                            <th>Location</th>
                        </tr>
                        <tr>
                            <% 
								int count = 1;
                                while (rs.next()) {
                            %>
                        <tr>

                            <td><%=rs.getString("title")%></td>
                            <td><%=rs.getString("description")%></td>
                            <td><%=rs.getString("email")%></td>
                            <td><%=rs.getString("price")%></td>
                            <td><%=rs.getString("location")%></td> 

                            <td><b><span lang="en-us"><a href="?did=<%=rs.getString("productID")%>">Delete</a></span></b></td>
                        </tr>
                        <%
                                count++;   /// increment of counter
                            } /// End of while loop
%>
                        </tr>

                    </table>
               



    </body>
</html>

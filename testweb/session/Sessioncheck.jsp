<%@ page  contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
                "http://www.w3.org/TR/html4/loose.dtd">
             <%
             String sessionVal = null;
             int thisServerPort = request.getLocalPort();
             sessionVal = (String) session.getAttribute("testVal");
             
             System.out.println("\nJSP on server " + thisServerPort + 
               " has retrieved value " + sessionVal + " from current Session");
             %>


             <%
             vo.UserVO user = (vo.UserVO) session.getAttribute("user");
             
             System.out.println(" userID         ["+user.userID+"]"); 
             System.out.println(" userName       ["+user.userName+"]"); 
             System.out.println(" userloginTime  ["+user.loginTime+"]"); 
             
             %>
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Oracle Coherence*Web Simple Test 1 - Session Data Retriever</title>
  </head>
  <body>
<p>The server that is running this JSP is on port: <%= thisServerPort %></p>
<p>Value in Session is: <%= sessionVal %></p>
<br>
user.userID:<%=user.userID%><br>
user.userName:<%=user.userName%><br>
user.loginTime:<%=user.loginTime%><br>
</body>
</html>

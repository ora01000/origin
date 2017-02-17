<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.URLEncoder" %>
<%-- Parameter로 넘어온 값정의      --%>
<%
    String command  = request.getParameter("command").trim();
	String user_id   = "";
	String user_name = "";
	String password  = "";
    String saveid    = "";


   
   if(command.equals("login") )
   {
    user_id   = request.getParameter("userid").trim();
    user_name = request.getParameter("username").trim();   
    password = request.getParameter("password").trim();
    saveid = request.getParameter("saveid").trim();
    
	Cookie cookie_user_id       = new Cookie("user_id"      , URLEncoder.encode(user_id));
	Cookie cookie_password      = new Cookie("password"     , URLEncoder.encode(password));
	Cookie cookie_user_name     = new Cookie("user_name"     , URLEncoder.encode(user_name));
	Cookie cookie_saveid     = new Cookie("saveid"     , URLEncoder.encode(saveid));
	
	cookie_user_id.setPath("/");
	cookie_password.setPath("/");
	cookie_user_name.setPath("/");
	cookie_saveid.setPath("/");
	
    cookie_user_id.setDomain(".samsungelectronics.com");
    cookie_password.setDomain(".samsungelectronics.com");
    cookie_user_name.setDomain(".samsungelectronics.com");
	cookie_saveid.setDomain(".samsungelectronics.com");
	
	response.addCookie(cookie_user_id);
	response.addCookie(cookie_password);
	response.addCookie(cookie_user_name);
	response.addCookie(cookie_saveid);
	
   }
   else if(command.equals("logout") )
   {
   
    Cookie cookie_user_id = new Cookie("user_id", "");
    cookie_user_id.setMaxAge(0);
    response.addCookie(cookie_user_id);
    
   }
   else
   {
   
   
   }
   
%>

<HTML>
<HEAD>
<LINK href="/htdocs/common/xjsv.css" rel="stylesheet" type="text/css">
<LINK href="/htdocs/common/sctdstyle.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY>
<FORM method="post"  name="test" >
request 정보
<table cellpadding="1" cellspacing="1" border=0 style="border:solid 1px #E6E6E9" >
<tr>
<td>command </td><td><%=command%></td>
<td>userid  </td><td><%=user_id%></td>
<td>username</td><td><%=user_name%></td>  
<td>password</td><td><%=password%></td>
</tr>
<table>
cookie정보
<table cellpadding="1" cellspacing="1" border=0 style="border:solid 1px #E6E6E9" >
<%
        String url         =  HttpUtils.getRequestURL(request).toString();
        out.println(url);

        Cookie[] cookies = request.getCookies();
        Cookie thisCookie;
        boolean cookieFound = false;

%>
                            <tr>
                                <td width = "25">순번  </td>
                                <td width = "90">thisCookieName  </td>
                                <td>thisCookie      </td>
                                <td>thisCookieValue </td>
                                <td width = "30">MaxAge</td>
                            </tr>
<%


        for(int i=0; i < cookies.length; i++) {
          thisCookie = cookies[i];
%>
                            <tr>
                                <td><%= (i+1)   %></td>
                                <td><%= thisCookie.getName()   %></td>
                                <td><%= thisCookie             %></td>
                                <td><%= thisCookie.getValue()  %></td>
                                <td><%= thisCookie.getMaxAge() %></td>
                            </tr>
                            <%}%>
</table>
</FORM>
</BODY>
</HTML>
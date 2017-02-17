<%-- Program info --%>
<%
    /*
     *  Program Type : JSP
     *  Program ID   : PROGRAM.jsp
     *
     *  DESC         :
     *  Author       :
     *  Date         :
     *  Update       :
     */
%>
<%@ page contentType="text/html; charset=EUC_KR" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>
<%-- JSP import or info --%>

<%-- 공통 lib정보 --%>

<%-- Parameter로 넘어온 값정의  --%>


<%
        String url         =  HttpUtils.getRequestURL(request).toString();
        out.println(url);

        Cookie my_cookies01 = new Cookie("test01" , "test--01");
        Cookie my_cookies02 = new Cookie("test02" , "test--02");
        Cookie my_cookies03 = new Cookie("test03" , "test--03");
        Cookie my_cookies04 = new Cookie("test04" , "test--04");
        Cookie my_cookies05 = new Cookie("test05" , "test--05");
        Cookie my_cookies06 = new Cookie("test06" , "test--06");
        Cookie my_cookies07 = new Cookie("test07" , "test--07");
        Cookie my_cookies08 = new Cookie("test08" , "test--08");
        Cookie my_cookies09 = new Cookie("test09" , "test--09");
        Cookie my_cookies10 = new Cookie("test10" , "test--10");
        Cookie my_cookies11 = new Cookie("test11" , "test--11");
        Cookie my_cookies12 = new Cookie("test12" , "test--12");


        //my_cookies.setMaxAge(7877);
        response.addCookie(my_cookies01);
        response.addCookie(my_cookies02);
        response.addCookie(my_cookies03);
        response.addCookie(my_cookies04);
        response.addCookie(my_cookies05);
        response.addCookie(my_cookies06);
        response.addCookie(my_cookies07);
        response.addCookie(my_cookies08);
        response.addCookie(my_cookies09);
        response.addCookie(my_cookies10);
        response.addCookie(my_cookies11);
        response.addCookie(my_cookies12);

        Cookie[] cookies = request.getCookies();
        Cookie thisCookie;
        boolean cookieFound = false;

        out.println("<br> cookies size"+cookies.length);

out.println("<br>--  --  --  --  --  -- -- --  start  --  --  --  --  --  --  --  --  <br>");
        for(int i=0; i < cookies.length; i++) {
          thisCookie = cookies[i];
          out.println("<br>thisCookieName => "+thisCookie.getName());
          out.println("<br>thisCookie => "+thisCookie);
          out.println("<br>thisCookieValue ==>"+thisCookie.getValue());
          out.println("<br>thisCookieMaxAge ==>"+thisCookie.getMaxAge());
out.println("<br>--  --  --  --  --  -- -- --  "+i+"  --  --  --  --  --  --  --  --  ");
//          if (thisCookie.getName().equals("ChocolateChip")) {
//            cookieFound = true;
//            break;
//          }

        }

//        if (cookieFound) {
//          // We found the cookie! Now get its value
//          int cookieOrder = String.parseInt(thisCookie.getValue());
//          out.println(thisCookie.getValue());
//        }

/*
        Cookie my_cookies       = new Cookie("cookie_point1"      , "aaaaaaaaaaaaaaa");
        //안하면 서블릿에서 jsp foward하면 전달이 안됨
        my_cookies.setPath("/");
        response.addCookie(my_cookies);
        session.putValue("cookie_point1" , "aaaaaaaaaaaaaaa");
*/

%>















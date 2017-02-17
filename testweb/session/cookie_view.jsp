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
<HTML>
<HEAD>
<SCRIPT src='/htdocs/cmn/js/cmnJs.js'>
</SCRIPT>

</HEAD>

<BODY >
<FORM name="edu" >

<table width="100%" border="0" cellspacing="0" cellpadding="0" align="left">
    <tr>
        <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        <table width="800" border="1" cellspacing="0" cellpadding="0" style="table-layout:fixed;" valign="center">


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


<%
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

                        </table>
                    </td>
                </tr>
            </table>
        </td>
        <!-- 화면 우측 공간   -->
        <td></td>
    </tr>
</table>


</form>
</BODY>
</HTML>















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


        String cookie_value01 = request.getParameter("cookie_value01");
        String cookie_value02 = request.getParameter("cookie_value02");
        String cookie_value03 = request.getParameter("cookie_value03");
        String cookie_value04 = request.getParameter("cookie_value04");
        String cookie_value05 = request.getParameter("cookie_value05");
        String cookie_value06 = request.getParameter("cookie_value06");
        String cookie_value07 = request.getParameter("cookie_value07");
        String cookie_value08 = request.getParameter("cookie_value08");
        String cookie_value09 = request.getParameter("cookie_value09");
        String cookie_value10 = request.getParameter("cookie_value10");
        String cookie_value11 = request.getParameter("cookie_value11");
        String cookie_value12 = request.getParameter("cookie_value12");


        Cookie my_cookies01 = new Cookie("test01" , cookie_value01);
        Cookie my_cookies02 = new Cookie("test02" , cookie_value02);
        Cookie my_cookies03 = new Cookie("test03" , cookie_value03);
        Cookie my_cookies04 = new Cookie("test04" , cookie_value04);
        Cookie my_cookies05 = new Cookie("test05" , cookie_value05);
        Cookie my_cookies06 = new Cookie("test06" , cookie_value06);
        Cookie my_cookies07 = new Cookie("test07" , cookie_value07);
        Cookie my_cookies08 = new Cookie("test08" , cookie_value08);
        Cookie my_cookies09 = new Cookie("test09" , cookie_value09);
        Cookie my_cookies10 = new Cookie("test10" , cookie_value10);
        Cookie my_cookies11 = new Cookie("test11" , cookie_value11);
        Cookie my_cookies12 = new Cookie("test12" , cookie_value12);

        my_cookies01.setPath("/");
        my_cookies02.setPath("/");
        my_cookies03.setPath("/");
        my_cookies04.setPath("/");
        my_cookies05.setPath("/");
        my_cookies06.setPath("/");

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

        out.println("<br>COOKIE 생성 완료");


%>




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
                        <table width="800" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed;" valign="center">
                            <tr><td>cookie_value01  </td><td><input type="text" name="cookie_value01" value="<%= cookie_value01 %>"</td></tr>
                            <tr><td>cookie_value02  </td><td><input type="text" name="cookie_value02" value="<%= cookie_value02 %>"</td></tr>
                            <tr><td>cookie_value03  </td><td><input type="text" name="cookie_value03" value="<%= cookie_value03 %>"</td></tr>
                            <tr><td>cookie_value04  </td><td><input type="text" name="cookie_value04" value="<%= cookie_value04 %>"</td></tr>
                            <tr><td>cookie_value05  </td><td><input type="text" name="cookie_value05" value="<%= cookie_value05 %>"</td></tr>
                            <tr><td>cookie_value06  </td><td><input type="text" name="cookie_value06" value="<%= cookie_value06 %>"</td></tr>
                            <tr><td>cookie_value07  </td><td><input type="text" name="cookie_value07" value="<%= cookie_value07 %>"</td></tr>
                            <tr><td>cookie_value08  </td><td><input type="text" name="cookie_value08" value="<%= cookie_value08 %>"</td></tr>
                            <tr><td>cookie_value09  </td><td><input type="text" name="cookie_value09" value="<%= cookie_value09 %>"</td></tr>
                            <tr><td>cookie_value10  </td><td><input type="text" name="cookie_value10" value="<%= cookie_value10 %>"</td></tr>
                            <tr><td>cookie_value11  </td><td><input type="text" name="cookie_value11" value="<%= cookie_value11 %>"</td></tr>
                            <tr><td>cookie_value12  </td><td><input type="text" name="cookie_value12" value="<%= cookie_value12 %>"</td></tr>
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











<%-- Program info --%>
<%
    /*
     *  Program Type : JSP
     *  Program ID   : FRAME.jsp
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
<%-- JSP import or info --%>

<%-- ���� lib���� --%>


<%-- Parameter�� �Ѿ�� ������  --%>


<html>
        <frameset rows="85,*" border=1 >
            <frame src="./cookie_con.jsp"  name='con_frame'  scrolling='auto'   frameborder=no border=1 />
            <frame src="./cookie_create.jsp"  name='lst_frame'  scrolling='auto'   frameborder=no border=1 />
        </frameset>
</html>

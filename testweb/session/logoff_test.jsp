<%@ page info="logoff.jsp" %>
<%@ page session="true" contentType="text/html; charset=EUC-KR"%>
<%@ page import ="javax.servlet.*,java.lang.*,java.io.*,java.util.*, java.net.*" %>
<%
    /* main */
	
    /*
     * ���� ��Ű�� �����
     * SMSESSION ��Ű�� ������ �α׾ƿ� �ϴ� �κ�
     */
    int idx1 = -1, idx2 = -1, idx3 = -1;
    Cookie cookie = null;
    Cookie[] cookies = null;

out.println("idx1["+idx1+"]"+" idx2["+idx2+"]"+"idx3["+idx3+"]");               
    /* ���� request�� ��Ű�� ��´� */
    cookies = request.getCookies();
    for(int idx = 0; idx < cookies.length; idx++ )
    {
            cookie = cookies[ idx ];
            /* request�� ��Ű�߿��� SMSESSION �� ã�´� */
            if( cookie.getName().equals( "user_id" ) ) idx1 = idx;
            if( cookie.getName().equals( "user_name" ) )  idx2 = idx;
            if( cookie.getName().equals( "password" ) )   idx3 = idx; 
out.println("<br>idx1["+idx1+"]"+" idx2["+idx2+"]"+"idx3["+idx3+"]");             
    }

    if( idx1 != -1 )
    {
            System.out.println("============ SMSESSION CLEAR ============");
            /* SMSESSION �� �ش��ϴ� ���ο� ��Ű�� �����Ѵ�. */
            cookie = cookies[idx1];
out.println("<br> idx1:"+URLEncoder.encode( cookie.getValue() ));           
            Cookie logout1 = new Cookie( cookie.getName(), URLEncoder.encode( cookie.getValue() ) );
            logout1.setDomain( "bang.co.kr" );
            logout1.setMaxAge( 0 );
            logout1.setPath( "/" );
            /* response �� ���� ���� SMSESSION ��Ű�� �߰��Ѵ� */
            response.addCookie( logout1 );
	}

    if( idx2 != -1 )
    {
        System.out.println("============ FORMCRED CLEAR ============");
        /* FORMCRED �� �ش��ϴ� ���ο� ��Ű�� �����Ѵ� */
                cookie = cookies[idx2];
out.println("<br> idx2:"+URLEncoder.encode( cookie.getValue() ));                 
                Cookie logout2 = new Cookie( cookie.getName(), URLEncoder.encode( cookie.getValue() ) );
                logout2.setDomain( "bang.co.kr" );
                logout2.setMaxAge( 0 );
                logout2.setPath( "/" );

                /* response �� ���� ���� FORMCRED ��Ű�� �߰��Ѵ� */
                response.addCookie( logout2 );
    }

    if( idx3 != -1 )
    {
            System.out.println("============ SMTRYNO CLEAR ============");
            /* SMTRYNO �� �ش��ϴ� ���ο� ��Ű�� �����Ѵ� */
            cookie = cookies[idx3];
out.println("<br> idx3:"+URLEncoder.encode( cookie.getValue() ));             
            Cookie logout3 = new Cookie( cookie.getName(), URLEncoder.encode( cookie.getValue() ) );
            logout3.setDomain( "bang.co.kr" );
            logout3.setMaxAge( 0 );
            logout3.setPath( "/" );

            /* response �� ���� ���� FORMCRED ��Ű�� �߰��Ѵ� */
            response.addCookie( logout3 );
    }
	/* end of main */

	// ��ü ����Ʈ������ ���Ǵ� Session ����ó��
	//
	// ��������� �ǵ帮�� �ȵ�.. ���Ŀ� ��ü ���ǹ� ��Ű �����ϴ� �κ� �߰�....
	// session.invalidate();
%>    
<html>
<head>
<script language='javascript'>

function funcLocation()
{

  var form = document.test;
  form.method = "post";
  form.target = "lst_frame";
  form.action = "/htdocs/cookie/login_lst.jsp";
  form.submit();
  
}


</SCRIPT>
<!-- Meta Tag�� �ݵ�� ����� �� -->
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<title>B2B Logoff Page</title>
</head>
<body>
<form name='test'>
<input type='hidden' name='command'>
<br>
<A HREF="javascript:funcLocation();">Ȯ��</a>
</form>
</body>
</html>
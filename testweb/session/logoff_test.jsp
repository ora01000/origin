<%@ page info="logoff.jsp" %>
<%@ page session="true" contentType="text/html; charset=EUC-KR"%>
<%@ page import ="javax.servlet.*,java.lang.*,java.io.*,java.util.*, java.net.*" %>
<%
    /* main */
	
    /*
     * 먼저 쿠키를 지운다
     * SMSESSION 쿠키를 지워서 로그아웃 하는 부분
     */
    int idx1 = -1, idx2 = -1, idx3 = -1;
    Cookie cookie = null;
    Cookie[] cookies = null;

out.println("idx1["+idx1+"]"+" idx2["+idx2+"]"+"idx3["+idx3+"]");               
    /* 현재 request의 쿠키를 얻는다 */
    cookies = request.getCookies();
    for(int idx = 0; idx < cookies.length; idx++ )
    {
            cookie = cookies[ idx ];
            /* request의 쿠키중에서 SMSESSION 을 찾는다 */
            if( cookie.getName().equals( "user_id" ) ) idx1 = idx;
            if( cookie.getName().equals( "user_name" ) )  idx2 = idx;
            if( cookie.getName().equals( "password" ) )   idx3 = idx; 
out.println("<br>idx1["+idx1+"]"+" idx2["+idx2+"]"+"idx3["+idx3+"]");             
    }

    if( idx1 != -1 )
    {
            System.out.println("============ SMSESSION CLEAR ============");
            /* SMSESSION 에 해당하는 새로운 쿠키를 생성한다. */
            cookie = cookies[idx1];
out.println("<br> idx1:"+URLEncoder.encode( cookie.getValue() ));           
            Cookie logout1 = new Cookie( cookie.getName(), URLEncoder.encode( cookie.getValue() ) );
            logout1.setDomain( "bang.co.kr" );
            logout1.setMaxAge( 0 );
            logout1.setPath( "/" );
            /* response 에 새로 만든 SMSESSION 쿠키를 추가한다 */
            response.addCookie( logout1 );
	}

    if( idx2 != -1 )
    {
        System.out.println("============ FORMCRED CLEAR ============");
        /* FORMCRED 에 해당하는 새로운 쿠키를 생성한다 */
                cookie = cookies[idx2];
out.println("<br> idx2:"+URLEncoder.encode( cookie.getValue() ));                 
                Cookie logout2 = new Cookie( cookie.getName(), URLEncoder.encode( cookie.getValue() ) );
                logout2.setDomain( "bang.co.kr" );
                logout2.setMaxAge( 0 );
                logout2.setPath( "/" );

                /* response 에 새로 만든 FORMCRED 쿠키를 추가한다 */
                response.addCookie( logout2 );
    }

    if( idx3 != -1 )
    {
            System.out.println("============ SMTRYNO CLEAR ============");
            /* SMTRYNO 에 해당하는 새로운 쿠키를 생성한다 */
            cookie = cookies[idx3];
out.println("<br> idx3:"+URLEncoder.encode( cookie.getValue() ));             
            Cookie logout3 = new Cookie( cookie.getName(), URLEncoder.encode( cookie.getValue() ) );
            logout3.setDomain( "bang.co.kr" );
            logout3.setMaxAge( 0 );
            logout3.setPath( "/" );

            /* response 에 새로 만든 FORMCRED 쿠키를 추가한다 */
            response.addCookie( logout3 );
    }
	/* end of main */

	// 자체 사이트내에서 사용되는 Session 종료처리
	//
	// 여기까지는 건드리면 안됨.. 이후에 자체 세션및 쿠키 제거하는 부분 추가....
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
<!-- Meta Tag는 반드시 사용할 것 -->
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<title>B2B Logoff Page</title>
</head>
<body>
<form name='test'>
<input type='hidden' name='command'>
<br>
<A HREF="javascript:funcLocation();">확인</a>
</form>
</body>
</html>
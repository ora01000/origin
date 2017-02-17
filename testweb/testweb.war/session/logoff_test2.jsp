<%@ page info="logoff.jsp" %>
<%@ page session="true" contentType="text/html; charset=EUC-KR"%>
<%@ page import ="javax.servlet.*,java.lang.*,java.io.*,java.util.*, java.net.* " %>
<%
    /* main */
	
    /*
     * 먼저 쿠키를 지운다
     * SMSESSION 쿠키를 지워서 로그아웃 하는 부분
     */
    int idx1 = -1, idx2 = -1, idx3 = -1 ,idx5=-1;
    Cookie cookie = null;
    Cookie[] cookies = null;



	try {


		session.removeAttribute("user_id");
		session.removeAttribute("user_name");
		session.removeAttribute("password");
		session.removeAttribute("user_group");
		session.removeAttribute("ip");
//		삭제
		session.removeAttribute("SMSESSION");
		session.removeAttribute("FORMCRED");
		session.removeAttribute("SMTRYNO");
		session.removeAttribute("saveid");
		session.invalidate();

	} catch (Exception e) {
		e.printStackTrace();
		System.out.println("Session Remove Error!");
	}




// test , response.addcookie 로 생성 가능?
	Cookie logout5 = new Cookie("Test11", "badcaseforcookie");
	logout5.setDomain( ".samsungelectronics.com" );
	logout5.setMaxAge( Integer.MAX_VALUE );
	logout5.setPath( "/" );
	response.addCookie(logout5);

// test  , documnet.cookie
out.println("<script>");
out.println("alert('response :"+response+"	session :"+session+"');"); 
out.println("document.cookie ='test=test';");
out.println("document.cookie ='test=test';");
out.println("</script>");


    /* 현재 request의 쿠키를 얻는다 */
    cookies = request.getCookies();
    for(int idx = 0; idx < cookies.length; idx++ )
    {
            cookie = cookies[ idx ];
            /* request의 쿠키중에서 SMSESSION 을 찾는다 */
            if( cookie.getName().equals( "user_id" ) ) idx1 = idx;
            if( cookie.getName().equals( "user_name" ) )  idx2 = idx;
            if( cookie.getName().equals( "password" ) )   idx3 = idx;
            if( cookie.getName().equals( "saveid" ) )   idx5 = idx;
    }

    if( idx1 != -1 )
    {
            System.out.println("============ SMSESSION CLEAR ============");
            /* SMSESSION 에 해당하는 새로운 쿠키를 생성한다. */
            cookie = cookies[idx1];
//            Cookie logout1 = new Cookie( cookie.getName(), URLEncoder.encode( cookie.getValue() ) );
            Cookie logout1 = new Cookie("user_id", null );
            logout1.setDomain( ".samsungelectronics.com" );
            logout1.setMaxAge( 0 );
            logout1.setPath( "/" );
            response.addCookie(logout1);


	}

    if( idx2 != -1 )
    {
        System.out.println("============ FORMCRED CLEAR ============");
        /* FORMCRED 에 해당하는 새로운 쿠키를 생성한다 */
                cookie = cookies[idx2];
                Cookie logout2 = new Cookie( cookie.getName(), URLEncoder.encode( cookie.getValue() ) );
                logout2.setDomain( ".samsungelectronics.com" );
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
            Cookie logout3 = new Cookie( cookie.getName(), URLEncoder.encode( cookie.getValue() ) );
            logout3.setDomain( ".samsungelectronics.com" );
            logout3.setMaxAge( 0 );
            logout3.setPath( "/" );

            /* response 에 새로 만든 FORMCRED 쿠키를 추가한다 */
            response.addCookie( logout3 );
    }
    
    System.out.println("aaaaaaaa"+idx5);
    if( idx5 != -1 )
    {
out.println("<script>");
out.println("alert('found saveid!!');"); 
out.println("</script>");

         cookie = cookies[idx5];   
         Cookie logout3     = new Cookie(cookie.getName()     , "ddddddddd");   
         logout3.setPath("/");  
         logout3.setMaxAge( 1000 ) ;
         logout3.setDomain(".samsungelectronics.com");   
         response.addCookie(logout3);   
         
         
out.println("<script>");
out.println("alert('after removing found saveid!!\\n'+document.cookie);"); 
out.println("</script>");

    }
	/* end of main */

	// 자체 사이트내에서 사용되는 Session 종료처리
	//
	// 여기까지는 건드리면 안됨.. 이후에 자체 세션및 쿠키 제거하는 부분 추가....
	// session.invalidate();



	out.println("<script>");
//	out.println("	top.location = '/source/anylogin/anysvc_login.html';"); 
	out.println("</script>");

%>    
<html>
<head>
<!-- Meta Tag는 반드시 사용할 것 -->
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<title>B2B Logoff Page</title>
<script language="javascript">
</script>
</head>
<body>
</body>
</html>
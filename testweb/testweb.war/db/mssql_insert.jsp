<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.InitialContext" %>
<%-- Parameter로 넘어온 값정의      --%>
<% 
   String command    = request.getParameter("command").trim();
    String ip         = "";
    String port       = "";
    String sid        = "";
    String username   = "";
    String password   = "";
    String poolname   = ""; 
    String dsname     = ""; 
    String arg1       = "";
       
    Connection        conn  = null;
    PreparedStatement pstmt = null;
    String result_code = "Y";
	String result_msg  = "정상적으로 저장 되었습니다."; 
    try{ 
    		 
	int    txRs    = 0;
	 
	    if(command.equals("jdbc") )
		{ 
		 
		    ip         = request.getParameter("ip").trim();
		    port       = request.getParameter("port").trim();
		    sid        = request.getParameter("sid").trim();
		    username   = request.getParameter("username").trim();
		    password   = request.getParameter("password").trim();

		    conn       = DriverManager.getConnection( "jdbc:microsoft:sqlserver://"+ip+":"+port+";databasename="+sid,username, password);
		    arg1 = "jdbc test";
		} 
		else if(command.equals("pool"))
		{ 
		    poolname   = request.getParameter("poolname").trim();
		    Driver eduDriver = (Driver)Class.forName("weblogic.jdbc.pool.Driver").newInstance();
		 
		    Properties props = new Properties();
		    props.put("connectionPoolID", poolname);    
		    conn  = eduDriver.connect("jdbc:weblogic:pool:"+poolname, null);
		    arg1 = "pool test";
		} 
		else if(command.equals("ds"))
		{ 
		    dsname  = request.getParameter("dsname").trim();
			javax.naming.Context ctx = new InitialContext();
			javax.sql.DataSource ds  = (javax.sql.DataSource) ctx.lookup (dsname);
			conn  = ds.getConnection();
			 
			arg1 = "ds test";
		} 
 
	 
	conn.setAutoCommit(false);
	 
	String query = "insert into test_bang values(?)";
	 
	pstmt = conn.prepareStatement(query);
	for(int i = 1 ; i<= 4 ; i++)
	{ 
			 
		if( i == 3 ) arg1 = "12345678901234";
		 
		pstmt.setString(1,arg1);
		txRs = pstmt.executeUpdate();
		System.out.println("txRs:"+txRs);
	 
	}//end for
	conn.commit();
		 
	conn.setAutoCommit(true);	
			 
}catch(Exception e)
{  
 System.out.println("Exception:"+e.toString());
 result_code = "N";
 result_msg = "에러 내용:"+e.toString();
 conn.rollback();
 
} 
finally 
{  
 
      if (pstmt != null) pstmt.close();
      if (conn  != null)  conn.close();
 
} 
 
%> 
 
<html> 
<head></head> 
<body> 
<br> 
<%="입력 방법 : "+command %>
<%="<br>결과 Code:"+result_code%>
<%="<br>결과 Message:"+result_msg%>
</body> 
</html> 
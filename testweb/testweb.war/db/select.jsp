<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="java.text.SimpleDateFormat" %> 
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.SimpleTimeZone" %>

<%-- Parameter로 넘어온 값정의      --%>
<%

	String query      = "select * from dept”;
	
	String dsname     = ""; 
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS");
	
	Connection        conn  = null;
	PreparedStatement pstmt = null;
	try{
	ResultSet         rs = null;
	ResultSetMetaData rm = null;
	
	
	dsname     = "testds1";
	javax.naming.Context ctx = null;
	ctx = new InitialContext();
	javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup (dsname);
	
	conn  = ds.getConnection();
	
	
	pstmt     = conn.prepareStatement(query);
	rs        = pstmt.executeQuery();
	rm        = rs.getMetaData();
	
	int count = rm.getColumnCount();
	//System.out.println(">>>>>>>>>>"+count);
	while (rs.next()) {
	
	System.out.println(formatter.format(Calendar.getInstance().getTime())+"-RS:"+rs.getString(1));
	}
	rs.close();
}catch(Exception e)
{ 
 e.printStackTrace();
      out.println("조회 에러 입니다. 아래 내용 확인 하시기 바랍니다.:::<br>"+e.getMessage()+"<br>"+query);
}
finally
{    
      if (pstmt != null) pstmt.close();
      if (conn  != null)  conn.close();
}

%>
<HTML>
<HEAD>
<LINK href="/htdocs/common/xjsv.css" rel="stylesheet" type="text/css">
<LINK href="/htdocs/common/sctdstyle.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY>
<FORM method="post"  name="test" >
<table cellpadding="1" cellspacing="1" border=0 style="border:solid 1px #E6E6E9" >
TEST Page
</table>
</FORM>
</BODY>
</HTML>
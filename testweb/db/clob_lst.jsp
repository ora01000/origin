<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.InitialContext" %>
<%-- Parameter로 넘어온 값정의      --%>
<%
    String command    = request.getParameter("command").trim();
    String seq        = request.getParameter("seq").trim();
    String subject    = request.getParameter("subject").trim();
    String content    = request.getParameter("content").trim();

    String ip         = "";
    String port       = "";
    String sid        = "";
    String username   = "";
    String password   = "";
    String poolname   = ""; 
    String dsname     = ""; 
    String getMessage = "";
	String getErrorCode = "0";
	
  
    response.setContentType("text/html");
  
    Connection        conn  = null;
    PreparedStatement pstmt = null;
    
    String insert_sql = " insert into t_clob (seq , subject ,content , create_date) "
                      + " values( ? , ? , empty_clob() , sysdate)";
   
    String clob_sql=  " SELECT content   FROM   t_clob   WHERE  seq = ?    FOR UPDATE";
    		
    try{
	    ResultSet         rs = null;
	    ResultSetMetaData rm = null;

	    
	    if(command.equals("jdbc") )
		{
		    ip         = request.getParameter("ip").trim();
		    port       = request.getParameter("port").trim();
		    sid        = request.getParameter("sid").trim();
		    username   = request.getParameter("username").trim();
		    password   = request.getParameter("password").trim();
		    
		    conn       = DriverManager.getConnection( "jdbc:oracle:thin:@"+ip+":"+port+":"+sid,username, password);
		}
		else if(command.equals("pool"))
		{
		    poolname   = request.getParameter("poolname").trim();
		    Driver eduDriver = (Driver)Class.forName("weblogic.jdbc.pool.Driver").newInstance();
		
		    Properties props = new Properties();
		    props.put("connectionPoolID", poolname);    
		    conn  = eduDriver.connect("jdbc:weblogic:pool:"+poolname, null);
		    
		}
		else if(command.equals("ds"))
		{
		    dsname     = request.getParameter("dsname").trim();
		    javax.naming.Context ctx = null;
		    ctx = new InitialContext();
		    javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup (dsname);
		    conn  = ds.getConnection();
		}
		
			try
			{
				conn.setAutoCommit(false);
			}
			catch(SQLException e)
			{
			  e.printStackTrace();
			}
			
		pstmt = conn.prepareCall( insert_sql ) ;	  

		pstmt.setString( 1, seq		 ) ;
		pstmt.setString( 2, subject  ) ;
		int result = pstmt.executeUpdate( ) ;

		
		if (result > 0 )
			{
				getMessage = "저장이 성공적으로 되었습니다.";
				getErrorCode = "0";
	
				pstmt = conn.prepareStatement( clob_sql ) ;
				pstmt.clearParameters();
				pstmt.setString( 1, seq ) ; // 질문번호            ,?

				rs = pstmt.executeQuery( ) ;

               if(rs.next())
               {
                  Clob clob = (Clob)rs.getObject(1);
		  
				  StrToClob(content, clob );


			   }
				
			}
			else
			{
				getMessage = "pstmt.executeUpdate Error";
				getErrorCode = "222222222";		

			}
		       
		  	try
			{
				

				if ( getErrorCode.equals("0")) //성공
					conn.commit();
				else //실패
					conn.rollback();
	            conn.setAutoCommit(true);


			}catch( SQLException e3 ){System.out.println("33333333333:"+e3.toString());}	 
			catch( Exception e4 ){System.out.println("44444444:"+e4.toString());}	 

		
		
		/*************************************************************************
		*
		*  Clob Data 조회 
		***************************************************************************/
		String query = "select seq,subject,content,create_date from t_clob";
			  
  		pstmt     = conn.prepareStatement(query);
	    rs        = pstmt.executeQuery();
	    rm        = rs.getMetaData();
		int count = rm.getColumnCount();
	  	  
	  
	    String columnLabel = "";
		out.println("<HTML>");
		out.println("<HEAD>");
		out.println("</HEAD>");
		out.println("<BODY>");
		out.println("<FORM method='post'  name='test' >");
		out.println("<table cellpadding='1' cellspacing='1' border=0 style='border:solid 1px #E6E6E9' >");

        out.println("<tr>");
		for( int i = 0 ; i < count ; i++)
		{	
			out.println("<td>"+rm.getColumnLabel(i+1)+"</td>");;
		}
	    out.println("</tr>");	
	    
		while (rs.next()) {
		out.println("<tr>");
		
			for( int j = 0 ; j < count ; j++ )
			{
				if( j==2)
				{          
					out.println("<td>"+ ClobToStr(rs.getCharacterStream(j+1))+"</td>");
				}
				else
				{   
					out.println("<td>"+ rs.getString(j+1)+"</td>");
				}
		    }
		        out.println("</tr>");
		    
		 }
		out.println("</table>");
		out.println("</FORM> ");
		out.println("</BODY> ");
		out.println("</HTML> ");    
	    rs.close( ) ;
		}catch(SQLException ioe){
			System.out.println("1111:"+ioe.toString());
			 ioe.printStackTrace();
		}catch(Exception e)
		{ 
		 e.printStackTrace();
		      out.println("조회 에러 입니다. 아래 내용 확인 하시기 바랍니다.:::<br>"+e.getMessage()+"<br>");
		}
		
		finally
		{ 					
	
		    try
			{
				
			  if (pstmt != null) pstmt.close();
			  if (conn  != null)  conn.close();

		      out.close();		
	
			}catch( SQLException e3 ){System.out.println("33333333333:"+e3.toString());}	 
			catch( Exception e4 ){System.out.println("44444444:"+e4.toString());}	 

		
		    
		}
		
%>

<%!
public static String ClobToStr(Reader _outReader)
    {
        if(_outReader == null) return(null);
        try {
              StringBuffer sb_content = new StringBuffer();

              char[] buffer = new char[1024*10];
              int bytesRead;
              Reader outReader        = _outReader;

              if(outReader != null)
              {
                  while ((bytesRead = outReader.read(buffer, 0, buffer.length )) != -1) {
                        sb_content.append(buffer, 0, bytesRead);
                  }
              }
              else
              {
                      sb_content.append(" ");
              }

              if(outReader!=null) outReader.close();


            return sb_content.toString();

        } catch(IOException e) {
            e.printStackTrace();
        }

        return(null);
    }
    
    
    
     public  static void StrToClob(String str,java.sql.Clob clob )
    {

        long   getErrorCode  = 0  ;
        String getMessage    = "" ;


        Writer os    = null;


        try {
                //os = ((weblogic.jdbc.common.OracleClob)clob).getCharacterOutputStream();
                os = ((weblogic.jdbc.vendor.oracle.OracleThinClob)clob).getCharacterOutputStream();
                
                os.write(str);


        } catch(IOException e) {
            getErrorCode = -99901;
            getMessage   = "Dbw IOException : "+e.getMessage()+"";

        }
        catch(Exception e)
        {
            getErrorCode = -99900;
            getMessage   = "Dbw Exception : "+e.getMessage()+"";


        }finally
        {
            try{
                  if(os!=null)   os.flush();
                  if(os!=null)   os.close();
            } catch(IOException e)
            {

            }

        }
   }
%>
</table>
</FORM>
</BODY>
</HTML>
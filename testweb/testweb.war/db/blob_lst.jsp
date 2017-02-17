<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.InitialContext" %>
<%-- Parameter로 넘어온 값정의      --%>
<%
 // BLOB 타입Clob에 Data저장  
    Connection        conn  = null;
    PreparedStatement pstmt = null;
    
    String insert_sql = " insert into t_blob (seq , subject ,content , create_date) "
                      + " values( ? , ? , ? , sysdate)";
   
    		
    File file= new File("D:/test2.gif");
    InputStream is = new FileInputStream(file);
    int filesize = (int)file.length();

    ResultSet         rs = null;
    ResultSetMetaData rm = null;

    String dsname     = "sampleds";
    javax.naming.Context ctx = null;
    ctx = new InitialContext();
    javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup (dsname);
    conn  = ds.getConnection();


	pstmt = conn.prepareStatement( insert_sql ) ;	  

	pstmt.setString( 1, "1"		 ) ;
	pstmt.setString( 2, "test"  ) ;
	pstmt.setBinaryStream(3 , is , filesize);
	int result = pstmt.executeUpdate( ) ;

		
	
	
	/**********************************************************************
	*
	* 저장된 BLOB로 파일 생성
	***********************************************************************/
		
	String query = "select seq,subject,content,create_date from t_blob";
		  
	pstmt     = conn.prepareStatement(query);
    rs        = pstmt.executeQuery();

	
	if (rs.next()) 
	{
	
		String seq = rs.getString("seq");
		String subject = rs.getString("subject");
		Blob blob = rs.getBlob("content");
		InputStream  is2 = blob.getBinaryStream();
		FileOutputStream fos = new FileOutputStream("D:/copy.gif");
		byte[] buffer = new byte[1024];
		
		int length; 
		while ( ( length = is2.read( buffer ) ) != -1 ) 
		{
		
			fos.write(buffer,0, length);
			fos.flush();
		}
		
		fos.close();
		is2.close();
	   
		    
    }
   
	    rs.close( ) ;
		
		
%>


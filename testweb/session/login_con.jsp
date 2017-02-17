<%@ page contentType="text/html; charset=euc-kr" %>

<%-- Parameter로 넘어온 값정의      --%>

<HTML>
<HEAD>
<script language='javascript'>

function funcLocation(command )
{

  var form = document.test;
  form.command.value = command;
  form.method = "post";
  form.target = "lst_frame";
  form.action = "./login_lst.jsp";
  form.submit();
  
}

function funclogout()
{
  var form = document.test;
  form.method = "post";
  form.target = "lst_frame";
  form.action = "./logoff_test2.jsp";
  form.submit();

}

</SCRIPT>
<LINK href="/htdocs/common/xjsv.css" rel="stylesheet" type="text/css">
<LINK href="/htdocs/common/sctdstyle.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY>

<FORM method="post"  name="test" >
<input type='hidden' name='command'>
<TABLE width="800" cellpadding="1" cellspacing="1" border=0 style="border:solid 1px #E6E6E9">
	<tr><td colspan=2> >> login/logout Test
	<TR>
	<TD align="left" >조회 방법</TD>
	<TD >
         <A HREF="javascript:funcLocation('login');">Login</a>
         <A HREF="javascript:funclogout('logout');">logout</a>
         <A HREF="javascript:funcLocation('search');">cookie 조회</a>
         </TD>
	</TR>
</TABLE>
<Table  width="800" cellpadding="1" cellspacing="1" border=0 style="border:solid 1px #E6E6E9">
<tr>
<td>user_id</td>
<td><INPUT type="text" name="userid" size="20"></td>
</tr>
<tr>
<td>password</td>
<td><input type="password" name="password" size="20" ></td>
</tr>
<tr>
<td>user_name</td>
<td><INPUT type="text" name="username" size="20"></td>
</tr>
<tr>
<td>saveid</td>
<td><INPUT type="text" name="saveid" size="20"></td>
</tr>
</table>
</FORM>
</BODY>
</HTML>
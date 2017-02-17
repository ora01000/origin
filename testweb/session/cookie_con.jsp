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
<%-- JSP import or info --%>

<%-- 공통 lib정보 --%>

<%-- Parameter로 넘어온 값정의  --%>


<HTML>
<HEAD>
<SCRIPT src='/htdocs/cmn/js/cmnJs.js'>
</SCRIPT>

    <SCRIPT language=javascript>

        function funcLocation(command){

        var form  = document.edu;
        var form2 = top.fleMain.lst_frame.document.edu;


            if(command == 'create'){

                form2.method = "post";
                form2.target = "lst_frame";
                form2.action = "./cookie_create.jsp";
                form2.submit();

            }else if(command == 'view'){

                form2.method = "post";
                form2.target = "lst_frame";
                form2.action = "./cookie_view.jsp";
                form2.submit();

            }else {

                alert("시키는거만 하쇼 !!!");

            }

        }

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
                            <tr>
                                <td>PGM NAME : COOKIE TEST</td>
                            </tr>
                            <tr height="10">
                            </tr>
                            <tr>
                                <td>
                                    <a href="javascript:funcLocation('create' );">COOKIE CREATE</a>
                                    <a href="javascript:funcLocation('view' );">COOKIE VIEW</a>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td height="5" colspan="2"></td>
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
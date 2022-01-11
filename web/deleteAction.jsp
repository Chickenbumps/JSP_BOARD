<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-01-11
  Time: 오전 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page"/>
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent"/>
<!DOCTYPE html>
<html>
<head>
    <title>JSP 게시판 웹 사이트</title>
</head>
<body>
    <%
        String userID=null;
        if(session.getAttribute("userID")!=null){
            userID=(String)session.getAttribute("userID");
        }
        int bbsID=1;
        if(request.getParameter("bbsID")!=null){
            bbsID=Integer.parseInt(request.getParameter("bbsID"));
        }
        System.out.println("delete + "+ bbsID);
        if(userID==null){
            PrintWriter script=response.getWriter();
            script.println("<script>");
            script.println("alert('로그인이 필요합니다.')");
            script.println("location.href='login.jsp'");
            script.println("</script>");
        }
        else{
            BbsDAO bbsDAO=new BbsDAO();
            Boolean result = bbsDAO.delete(bbsID);
            if(!result){
                PrintWriter script= response.getWriter();
                script.println("<script>");
                script.println("alert('글 삭제에 실패했습니다.')");
                script.println("history.back()");
                script.println("</script>");
            }
            else{
                PrintWriter script= response.getWriter();
                script.println("<script>");
                script.println("location.href='bbs.jsp'");
                script.println("</script>");
            }
        }
    %>
</body>
</html>

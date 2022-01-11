<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-01-11
  Time: 오후 1:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="reply.ReplyDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="reply" class="reply.Reply" scope="page"/>
<jsp:setProperty name="reply" property="replyContent"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width" initial-scale="1">
    <title>JSP 게시판 웹 사이트</title>
</head>
<body>
<%
    int bbsID = 1;
    if(request.getParameter("bbsID") != null){
        bbsID = Integer.parseInt(request.getParameter("bbsID"));
    }
    String userID=null;
    if(session.getAttribute("userID")!=null){
        userID=(String)session.getAttribute("userID");
    }
    if(userID==null){
        PrintWriter script=response.getWriter();
        script.println("<script>");
        script.println("alert('로그인이 필요합니다.')");
        script.println("location.href='login.jsp'");
        script.println("</script>");
    }
    else{
        if(reply.getReplyContent()==null){
            PrintWriter script= response.getWriter();
            script.println("<script>");
            script.println("alert('제목,게시글 내용이 비어있습니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
        else{
            ReplyDAO replyDAO=new ReplyDAO();
            int result = replyDAO.write(bbsID,reply.getReplyContent(),userID);
            if(result==-1){
                PrintWriter script= response.getWriter();
                script.println("<script>");
                script.println("alert('글쓰기에 실패했습니다.')");
                script.println("history.back()");
                script.println("</script>");
            }
            else{
                PrintWriter script= response.getWriter();
                String url = "view.jsp?bbsID=" + bbsID;
                script.println("<script>");
                script.println("location.href='"+url+"'");
                script.println("</script>");
            }
        }
    }
%>
</body>
</html>
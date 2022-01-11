<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-01-11
  Time: 오후 3:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<html>
<head>
    <title>JSP 게시판 웹 사이트</title>
</head>
<body>
    <%
        String userID = null;
        if(session.getAttribute("userID") != null){
            userID = (String)session.getAttribute("userID");
        }

        int bbsID = 1;
        if(request.getParameter("bbsID") != null){
            bbsID = Integer.parseInt(request.getParameter("bbsID"));
        }
        if(userID==null){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('Failed to update content.')");
            script.println("history.back()");
            script.println("</script>");
        }else{
            BbsDAO bbsDAO = new BbsDAO();
            Boolean result = bbsDAO.update(bbsID,(String)request.getParameter("bbsTitle"),(String)request.getParameter("bbsContent"));
            PrintWriter script = response.getWriter();
            if(!result){
                script.println("<script>");
                script.println("alert('Failed to update content.)");
                script.println("history.back()");
                script.println("</script>");
            }else{
                script.println("<script>");
                script.println("location.href='bbs.jsp'");
                script.println("</script>");
            }
        }

    %>
</body>
</html>

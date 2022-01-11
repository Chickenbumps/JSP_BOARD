<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-01-10
  Time: 오후 2:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>

<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width" initial-scale="1">
    <title>JSP 게시판 웹 사이트</title>
</head>
<body>
    <%
        String userID = null;
        if(session.getAttribute("userID")!=null){
            userID = (String)session.getAttribute("userID");
        }
        if(userID != null){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('Already logged in.')");
            script.println("location.href='main.jsp'");
            script.println("</script>");
        }

        UserDAO userDAO = new UserDAO();
        int result = userDAO.login(user.getUserID(), user.getUserPassword());
        PrintWriter script = response.getWriter();
        if(result == 1){
            session.setAttribute("userID", user.getUserID());
            script.println("<script>");
            script.println("location.href = 'main.jsp'");
            script.println("</script>");
        }else if(result == 0) {
            script.println("<script>");
            script.println("alert('비밀번호가 틀립니다.')");
            script.println("history.back()");
            script.println("</script>");
        }else if(result==-1){
            script.println("<script>");
            script.println("alert('존재하지 않는 아이디입니다.')");
            script.println("history.back()");
            script.println("</script>");
        } else if(result==-2){
            script.println("<script>");
            script.println("alert('데이터베이스 오류가 발생했습니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
    %>
</body>
</html>

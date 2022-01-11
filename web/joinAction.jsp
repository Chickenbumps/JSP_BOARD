<%--
  Created by IntelliJ IDEA.
  user.User: user.User
  Date: 2022-01-10
  Time: 오전 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.User" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%--<jsp:useBean id="user" class="user.User" scope="page"/>--%>
<%

%>
<%--<jsp:setProperty name="user" property="userID"/>--%>
<%--<jsp:setProperty name="user" property="userPassword"/>--%>
<%--<jsp:setProperty name="user" property="userName"/>--%>
<%--<jsp:setProperty name="user" property="userGender"/>--%>
<%--<jsp:setProperty name="user" property="userEmail"/>--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width" initial-scale="1">
    <title>Title</title>
</head>
<body>
    <%
        String userID = null;
        User user = new User();
        user.setUserID((String) request.getParameter("userID"));
        user.setUserEmail((String) request.getParameter("userEmail"));
        user.setUserName((String) request.getParameter("userName"));
        user.setUserPassword((String)request.getParameter("userPassword"));
        user.setUserGender((String)request.getParameter("userGender"));
        System.out.println("ID:"+user.getUserID());
        System.out.println("Email:"+user.getUserEmail());
        System.out.println("Gender:"+user.getUserGender());
        System.out.println("Name:"+user.getUserName());
        System.out.println("pwd:"+user.getUserPassword());
        if(session.getAttribute("userID") != null){
            userID = (String)session.getAttribute("userID");
        }
        if(userID!=null){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('You already logged in.");
            script.println("location.href = 'main.jsp'");
            script.println("</script>");
        }

        if(user.getUserID() == null || user.getUserPassword() == null || user.getUserGender() == null || user.getUserEmail() == null || user.getUserName() == null){
            PrintWriter script = response.getWriter();

            script.println("<script>");
            script.println("alert('DB ERROR.')");
            script.println("history.back()");
            script.println("</script>");
        } else {
            UserDAO userDAO = new UserDAO();
            int result = userDAO.join(user);
            System.out.println(user);
            if(result==1){
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("'Account created.'");
                script.println("location.href = 'main.jsp'");
                script.println("</script>");
            }else if(result == -2){
                PrintWriter script=response.getWriter();
                script.println("<script>");
                script.println("alert('데이터베이스 오류가 발생했습니다.')");
                script.println("history.back()"); // 이전 상황으로 되돌리기
                script.println("</script>");
            }
        }
    %>
</body>
</html>

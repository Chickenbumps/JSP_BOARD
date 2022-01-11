<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-01-10
  Time: 오후 2:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta charset="UTF-8">
    <title>logoutAction</title>
</head>
<body>
    <%
        session.invalidate();
    %>
    <script>
        location.href = "main.jsp";
    </script>
</body>
</html>

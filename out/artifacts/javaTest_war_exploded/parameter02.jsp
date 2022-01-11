<%--
  Created by IntelliJ IDEA.
  user.User: user.User
  Date: 2022-01-06
  Time: 오후 4:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 인코딩
    request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>parameter02.jsp 파라미터값 출력 페이지</title>
</head>
<body>
    이름 : <%= request.getParameter("name")%><br>
    주소 : <%= request.getParameter("address")%><br>
    취미 :
    <%
        // 체크박스는 배열로 처리해야 한다.
        String[] values = request.getParameterValues("hobby");
        if(values != null){
            for(int i = 0; i < values.length; i++) {
    %>
            <%=values[i] %>
    <%
            }
        }
    %>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  user.User: user.User
  Date: 2022-01-06
  Time: 오후 3:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
    <title>parameter01.jsp 파라미터값 입력 페이지</title>
</head>
<body>
    <!-- get 방식을 사용해서 데이터 전송(method= "get") -->
    <form action="parameter02.jsp" method="get">
        이름: <input type="text" name="name" size="10"><br>
        주소: <input type="text" name="address" size="30"><br>
        취미:
            <input type="checkbox" name="hobby" value="game">게임
            <input type="checkbox" name="hobby" value="travel">여행
            <input type="checkbox" name="hobby" value="reading">독서
            <br>
        <input type="submit" value="전송">
    </form>
</body>
</html>

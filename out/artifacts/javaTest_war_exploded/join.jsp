<%--
  Created by IntelliJ IDEA.
  user.User: user.User
  Date: 2022-01-10
  Time: 오전 8:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/bootstrap.css">
    <title>JSP 게시판 웹 사이트</title>
</head>
<body>
    <nav class="navbar navbar-default">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed"
                    data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                    aria-expanded="false">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="main.jsp">JSP 게시판 웹사이트</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav nvabar-nav">
                <li><a href="main.jsp">메인</a></li>
                <li><a href="bbs.jsp">게시판</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle"
                       data-toggle="dropdown" role="button" aria-haspop="true" aria-expanded="false">
                        접속하기 <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="login.jsp">로그인</a></li>
                        <li class="active"><a href="join.jsp">회원가입</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
    <div class="container">
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
            <div class="jumbtron" style="padding-top: 20px;">
                <form method="post" action="joinAction.jsp">
                    <h3 style="text-align: center;">회원가입 화면</h3>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="닉네임" name="userName" maxlength="20">
                    </div>
                    <div class="form-group">
                        <input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="50">
                    </div>

                    <div class="form-group">
                        <label><input type="checkbox" class="form-control" placeholder="성별" name="userGender"
                                      onclick="doOpenCheck(this)" value="남자">남</label>
                        <label><input type="checkbox" class="form-control" placeholder="성별" name="userGender"
                                      onclick="doOpenCheck(this)" value="여자">여</label>
                    </div>
                    <input type="submit" class="btn btn-primary form control" value="회원가입">
                </form>
            </div>
        </div>
        <div class="col-lg-4"></div>
    </div>
    <script>
        function doOpenCheck(chk){
            let obj = document.getElementsByName("userGender");
            for(let i = 0; i < obj.length;i++){
                if(obj[i]!=chk){
                    obj[i].checked = false;
                }
            }
        }
    </script>
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script></body>
</html>

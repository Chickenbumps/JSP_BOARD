<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-01-11
  Time: 오후 4:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="reply.ReplyDAO" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <%
    String userID = null;
    if(session.getAttribute("userID") != null){
        userID = (String)session.getAttribute("userID");
    }
    int bbsID = 0;
    if(request.getParameter("bbsID") != null){
        bbsID = Integer.parseInt(request.getParameter("bbsID"));
    }
    int replyID = 0;
    if(request.getParameter("replyID") != null){
        replyID = Integer.parseInt(request.getParameter("replyID"));
    }

    PrintWriter script = response.getWriter();
    if(userID == null){
        script.println("<script>");
        script.println("alert('Failed to delete reply.')");
        script.println("</script>");
    }else{
        String url = "view.jsp?bbsID="+bbsID;
        ReplyDAO replyDAO = new ReplyDAO();
        replyDAO.delete(replyID);
        script.println("<script>");
        script.println("location.href='"+url+"'");
        script.println("</script>");
    }


  %>
</body>
</html>

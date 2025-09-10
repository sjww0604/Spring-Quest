<%--
  Created by IntelliJ IDEA.
  User: sjww03
  Date: 2025. 9. 10.
  Time: 오후 12:31
  To change this template use File | Settings | File Templates.
  Desc : MVC 점메추 기본 화면입니다.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MVC 점메추</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
    .lunch-btn {
        display: inline-block; padding : 10px 20px; margin: 10px 0; background-color : #4CAF50;
        color: white; border-radius: 5px; font-size: 16px; cursor: pointer; width : 200px;
    }

    .container { max-width:900px; margin:40px auto; padding:24px;
        background: rgba(118, 196, 106, 0.74); border-radius:16px;
        box-shadow:0 10px 24px rgba(0,0,0,.06); }

    h2 {
        margin-top: 15px; margin-bottom: 40px;
    }
    </style>
</head>

<body style=" text-align: center; align-items: center; width: 700px; margin-left: auto; margin-right: auto;">
    <div class="container">
    <h2> 🍱 당신의 점심 메뉴를 추천 해드립니다.</h2>
        <p><a class="lunch-btn" href="${pageContext.request.contextPath}/menu?action=form">점심 메뉴 등록</a></p>
        <p><a class="lunch-btn" href="${pageContext.request.contextPath}/menu?action=list">점심 메뉴 목록 조회</a></p>
        <p><a class="lunch-btn" href="${pageContext.request.contextPath}/menu?action=recommend">랜덤 추천</a></p>
    </div>
</body>
</html>

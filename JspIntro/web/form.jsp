<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang ="ko">

<head>
    <meta charset="UTF-8">
    <title>자기소개 입력</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <style>
        * {box-sizing: border-box;}
        body {
            font-family: 'Noto Sans KR', sans-serif;
            margin: 0; color: black; background: white;
        }

        .intro-container {
            max-width: 900px; margin: 40px auto; padding: 24px;
            background: white; border-radius: 16px;
            box-shadow: 0 10px 24px rgba(0,0,0,0.06);
            text-align: center;
        }
    </style>
</head>
<body>
<div class="intro-container">

<h1> 📝나를 소개합니다. </h1>

    <!-- 기존 Thymeleaf 속성에서 JSP 표준으로 치환 -->
    <form action="${pageContext.request.contextPath}/intro" method="post" accept-charset="UTF-8">
        <label>이름: <input type="text" name="name"/></label><br>
        <label>나이: <input type="number" name="age"></label><br>
        <label>MBTI: <input type="text" name="mbti"></label><br>
        <label>좋아하는 음식: <input type="text" name="foods"></label><br>
    <button type="submit" >제출</button>
    </form>
</div>
</body>
</html>

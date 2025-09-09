<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>결과</title>

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

        .chips { display:inline-block; gap:8px; flex-wrap:wrap; margin:8px 0; }
        .chip { padding:6px 10px; border:1px solid #ddd; border-radius:20px; }
    </style>
</head>
<body>
<div class="intro-container">
    <p><b>${name}</b>님은 <b>${age}</b>살의 <b>${mbti}</b> 성격을 가진 분이며, </p>

    <c:choose>
        <c:when test="${fn:length(foods) > 0}">
            <p>좋아하는 음식은
            <!-- 도전1 ul / li -->
            <ul>
                <c:forEach var="f" items="${foods}">
                    <li>${f}</li>
                </c:forEach>
            </ul>


            <!-- 도전2 칩 스타일 -->

            <div class="chips">
                <c:forEach var="f"  items="${foods}">
                    <span class="chip">${f}</span>
                </c:forEach>
            </div>
            다음과 같습니다.</p>
        </c:when>
        <c:otherwise>
            <p>좋아하는 음식 정보가 없어요.</p>
        </c:otherwise>
    </c:choose>
<a href="${pageContext.request.contextPath}/form.jsp">다시 입력</a>
</div>
</body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: sjww03
  Date: 2025. 9. 10.
  Time: 오후 12:30
  To change this template use File | Settings | File Templates.
  Desc : 점심 메뉴 등록 폼 JSP 화면입니다.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>점심메뉴 등록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container { max-width:900px; margin:40px auto; padding:24px;
            background: rgba(118, 196, 106, 0.74); border-radius:16px;
            box-shadow:0 10px 24px rgba(0,0,0,.06); text-align:center;}
        .btn-submit { margin: 10px 0 auto auto; padding: 12px 18px; border:0; border-radius:5px; cursor:pointer;
            align-items: center;}
        .form-wrap { text-align:left; margin-top:18px; }
        .form-wrap .form-label { font-weight:600; }
        .actions { display:flex; gap:8px; margin-top:14px; }
    </style>
</head>
<body>
    <div class="container" style="width: 500px;">
    <h2>🍱 점심 메뉴 등록 화면</h2>
        <form action="${pageContext.request.contextPath}/menu" method="post">
            <div class="form-wrap">
              <div class="mb-3">
                <label class="form-label" for="name">음식명</label>
                <input id="name" name="name" class="form-control" required>
              </div>

              <div class="mb-3">
                <label class="form-label" for="spice">맵기</label>
                <select id="spice" name="spice" class="form-select">
                  <option value="MILD">순함</option>
                  <option value="NORMAL">보통</option>
                  <option value="HOT">매움</option>
                </select>
              </div>

              <div class="mb-3">
                <label class="form-label" for="price">가격</label>
                <input id="price" name="price" class="form-control" type="number" min="0" required>
              </div>

              <button type="submit" class="btn btn-primary w-100">등록</button>

              <div class="actions">
                <a class="btn btn-outline-light flex-fill" href="${pageContext.request.contextPath}/menu?action=list">메뉴 목록</a>
                <a class="btn btn-outline-dark flex-fill" href="${pageContext.request.contextPath}/menu?action=select">랜덤 추천</a>
              </div>
            </div>
        </form>
</div>
</body>
</html>

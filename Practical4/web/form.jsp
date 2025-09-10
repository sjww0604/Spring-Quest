<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>점메추 등록 폼</title>
    <style>
        * { box-sizing: border-box; }
        body { font-family: 'Helvetica Neue', Arial, sans-serif;
            margin: 0; background:#fafafa; color:#222;
        }

        .container { max-width:900px; margin:40px auto; padding:24px;
            background:#fff; border-radius:16px;
            box-shadow:0 10px 24px rgba(0,0,0,.06); }

        button { padding: 12px 18px; border:0; border-radius:10px; cursor:pointer;
            align-items: center;}

    </style>
</head>
<body>
    <div class="container">
    <h2>🍱 점심 메뉴 등록 폼</h2>
    <form action="${pageContext.request.contextPath}/menu/add" method="post">
        <p>이름: <input name="name" required></p>
        <p>가격: <input name="price" type="number" min="0" step="1000" required></p>
        <p>맵기:
            <select name="spice">
                <option value="MILD">순함</option>
                <option value="NORMAL">보통</option>
                <option value="HOT">매움</option>
            </select>
        </p>
        <p>설명: <br><textarea name="desc" rows="3"cols="40"></textarea> </p>
        <button id="button-submit" type="submit">등록</button>
        <a href="${pageContext.request.contextPath}/menu/list">목록</a>
</form>
    </div>
</body>
</html>

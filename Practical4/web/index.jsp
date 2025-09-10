<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>MVC 패턴 점메추</title>
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
    <div class = "container">
        <h2> 🍱 점메추 MVC </h2>
        <p>
            <a href="${pageContext.request.contextPath}/form.jsp">메뉴 등록</a> |
            <a href="${pageContext.request.contextPath}/list.jsp">메뉴 목록</a>
        </p>
    </div>
</body>
</html>

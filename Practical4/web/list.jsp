<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="practical4.Menu" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>점심메뉴 목록</title>
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
        <h2>등록된 메뉴</h2>
        <%
            List menus = (List) request.getAttribute("menus");
            if(menus == null || menus.isEmpty()) {
        %>
        <div>😭 등록된 점심 메뉴가 아직 없어요! <a href="<%=request.getContextPath()%>/form.jsp">메뉴 등록하러 가기</a></div>
        <% } else {
        %>
            <table border="1" cellpadding="6" cellspacing="0">
                <tr><th>#</th><th>이름</th><th>맵기</th><th>가격</th><th>설명</th></tr>
                <%
                    for (int i = 0; i < menus.size(); i++) {
                        Menu menu = (Menu) menus.get(i);
                %>
                    <tr>
                        <td><%= i + 1 %></td>
                        <td><%= menu.getName() %></td>
                        <td><%= menu.getSpice() %></td>
                        <td><%= menu.getPrice() %></td>
                        <td><%= menu.getDesc()%></td>
                    </tr>
                <%
                    }
                %>
            </table>
        <%
            }
        %>
        <p><a href="<%=request.getContextPath()%>/form.jsp">메뉴 추가</a></p>
    </div>
</body>
</html>


<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, practical4.Menu" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <title>점심메뉴 목록</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container py-4">
  <h2 class="mb-4">🍱 점심메뉴 목록</h2>

  <%
    // 컨트롤러에서 넘겨준 속성들
    List<Menu> menus = (List<Menu>) request.getAttribute("menus");
  %>

  <!-- 메뉴 테이블 -->
  <% if (menus == null || menus.isEmpty()) { %>
  <div class="card mb-3 text-center p-4">
      <div class="mb-2">😢 등록된 점심 메뉴가 아직 없어요!</div>
  </div>
  <% } else { %>
    <div class="table-responsive">
      <table class="table table-striped align-middle">
        <thead class="table-light">
          <tr>
            <th style="width:80px;">#</th>
            <th>이름</th>
            <th style="width:140px;">맵기</th>
            <th style="width:160px;">가격</th>
          </tr>
        </thead>
        <tbody>
        <% for (int i = 0; i < menus.size(); i++) { Menu m = menus.get(i); %>
          <tr>
            <td><%= i + 1 %></td>
            <td><%= m.getName() %></td>
            <td><%= m.getSpice() %></td>
            <td><%= m.getPrice() %>원</td>
          </tr>
        <% } %>
        </tbody>
      </table>
    </div>
  <% } %>

  <div class="mt-4 d-flex gap-2">
    <a class="btn btn-primary" href="<%= request.getContextPath() %>/menu?action=form">메뉴 등록</a>
    <a class="btn btn-success" href="<%= request.getContextPath() %>/menu?action=select">조건 기반 추천</a>
  </div>
</body>
</html>

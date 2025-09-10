<%--
  Created by IntelliJ IDEA.
  User: sjww03
  Date: 2025. 9. 10.
  Time: 오후 12:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="practical4.Menu" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <title>조건 기반 추천</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container py-4">
  <h2 class="mb-4">조건 기반 추천</h2>

  <%
    Menu menu = (Menu) request.getAttribute("menu");
    String emptyMsg = (String) request.getAttribute("emptyMsg");
  %>

  <% if (menu != null) { %>
    <div class="card mb-3 shadow-sm">
      <div class="card-body d-flex justify-content-between align-items-center">
        <div>
          <h5 class="card-title mb-1">오늘의 추천</h5>
          <div class="card-text">
            <strong><%= menu.getName() %></strong>
            <span class="ms-2 text-muted">(맵기: <%= menu.getSpice() %> / 가격: <%= menu.getPrice() %>원)</span>
          </div>
        </div>
        <a class="btn btn-outline-primary btn-sm" href="<%= request.getContextPath() %>/menu?action=select">다시 선택</a>
      </div>
    </div>
  <% } else if (emptyMsg != null) { %>
    <div class="card mb-3 text-center p-4">
      <div class="mb-2">😢 <%= emptyMsg %></div>
      <a class="btn btn-success" href="<%= request.getContextPath() %>/menu?action=form">메뉴 등록하러 가기</a>
    </div>
  <% } %>

  <form action="<%= request.getContextPath() %>/menu?action=recommend" method="post" class="row g-3">
    <div class="col-12 col-md-4">
      <label class="form-label" for="basis">기준</label>
      <select id="basis" name="basis" class="form-select" required>
        <option value="" disabled selected>-- 선택 --</option>
        <option value="price">가격</option>
        <option value="spice">맵기</option>
      </select>
    </div>

    <div class="col-12 col-md-4">
      <label class="form-label" for="detail">세부</label>
      <select id="detail" name="detail" class="form-select" required disabled>
        <option value="" disabled selected>먼저 기준을 선택하세요</option>
      </select>
    </div>

    <div class="col-12 col-md-4 align-self-end">
      <button type="submit" class="btn btn-primary w-100">추천 받기</button>
    </div>
  </form>

  <div class="mt-4 d-flex gap-2">
    <a class="btn btn-outline-secondary" href="<%= request.getContextPath() %>/menu?action=list">목록</a>
    <a class="btn btn-outline-dark" href="<%= request.getContextPath() %>/menu?action=form">등록</a>
  </div>

  <script>
  document.addEventListener('DOMContentLoaded', () => {
    const basis = document.getElementById('basis');
    const detail = document.getElementById('detail');
    const options = {
      price: [
        {v:'P0_10',  t:'0~10,000원'},
        {v:'P10_30', t:'10,000~30,000원'},
        {v:'P30_50', t:'30,000~50,000원'},
        {v:'P50_UP', t:'50,000원 이상'}
      ],
      spice: [
        {v:'MILD',   t:'순함'},
        {v:'NORMAL', t:'보통'},
        {v:'HOT',    t:'매움'}
      ]
    };
    basis.addEventListener('change', () => {
      const list = options[basis.value] || [];
      detail.innerHTML = '';
      if (list.length === 0) {
        detail.disabled = true;
        const opt = document.createElement('option');
        opt.value=''; opt.textContent='해당 옵션이 없습니다';
        opt.disabled = true; opt.selected = true;
        detail.appendChild(opt);
        return;
      }
      list.forEach(o => {
        const opt = document.createElement('option');
        opt.value = o.v; opt.textContent = o.t;
        detail.appendChild(opt);
      });
      detail.disabled = false;
    });
  });
  </script>
</body>
</html>

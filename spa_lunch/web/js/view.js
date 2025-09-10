// view.js - 화면에 메뉴 목록 그리기

// 목록 렌더링
export function renderList(menus) {
    const tbody = document.querySelector("#rows");
    if (!tbody) return;

    // 데이터가 없을 때
    if (menus.length === 0) {
        tbody.innerHTML = `<tr><td colspan="4">등록된 메뉴가 없습니다.</td></tr>`;
        return;
    }

    // 데이터가 있을 때
    tbody.innerHTML = menus.map(m => `
    <tr>
      <td>${m.name}</td>
      <td>${m.spicy}</td>
      <td style="text-align:right;">${m.price.toLocaleString()}원</td>
      <td style="text-align:center;">
        <button data-action="edit" data-id="${m.id}">수정</button>
        <button data-action="del" data-id="${m.id}">삭제</button>
      </td>
    </tr>
  `).join("");
}
// model.js - 메뉴 데이터 관리 (localStorage)

const KEY = "menus";

// 메뉴 목록 불러오기
export function readMenus() {
    return JSON.parse(localStorage.getItem(KEY) || "[]");
}

// 메뉴 목록 저장하기
export function writeMenus(list) {
    localStorage.setItem(KEY, JSON.stringify(list));
}

// 메뉴 추가
export function addMenu(menu) {
    const list = readMenus();
    // id, createdAt 같은 값은 여기서 생성
    menu.id = Date.now().toString();
    menu.createdAt = Date.now();
    list.push(menu);
    writeMenus(list);
}

// 메뉴 삭제
export function removeMenu(id) {
    const list = readMenus().filter(m => m.id !== id);
    writeMenus(list);
}

// 메뉴 수정 (선택)
export function updateMenu(id, patch) {
    const list = readMenus();
    const i = list.findIndex(m => m.id === id);
    if (i >= 0) {
        list[i] = { ...list[i], ...patch };
        writeMenus(list);
    }
}
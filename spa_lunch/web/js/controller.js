// controller.js — 최소: 해시 라우팅 + 등록/수정/삭제
import { readMenus, addMenu, removeMenu, updateMenu } from "./model.js";
import { renderList } from "./view.js";

let editingId = null; // 수정 중이면 id 저장

// 섹션 보이기/숨기기 (display만 사용)
function show(selector) {
    document.querySelectorAll("section.view").forEach(s => s.style.display = "none");
    const el = document.querySelector(selector);
    if (el) el.style.display = "block";
}

// 라우팅 (해시값에 따라 화면 전환)
function onRoute() {
    const hash = (location.hash || "#register").toLowerCase();  // ← 기본: 등록 화면
    if (hash === "#register") {
        show("#register-view");
        // 수정 모드면 값 채우기, 아니면 폼 초기화
        const form = document.querySelector("#form");
        if (editingId) {
            const item = readMenus().find(m => m.id === editingId);
            if (item) {
                form.name.value  = item.name;
                form.spicy.value = item.spicy;
                form.price.value = item.price;
            }
        } else {
            form?.reset();
        }
    } else {
        show("#list-view");
        renderList(applyFilter(readMenus()));    }
}

// ★ 필터 상태
const filterState = { spicy: "", priceBand: "" };

// ★ 가격대 판별
function inBand(price, band) {
    if (!band) return true;
    if (band === "low")  return price <= 10000;
    if (band === "mid")  return price >= 10000 && price <= 30000;
    if (band === "high") return price >= 30000 && price <= 50000;
    if (band === "very high") return price > 50000;
    return true;
}

// ★ 리스트에 필터 적용
function applyFilter(list) {
    return list.filter(m =>
        (!filterState.spicy || m.spicy === filterState.spicy) &&
        inBand(Number(m.price), filterState.priceBand)
    );
}

window.addEventListener("DOMContentLoaded", () => {
    // ★ 필터 변경 이벤트
    const $spicyFilter = document.querySelector("#filter-spicy");
    const $bandFilter  = document.querySelector("#filter-priceband");

    $spicyFilter?.addEventListener("change", () => {
        filterState.spicy = $spicyFilter.value;
        renderList(applyFilter(readMenus()));
    });

    $bandFilter?.addEventListener("change", () => {
        filterState.priceBand = $bandFilter.value;
        renderList(applyFilter(readMenus()));
    });
    // 폼 제출: 등록 또는 수정
    const form = document.querySelector("#form");
    form?.addEventListener("submit", (e) => {
        e.preventDefault();
        const name  = form.name.value.trim();
        const spicy = form.spicy.value;
        const price = Number(form.price.value);
        if (!name || Number.isNaN(price) || price < 0) {
            alert("입력값을 확인하세요.");
            return;
        }
        if (editingId) {
            updateMenu(editingId, { name, spicy, price });
            editingId = null;
        } else {
            addMenu({ name, spicy, price });
        }
        form.reset();
        location.hash = "#list";          // 완료 후 목록으로 이동
    });

    // 목록에서 수정/삭제 (이벤트 위임)
    document.querySelector("#list-view")?.addEventListener("click", (e) => {
        const btn = e.target.closest("button[data-action]");
        if (!btn) return;
        const { action, id } = btn.dataset;

        if (action === "edit") {
            editingId = id;                 // 수정 모드로 전환
            location.hash = "#register";
        }
        if (action === "del") {
            if (confirm("삭제할까요?")) {
                removeMenu(id);
                renderList(readMenus());
            }
        }
    });

    // 초기 진입: 등록 화면(요구사항대로)
    if (!location.hash) location.hash = "#register";
    onRoute();
    window.addEventListener("hashchange", onRoute);
});
package practical4;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/menu")
public class MenuController extends HttpServlet {
    private MenuService service = new MenuService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println("[GET] /menu action=" + action);

        // 1) 등록 폼
        if ("form".equals(action)) {
            System.out.println("[ROUTE] forward -> /form.jsp");
            request.getRequestDispatcher("/form.jsp").forward(request, response);
            return;
        }

        // 2) 조건 선택 화면
        if ("select".equals(action)) {
            System.out.println("[ROUTE] forward -> /select.jsp");
            request.getRequestDispatcher("/select.jsp").forward(request, response);
            return;
        }

        // 3) 기본: 목록 화면
        request.setAttribute("menus", service.getMenuList());
        System.out.println("[ROUTE] forward -> /list.jsp (size=" + (service.getMenuList() == null ? 0 : service.getMenuList().size()) + ")");
        request.getRequestDispatcher("/list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        // 조건 추천 처리: POST /menu?action=recommend
        if ("recommend".equals(action)) {
            String basis = request.getParameter("basis");   // price | spice
            String detail = request.getParameter("detail"); // P0_10.. | MILD/NORMAL/HOT

            java.util.List<Menu> all = service.getMenuList();
            java.util.List<Menu> candidates = new java.util.ArrayList<Menu>();
            if ("price".equals(basis)) {
                int min = 0, max = Integer.MAX_VALUE;
                if ("P0_10".equals(detail)) { min = 0; max = 10000; }
                else if ("P10_30".equals(detail)) { min = 10000; max = 30000; }
                else if ("P30_50".equals(detail)) { min = 30000; max = 50000; }
                else if ("P50_UP".equals(detail)) { min = 50000; max = Integer.MAX_VALUE; }
                for (Menu m : all) if (m.getPrice() >= min && m.getPrice() < max) candidates.add(m);
            } else if ("spice".equals(basis)) {
                for (Menu m : all) if (detail != null && detail.equals(m.getSpice())) candidates.add(m);
            }

            Menu picked = null;
            if (!candidates.isEmpty()) {
                picked = candidates.get(new java.util.Random().nextInt(candidates.size()));
            }

            if (picked != null) request.setAttribute("menu", picked);
            else request.setAttribute("emptyMsg", "조건에 맞는 메뉴가 없어요. 먼저 등록해 주세요!");

            request.getRequestDispatcher("/select.jsp").forward(request, response);
            return;
        }

        // 기본: 등록 처리 (POST /menu)
        String name  = request.getParameter("name");
        String spice = request.getParameter("spice");
        int price    = Integer.parseInt(request.getParameter("price"));

        service.addMenu(new Menu(name, spice, price));
        response.sendRedirect(request.getContextPath() + "/menu?action=list");
    }
}


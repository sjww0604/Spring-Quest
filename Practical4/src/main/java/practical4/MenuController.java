package practical4;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="menuController", urlPatterns = "/menu/*")
public class MenuController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String path = req.getPathInfo();              // "/form" | "/list" | null
        if (path == null || "/".equals(path)) {
            req.getRequestDispatcher("/index.jsp").forward(req, res);
            return;
        }
        switch (path) {
            case "/form":
                req.getRequestDispatcher("/form.jsp").forward(req, res);
                break;
            case "/list":
                req.setAttribute("menus", MenuService.findAll());   // ✅ 핵심
                req.getRequestDispatcher("/list.jsp").forward(req, res);
                break;
            default:
                res.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String path = req.getPathInfo();

        if ("/add".equals(path)) {
            String name  = req.getParameter("name");
            int    price = Integer.parseInt(req.getParameter("price"));
            String spice = req.getParameter("spice");
            String desc  = req.getParameter("desc");

            MenuService.add(new Menu(name, price, spice, desc == null ? "" : desc));

            // ✅ PRG 패턴
            res.sendRedirect(req.getContextPath() + "/menu/list");
            return;
        }
        res.sendError(HttpServletResponse.SC_NOT_FOUND);
    }
}

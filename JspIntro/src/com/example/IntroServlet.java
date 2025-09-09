package com.example;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;

@WebServlet("/intro")
public class IntroServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String name = req.getParameter("name");
        String age = req.getParameter("age");
        String mbti = req.getParameter("mbti");
        String foodsParam = req.getParameter("foods");

        String[] foods = (foodsParam == null ? new String[0]
                : Arrays.stream(foodsParam.split(","))
                    .map(String::trim)
                    .filter(s -> !s.isEmpty())
                .toArray(String[]::new));

        req.setAttribute("name", name);
        req.setAttribute("age", age);
        req.setAttribute("mbti", mbti);
        req.setAttribute("foods", foods);

        RequestDispatcher rd = req.getRequestDispatcher("/result.jsp");
        rd.forward(req, res);
    }

}

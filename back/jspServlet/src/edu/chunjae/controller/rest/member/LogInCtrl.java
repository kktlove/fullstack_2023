package edu.chunjae.controller.rest.member;

import com.google.gson.Gson;
import edu.chunjae.model.CustomDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/member/login")
public class LogInCtrl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        //CORS(Cross Origin Resource Sharing) 해제
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Credentials", "true");

        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String msg = "로그인 메시지";

        CustomDAO dao = new CustomDAO();
        boolean pass = false;
        try {
            pass = dao.login(id, pw);
        } catch (Exception e){
            System.out.println(e.getMessage());
        }

        String gson = new Gson().toJson(pass);
        PrintWriter out = response.getWriter();
        out.println(gson);
    }
}

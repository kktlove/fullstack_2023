package edu.chunjae.controller.rest.member;

import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/member/logout")
public class LogOutCtrl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.invalidate();

        String data;

        if(session!=null){
            data = "fail";
        } else {
            data = "ok";
        }

        String gson = new Gson().toJson(data);
        PrintWriter out = response.getWriter();
        out.println(gson);
    }
}

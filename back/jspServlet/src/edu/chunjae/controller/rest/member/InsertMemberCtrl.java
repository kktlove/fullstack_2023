package edu.chunjae.controller.rest.member;

import com.google.gson.Gson;
import edu.chunjae.dto.Custom;
import edu.chunjae.model.CustomDAO;
import edu.chunjae.util.AES256;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/member/insertMember")
public class InsertMemberCtrl  extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        //CORS(Cross Origin Resource Sharing) 해제
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Credentials", "true");

        Custom cus = new Custom();

        cus.setId(request.getParameter("id"));

        String pw = request.getParameter("pw");

        String key = "%02x";
        String encrypted = "";
        try {
            encrypted = AES256.encryptAES256(pw, key);
            System.out.println("비밀번호 암호화 : "+encrypted);
        } catch (Exception e) {
            e.printStackTrace();
        }

        cus.setPw(encrypted);
        cus.setName(request.getParameter("name"));
        cus.setTel(request.getParameter("tel"));
        cus.setEmail(request.getParameter("email"));
        cus.setBirth(request.getParameter("birth"));

        CustomDAO dao = new CustomDAO();
        int n = dao.addCustom(cus);

        String data = "fail";

        if(n>=1){
            data = "ok";
        }

        String gson = new Gson().toJson(data);
        PrintWriter out = response.getWriter();
        out.println(gson);
    }
}

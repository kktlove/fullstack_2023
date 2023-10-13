package edu.chunjae.controller.rest.member;

import com.google.gson.Gson;
import edu.chunjae.dto.Custom;
import edu.chunjae.model.CustomDAO;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/member/getMemberList")
public class GetMemberListCtrl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        //CORS(Cross Origin Resource Sharing) 해제
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Credentials", "true");

        CustomDAO dao = new CustomDAO();
        List<Custom> data = dao.getCustomList();
        for(Custom cus:data){
            System.out.println(cus.toString());
        }
        String gson = new Gson().toJson(data);
        PrintWriter out = response.getWriter();
        out.println(gson);
    }
}

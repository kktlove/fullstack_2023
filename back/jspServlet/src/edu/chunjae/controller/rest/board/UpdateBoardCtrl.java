package edu.chunjae.controller.rest.board;

import com.google.gson.Gson;
import edu.chunjae.dto.Notice;
import edu.chunjae.model.NoticeDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/board/updateBoard")
public class UpdateBoardCtrl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        //CORS(Cross Origin Resource Sharing) 해제
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Credentials", "true");

        int no = Integer.parseInt(request.getParameter("no"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        Notice noti = new Notice();
        noti.setNo(no);
        noti.setTitle(title);
        noti.setContent(content);

        NoticeDAO dao = new NoticeDAO();
        int n = dao.updateNotice(noti);

        String data = "fail";

        if(n>=1){
            data = "ok";
        }

        String gson = new Gson().toJson(data);
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        out.println("<script>history.go(-2); location.reload();</script>");
        //out.println(gson);

    }
}


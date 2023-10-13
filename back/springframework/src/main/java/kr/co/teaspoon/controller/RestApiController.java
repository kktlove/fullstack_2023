package kr.co.teaspoon.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.teaspoon.dto.Board;
import kr.co.teaspoon.dto.Member;
import kr.co.teaspoon.service.BoardService;
import kr.co.teaspoon.service.MemberService;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class RestApiController {

    @Autowired
    private BoardService boardService;

    @Autowired
    private MemberService memberService;

    @Autowired
    HttpSession session;

    BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();

    @ResponseBody
    @GetMapping("/board/getBoardList")
    public List<Board> getBoardList() throws Exception {
        List<Board> boardList = boardService.boardList();
        return boardList;
    }

    @ResponseBody
    @GetMapping("/board/getBoard/{no}")
    public Board getBoard(@PathVariable("no") int no) throws Exception {
        Board board = boardService.boardDetail(no);
        return board;
    }

    @ResponseBody
    @PostMapping("/board/insertBoard")
    public String insertBoard(@RequestBody Board board) {
        try {
            boardService.boardInsert(board);
            return "ok";
        } catch(Exception e){
            return "fail";
        }
    }

    @ResponseBody
    @PostMapping("/board/updateBoard")
    public String updateBoard(@RequestBody Board board) {
        try {
            boardService.boardEdit(board);
            return "ok";
        } catch(Exception e){
            return "fail";
        }
    }

    @ResponseBody
    @PostMapping("/board/deleteBoard")
    public String deleteBoard(@RequestParam("seq") int seq) {
        try {
            boardService.boardDelete(seq);
            return "ok";
        } catch(Exception e){
            return "fail";
        }
    }

    @ResponseBody
    @GetMapping("/member/getMemberList")
    public List<Member> getMemberList() throws Exception {
        List<Member> memberList = memberService.memberList();
        return memberList;
    }

    @ResponseBody
    @GetMapping("/member/getMember/{id}")
    public Member getMember(@PathVariable("id") String id) throws Exception {
        Member member = memberService.getMember(id);
        return member;
    }

    @ResponseBody
    @PostMapping("/member/insertMember")
    public String insertMember(Member member) {
        String ppw = member.getPw();
        String pw = pwEncoder.encode(ppw);
        member.setPw(pw);
        try {
            memberService.memberInsert(member);
            return "ok";
        } catch(Exception e){
            return "fail";
        }
    }

    @ResponseBody
    @PostMapping("/member/updateMember")
    public String updateMember(Member mem) {
        String pwd = "";
        if(mem.getPw().length()<=16) {
            pwd = pwEncoder.encode(mem.getPw());
            mem.setPw(pwd);
        }
        try {
            memberService.memberEdit(mem);
            return "ok";
        } catch(Exception e){
            return "fail";
        }
    }

    @ResponseBody
    @PostMapping("/member/deleteMember")
    public String deleteMember(@RequestParam("id") String id) {
        try {
            memberService.memberDelete(id);
            return "ok";
        } catch(Exception e){
            return "fail";
        }
    }

    //회원 가입 - Ajax로 아이디 중복 체크
    @ResponseBody
    @RequestMapping(value="/member/idCheck", method=RequestMethod.POST)
    public boolean idCheck(HttpServletResponse response, HttpServletRequest request, org.springframework.ui.Model model) throws Exception {
        String id = request.getParameter("id");
        Member mem = memberService.getMember(id);
        boolean result = false;
        if(mem!=null){
            result = false;
        } else {
            result = true;
        }
        return result;
    }

    //로그인을 컨트롤러에서 처리
    @ResponseBody
    @PostMapping("/member/signin")
    public String memberSignIn(@RequestParam String id, @RequestParam String pw, Model model) throws Exception {
        Member mem = memberService.signIn(id);
        if(mem!=null){
            boolean loginSuccess = pwEncoder.matches(pw, mem.getPw());
            if(loginSuccess){
                session.setAttribute("member", mem);
                session.setAttribute("sid", id);
                return "ko";
            } else {
                return "fail";
            }
        } else {
            return "fail";
        }
    }

    //서비스에서 로그인 로직 처리
    @ResponseBody
    @RequestMapping(value = "/member/login", method = RequestMethod.POST)
    public String memberLogin(@RequestParam String id, @RequestParam String pw, Model model) throws Exception {
        boolean ps = memberService.loginCheck(id, pw);
        if(ps){
            session.setAttribute("sid", id);
            return "ok";
        } else {
            return "fail";
        }
    }
    //로그아웃
    @GetMapping("/member/logout")
    @ResponseBody
    public String memberLogout(HttpSession session) throws Exception {
        session.invalidate();
        if(session!=null){
            return "fail";
        } else {
            return "ok";
        }
    }
}

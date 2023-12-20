package com.edutech.controller;

import com.edutech.dto.BoardDTO;
import com.edutech.service.BoardService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequiredArgsConstructor
@CrossOrigin("*")
@Slf4j
public class BoardController {

    private final BoardService boardService;

    @GetMapping("/api/list")
    @ResponseBody
    public List<BoardDTO> listAll(){
        List<BoardDTO> boardList = boardService.findAll();
        return boardList;
    }

    @GetMapping("/api/read")
    @ResponseBody
    public BoardDTO findByBno(Integer bno){
        BoardDTO board = boardService.findByBno(bno);
        return board;
    }

    @PostMapping("/api/register")
    public String apiboardWrite(@Valid BoardDTO boardDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes, HttpServletRequest request) {
        log.info("board POST register.......");
        if(bindingResult.hasErrors()) {
            log.info("has errors.......");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors() );
        }
        Integer bno  = boardService.register(boardDTO);
        String referer = request.getHeader("Referer");
        return "redirect:"+ referer;
    }

    @PostMapping("/api/modify")
    public String modifyPro(BoardDTO boardDTO,
                             BindingResult bindingResult,
                             RedirectAttributes redirectAttributes,
                             HttpServletRequest request){
        log.info("board modify post......." + boardDTO);
        String referer = request.getHeader("Referer");
        if(bindingResult.hasErrors()) {
            log.info("has errors.......");
            String link = "bno="+boardDTO.getBno();
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors() );
            redirectAttributes.addAttribute("bno", boardDTO.getBno());
            return "redirect:"+ referer;
        }
        boardService.modify(boardDTO);
        redirectAttributes.addFlashAttribute("result", "modified");
        redirectAttributes.addAttribute("bno", boardDTO.getBno());
        return "redirect:"+ referer;
    }

    @GetMapping("/api/remove")
    public String remove(Integer bno, RedirectAttributes redirectAttributes, HttpServletRequest request) {
        log.info("remove post.. " + bno);
        boardService.remove(bno);
        redirectAttributes.addFlashAttribute("result", "removed");
        String referer = request.getHeader("Referer");
        return "redirect:"+ referer;
    }

    @GetMapping({"/board", "/board/list"})
    public String boardListAll(Model model){
        List<BoardDTO> boardList = boardService.findAll();
        model.addAttribute("boardList", boardList);
        return "board/list";
    }

    @PreAuthorize("hasAnyRole('USER','ADMIN','TEACHER')")
    @GetMapping("/board/read")
    public String boardFindByBno(Integer bno, Model model){
        BoardDTO board = boardService.findByBno(bno);
        model.addAttribute("dto", board);
        return "board/read";
    }

    @GetMapping("/board/write")
    public String boardForm(){
        return "board/write";
    }

    @PostMapping("/board/register")
    public String boardWrite(@Valid BoardDTO boardDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes){
        log.info("board POST register.......");
        if(bindingResult.hasErrors()) {
            log.info("has errors.......");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors() );
        }
        Integer bno  = boardService.register(boardDTO);
        return "redirect:/board/list";
    }

    @GetMapping("/board/modify")
    public String boardModify(Integer bno, Model model){
        BoardDTO boardDTO = boardService.findByBno(bno);
        model.addAttribute("dto", boardDTO);
        return "board/modify";
    }

    @PostMapping("/board/modify")
    public BoardDTO boardModifyPro(@Valid BoardDTO boardDTO,
                              BindingResult bindingResult,
                              RedirectAttributes redirectAttributes){
        log.info("board modify post......." + boardDTO);
        if(bindingResult.hasErrors()) {
            log.info("has errors.......");
            String link = "bno="+boardDTO.getBno();
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors() );
            redirectAttributes.addAttribute("bno", boardDTO.getBno());
            return boardDTO;
        }
        boardService.modify(boardDTO);
        redirectAttributes.addFlashAttribute("result", "modified");
        redirectAttributes.addAttribute("bno", boardDTO.getBno());
        return boardDTO;
    }

    @PostMapping("/board/remove")
    public String boardRemove(Integer bno, RedirectAttributes redirectAttributes) {
        log.info("remove post.. " + bno);
        boardService.remove(bno);
        redirectAttributes.addFlashAttribute("result", "removed");
        return "redirect:/board/list";
    }
}

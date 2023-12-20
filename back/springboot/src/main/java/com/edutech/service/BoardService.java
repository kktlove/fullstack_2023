package com.edutech.service;

import com.edutech.dto.BoardDTO;
import com.edutech.entity.Board;

import java.util.List;
import java.util.Optional;

public interface BoardService {
    public BoardDTO findByBno(Integer bno);
    public List<BoardDTO> findAll();
    public Integer register(BoardDTO boardDTO);
    public void modify(BoardDTO boardDTO);
    public void remove(Integer bno);
}

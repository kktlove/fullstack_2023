package com.edutech.service;

import com.edutech.dto.BoardDTO;
import com.edutech.entity.Board;
import com.edutech.repository.BoardRepository;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional
public class BoardServiceImpl implements BoardService {

    private final BoardRepository boardRepository;

    private final ModelMapper modelMapper;

    @Override
    public BoardDTO findByBno(Integer bno) {
        Optional<Board> result = boardRepository.findById(bno);
        BoardDTO dto = modelMapper.map(result, BoardDTO.class);
        return dto;
    }

    @Override
    public List<BoardDTO> findAll() { //board -> BoardDTO.class 끝까지 반복
        List<Board> lst = boardRepository.findAll();
        List<BoardDTO> boardList = lst.stream().map(board
                -> modelMapper.map(board, BoardDTO.class))
                .collect(Collectors.toList());
        return boardList;
    }

    @Override
    public Integer register(BoardDTO boardDTO) {
        Board board = modelMapper.map(boardDTO, Board.class);
        Integer bno = boardRepository.save(board).getBno();
        return bno;
    }

    @Override
    public void modify(BoardDTO boardDTO) {
        Optional<Board> result = boardRepository.findById(boardDTO.getBno());
        Board board = result.orElseThrow();
        board.change(boardDTO.getBno(), boardDTO.getTitle(), boardDTO.getContent());
        boardRepository.save(board);
    }

    @Override
    public void remove(Integer bno) {
        boardRepository.deleteById(bno);
    }
}

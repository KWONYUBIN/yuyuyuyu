package com.example.prjjsp20241029.service;

import com.example.prjjsp20241029.dto.Board;
import com.example.prjjsp20241029.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
public class BoardService {

    private final BoardMapper mapper;

    public void add(Board board) {
        mapper.insert(board);
    }

    public List<Board> list() {
        List<Board> list = mapper.selectAll();
        return list;
    }

    public Board get(Integer id) {
        return mapper.selectById(id);
    }
}

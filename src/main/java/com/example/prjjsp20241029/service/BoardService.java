package com.example.prjjsp20241029.service;

import com.example.prjjsp20241029.dto.Board;
import com.example.prjjsp20241029.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Service
@Transactional
@RequiredArgsConstructor
public class BoardService {

    private final BoardMapper mapper;

    public void add(Board board) {
        mapper.insert(board);
    }

    public Map<String, Object> list(Integer page) {
        // 한 페이지에 10개

        Integer offset = (page - 1) * 10;

//        List<Board> list = mapper.selectAll();
        List<Board> list = mapper.selectAllPaging(offset);

        // Controller 에게 넘겨 줄 정보들을 담은 map
        // list, Integer 등 여러개가 담겨서 모든거의 상위타입인 Object 을 사용
        Map<String, Object> map = new HashMap<>();

        // 페이지 관련 정보들
        Integer countAll = mapper.countAll();
        Integer lastPageNumber = (countAll -1) / 10 + 1; // 마지막 페이지 번호(int 연산)
        Integer rightPageNumber = ((page - 1) / 10 + 1) * 10; // 현재페이지 기준 오른쪽 끝 페이지 번호
        Integer leftPageNumber = rightPageNumber - 9; // 현재페이지 기준 왼쪽 끝 페이지 번호
        Integer nextPageNumber = rightPageNumber + 1; // 다음 버튼 클릭시 이동하는 페이지
        Integer prevPageNumber = leftPageNumber - 1; // 이전 버튼 클릭시 이동하는 페이지

        Boolean hasNextPage = nextPageNumber < lastPageNumber; // 다음 버튼 유무
        Boolean hasPrevPage = prevPageNumber > 0; // 이전 버튼 유무

        // 오른쪽 끝 페이지는 마지막 페이지보다 클 수 없음
        rightPageNumber = Math.min(rightPageNumber, lastPageNumber);

        Map<String, Object> pageInfo = new HashMap<>();

        pageInfo.put("hasNextPage", hasNextPage);
        pageInfo.put("hasPrevPage", hasPrevPage);
        pageInfo.put("nextPageNumber", nextPageNumber);
        pageInfo.put("prevPageNumber", prevPageNumber);
        pageInfo.put("leftPageNumber", leftPageNumber);
        pageInfo.put("rightPageNumber", rightPageNumber);
        pageInfo.put("lastPageNumber", lastPageNumber);
        pageInfo.put("currentPageNumber", page);  // 현재 페이지 정보


        map.put("pageInfo", pageInfo);
        map.put("boardList", list);

        return map;
    }

    public Board get(Integer id) {
        return mapper.selectById(id);
    }

    public void remove(Integer id) {
         mapper.deleteById(id);
    }

    public void update(Board board) {
        mapper.update(board);
    }
}

// 실제 일은 Service 에서 함
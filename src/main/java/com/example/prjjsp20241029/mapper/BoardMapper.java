package com.example.prjjsp20241029.mapper;

import com.example.prjjsp20241029.dto.Board;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface BoardMapper {

    @Insert("""
            INSERT INTO board
            (title, content, writer)
            VALUES (#{title}, #{content}, #{writer})
            """)
    @Options(useGeneratedKeys = true, keyProperty = "id")
        // new 에 id가 없으니까 redirect 를 해도 값을 못 받아서 옵션을 추가함
    int insert(Board board);

    @Select("""
            SELECT * 
            FROM board
            ORDER BY id DESC
            """)
    List<Board> selectAll();

    @Select("""
            SELECT *
            FROM board
            WHERE id = #{id}
            """)
    Board selectById(Integer id);

    @Delete("""
            DELETE FROM board
            WHERE id = #{id}
            """)
    int deleteById(Integer id);

    @Update("""
            UPDATE board
            SET title=#{title}, 
                content=#{content}, 
                writer=#{writer}
            WHERE id = #{id}
            """)
    int update(Board board);

    @Select("""
            SELECT *
            FROM board
            ORDER BY id DESC
            LIMIT #{offset}, 10
            """)
    List<Board> selectAllPaging(Integer offset);
}

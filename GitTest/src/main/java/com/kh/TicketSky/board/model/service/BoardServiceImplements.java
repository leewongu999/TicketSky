package com.kh.TicketSky.board.model.service;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.TicketSky.board.model.dao.BoardDAO;
import com.kh.TicketSky.board.model.vo.Board;
import java.util.*;

@Service
public class BoardServiceImplements implements BoardService {
	@Autowired
	private BoardDAO dao;
	@Autowired
	private SqlSessionTemplate sst;
	
	@Override
	public List<Board> selectList(int cPage, int numPerPage) {
		return dao.selectList(sst, cPage, numPerPage);
	}
	@Override
	public int selectTotalContents() {
		return dao.selectTotalContents(sst);
	}
	@Override
	public int insertBoard(Board b) {
		return dao.insertBoard(sst, b);
	}
	@Override
	public int updateBoard(Board b) {
		return dao.updateBoard(sst, b);
	}
	@Override
	public int deleteBoard(Board b) {
		return dao.deleteBoard(sst, b);
	}
	@Override
	public Board selectOne(int boardNo) {
		return dao.selectOne(sst, boardNo);
	}
	@Override
	public int addVisits(Board b) {
		return dao.addVisits(sst, b);
	}
	@Override
	public List<Map<String,Object>> selectSearch(Map<String,Object> map){
		return dao.selectSearch(sst, map);
	}
	@Override
	public int selectSearchTotalContents(Map<String,Object> map) {
		return dao.selectSearchTotalContents(sst, map);
	}
}

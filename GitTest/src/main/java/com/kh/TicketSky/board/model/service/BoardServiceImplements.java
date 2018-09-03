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
	public List<Map<String, String>> selectList() {
		return dao.selectList(sst);
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
	public int updateBoard() {
		return dao.updateBoard(sst);
	}

	@Override
	public int deleteBoard() {
		return dao.deleteBoard(sst);
	}

	@Override
	public Board selectBoard(int boardNo) {
		return dao.selectBoard(sst, boardNo);
	}
}

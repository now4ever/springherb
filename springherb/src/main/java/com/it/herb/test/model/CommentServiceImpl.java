package com.it.herb.test.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommentServiceImpl implements CommentService{
	private final CommentDAO commentDao;
	
	@Override
	public int insertCmt(CommentVO vo) {
		//test¾È³ç
		return commentDao.insertCmt(vo);
	}

	@Override
	public List<CommentVO> selectAll() {
		return commentDao.selectAll();
	}

}

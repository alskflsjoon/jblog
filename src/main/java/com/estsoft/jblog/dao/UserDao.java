package com.estsoft.jblog.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.estsoft.jblog.vo.UserVo;

@Repository
public class UserDao {

	@Autowired
	private SqlSession sqlSession;
	
	public UserVo get(UserVo vo){
		UserVo userVo = null;		
		userVo = sqlSession.selectOne("user.getByVo", vo);
		return userVo;
	}
	
	public UserVo getById(String id){
		UserVo userVo = null;		
		userVo = sqlSession.selectOne("user.getById",id);
		return userVo;
	}
	
	public void insert(UserVo vo){
		sqlSession.insert("user.insert", vo);
	}
	
	public void update(UserVo vo){
		sqlSession.update("user.update", vo);
		
	}
	
	public long idCheck(String id){
		Long num=0L;		
		num = sqlSession.selectOne("user.checkid",id);
		return num;
	}
}

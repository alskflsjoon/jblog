package com.estsoft.jblog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.estsoft.jblog.dao.BlogDao;
import com.estsoft.jblog.dao.CategoryDao;
import com.estsoft.jblog.dao.UserDao;
import com.estsoft.jblog.vo.BlogVo;
import com.estsoft.jblog.vo.CategoryVo;
import com.estsoft.jblog.vo.UserVo;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	@Autowired
	private BlogDao blogDao;
	@Autowired
	private CategoryDao categoryDao;
	
	public void join(UserVo vo){
		userDao.insert(vo);
		BlogVo blogVo = new BlogVo();
		blogVo.setId(vo.getId());
		blogVo.setTitle(vo.getName()+"'s Blog");
		long bNo = blogDao.insert(blogVo);
		CategoryVo cVo = new CategoryVo();
		cVo.setBlogNo(bNo);
		cVo.setTitle("default");
		categoryDao.insert(cVo);
	}
	
	public UserVo login(UserVo vo){
		UserVo authUser = userDao.get(vo);
		return authUser;
	}
	
	public UserVo getUser(String id){
		UserVo vo = userDao.getById(id);
		return vo;
	}
	
	public boolean modify(UserVo vo){
		if(vo.getName().equals("")||vo.getPassword().equals("")){
			return false;
		}
		userDao.update(vo);
		return true;
	}
}

package tmall.servlet;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tmall.bean.User;
import tmall.util.Page;

public class UserServlet  extends BaseBackServlet{

	@Override
	public String list(HttpServletRequest req, HttpServletResponse resp, Page page) {

		List<User> us = userDao.list(page.getStart(), page.getCount());
		page.setTotal(userDao.getTotal());
		
		req.setAttribute("page", page);
		req.setAttribute("us", us);
		return "admin/listUser.jsp";
	}

	@Override
	public String add(HttpServletRequest req, HttpServletResponse resp, Page page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String delete(HttpServletRequest req, HttpServletResponse resp, Page page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String edit(HttpServletRequest req, HttpServletResponse resp, Page page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update(HttpServletRequest req, HttpServletResponse resp, Page page) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}

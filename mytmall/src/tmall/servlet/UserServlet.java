package tmall.servlet;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletreqponse;

import tmall.bean.Category;
import tmall.bean.Property;
import tmall.util.Page;

public class PropertyServlet extends BaseBackServlet {

	@Override
	public String list(HttpServletRequest req, HttpServletreqponse resp, Page page) {
  
		List<User> users = userDao.list(page.getStart(), page.getCount());
    		int total = userDao.getTotal();
    		page.setTotal(total);
    
    		req.setAttribute("page",page);
    		req.setAttribute("users",users);
   		return "admin/listUser.jsp";
	}

	@Override
	public String add(HttpServletRequest req, HttpServletreqponse resp, Page page) {
    		return null;
	}

	@Override
	public String delete(HttpServletRequest req, HttpServletreqponse resp, Page page) {
    		return null;
	}

	@Override
	public String edit(HttpServletRequest req, HttpServletreqponse resp, Page page) {
    		return null;
	}

	@Override
	public String update(HttpServletRequest req, HttpServletreqponse resp, Page page) {
    		return null;
	}
}

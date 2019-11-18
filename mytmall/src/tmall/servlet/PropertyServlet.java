package tmall.servlet;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tmall.bean.Category;
import tmall.bean.Property;
import tmall.util.Page;

public class PropertyServlet extends BaseBackServlet {

	@Override
	public String list(HttpServletRequest request, HttpServletResponse response, Page page) {

		//通过cid拿到category
		int cid = Integer.parseInt(request.getParameter("cid"));
		Category c =  categoryDao.get(cid);
		//获取propertylist
		List<Property> pList = propertyDao.list(cid, page.getStart(), page.getCount());
		//获取property总数分页用
		int total = propertyDao.getTotal(cid);
		page.setTotal(total);
		page.setParam("&cid=" + cid);
		//把参数传到页面
		request.setAttribute("list", pList);
		request.setAttribute("c", c);
		request.setAttribute("page", page);
		//转发返回到jsp页面
		return "admin/listProperty.jsp";
	}

	@Override
	public String add(HttpServletRequest request, HttpServletResponse response, Page page) {

		//获取category
		int cid = Integer.parseInt(request.getParameter("cid"));
		Category c = categoryDao.get(cid);
		//获取prop名
		String name = request.getParameter("name");
		//新建prop对象并赋值
		Property prop = new Property();
		prop.setCategory(c);
		prop.setName(name);
		//调用propdao执行add
		propertyDao.add(prop);
		//返回到proplist
		return "@admin_property_list?cid=" + cid;
	}

	@Override
	public String delete(HttpServletRequest request, HttpServletResponse response, Page page) {

		int id = Integer.parseInt(request.getParameter("id"));
		Property prop = propertyDao.get(id);
		propertyDao.delete(id);

		return "@admin_property_list?cid=" + prop.getCategory().getId();
	}

	@Override
	public String edit(HttpServletRequest request, HttpServletResponse response, Page page) {

		int id = Integer.parseInt(request.getParameter("id"));
		Property prop = propertyDao.get(id);
		request.setAttribute("prop", prop);
		return "admin/editProperty.jsp";
	}

	@Override
	public String update(HttpServletRequest request, HttpServletResponse response, Page page) {

		int cid = Integer.parseInt(request.getParameter("cid"));
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");

		Category cate = categoryDao.get(cid);
		Property prop = new Property();
		prop.setCategory(cate);
		prop.setId(id);
		prop.setName(name);
		propertyDao.update(prop);

		return "@admin_property_list?cid=" + cate.getId();
	}

}

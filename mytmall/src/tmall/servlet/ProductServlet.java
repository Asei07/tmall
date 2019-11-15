package tmall.servlet;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tmall.bean.Category;
import tmall.bean.Product;
import tmall.util.Page;

public class ProductServlet extends BaseBackServlet{

	@Override
	public String list(HttpServletRequest request, HttpServletResponse response, Page page) {

		List<Product> list = new ArrayList();
		int cid = Integer.parseInt(request.getParameter("cid"));
		Category c = categoryDao.get(cid);
		int total = productDao.getTotal(cid);
		page.setParam("&cid=" + cid);
		page.setTotal(total);
		list = productDao.list(cid, page.getStart(), page.getCount());

		request.setAttribute("list", list);
		request.setAttribute("page", page);
		request.setAttribute("c", c);

		return "admin/listProduct.jsp?cid=" + cid;
	}

	@Override
	public String add(HttpServletRequest request, HttpServletResponse response, Page page) {

		int cid = Integer.parseInt(request.getParameter("cid"));
		Category c = categoryDao.get(cid);

		String name = request.getParameter("name");
		String subTitle = request.getParameter("subTitle");
		Float originalPrice = Float.parseFloat(request.getParameter("originalPrice"));
		Float promotePrice = Float.parseFloat(request.getParameter("promotePrice"));
		int stock = Integer.parseInt(request.getParameter("stock"));
		Date createDate = new Date();

		Product p = new Product();
		p.setName(name);
		p.setSubTitle(subTitle);
		p.setOrignalPrice(originalPrice);
		p.setPromotePrice(promotePrice);
		p.setCategory(c);
		p.setStock(stock);
		p.setCreateDate(createDate);

		productDao.add(p);

		return "@admin_product_list?cid=" + c.getId();
	}

	@Override
	public String delete(HttpServletRequest request, HttpServletResponse response, Page page) {

		int id = Integer.parseInt(request.getParameter("id"));
		Product p = productDao.get(id);
		productDao.delete(id);

		return "@admin_product_list?cid=" + p.getCategory().getId() ;
	}

	@Override
	public String edit(HttpServletRequest request, HttpServletResponse response, Page page) {

		int id = Integer.parseInt(request.getParameter("id"));
		Product p = productDao.get(id);
		Category c = p.getCategory();

		request.setAttribute("p", p);
		request.setAttribute("c", c);

		return "admin/editProduct.jsp";
	}

	@Override
	public String update(HttpServletRequest request, HttpServletResponse response, Page page) {

		int id = Integer.parseInt(request.getParameter("id"));
		int cid = Integer.parseInt(request.getParameter("cid"));
		String name = request.getParameter("name");
		String subTitle = request.getParameter("subTitle");
		float originalPrice = Float.parseFloat(request.getParameter("originalPrice"));
		float promotePrice =  Float.parseFloat(request.getParameter("promotePrice"));
		int stock = Integer.parseInt(request.getParameter("stock"));
		Date createDate = new Date();

		Product p =  new Product();
		Category c = categoryDao.get(cid);

		p.setId(id);
		p.setName(name);
		p.setSubTitle(subTitle);
		p.setOrignalPrice(originalPrice);
		p.setPromotePrice(promotePrice);
		p.setCategory(c);
		p.setStock(stock);
		p.setCreateDate(createDate);

		productDao.update(p);

		return "@admin_product_list?cid=" + cid;
	}

	public String editPropertyValue(HttpServletRequest request, HttpServletResponse response, Page page){
		
		int pid = Integer.parsInt("pid");
		Product p = productDao.get(pid);
		propertyValueDao.init(p);
		List<Property> pts = propertyDao.list(p.getCategory().getId());
		
		req.setAttribute("p",p);
		req.setAttribute("pts",pts);
		return "admin/editPropertyValue.jsp";
	}
	
	public String updatePropertyValue(HttpServletRequest request, HttpServletResponse response, Page page){
		
		int pvId = Integer.parsInt(req.getParameter("pvId"));
		String pvValue = req.getParameter("pvValue");
		PropertyValue pv = propertyValueDao.get(pvId);
		pv.setValue(pvValue);
		propertyValueDao.update(pv);
		
		return "%success";
	}
}

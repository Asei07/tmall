package tmall.servlet;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tmall.bean.Order;
import tmall.util.Page;

public class OrderServlet  extends BaseBackServlet{

	@Override
	public String list(HttpServletRequest req, HttpServletResponse resp, Page page) {
		
		List<Order> os = orderDao.list(page.getStart(),page.getCount());
		page.setTotal(orderDao.getTotal());
		orderItemDao.fill(os);
		
		req.setAttribute("page",page);
		req.setAttribute("os", os);
		return "admin/listOrder.jsp";
	}
	
	public String delivery(HttpServletRequest req, HttpServletResponse resp, Page page){
		
		int oid = Integer.parseInt(req.getParameter("oid"));
		Order o = orderDao.get(oid);
		o.setStatus(orderDao.waitConfirm);
		o.setDeliveryDate(new Date());
		orderDao.update(o);
		
		return "@admin_order_list";
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

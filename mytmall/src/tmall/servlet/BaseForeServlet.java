package tmall.servlet;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tmall.dao.CategoryDao;
import tmall.dao.OrderDao;
import tmall.dao.OrderItemDao;
import tmall.dao.ProductDao;
import tmall.dao.ProductImageDao;
import tmall.dao.PropertyDao;
import tmall.dao.PropertyValueDao;
import tmall.dao.ReviewDao;
import tmall.dao.UserDao;
import tmall.util.Page;

public abstract class BaseForeServlet extends HttpServlet {

	abstract public String home(HttpServletRequest req, HttpServletResponse resp);
	abstract public String register(HttpServletRequest req,HttpServletResponse resp);
	abstract public String login(HttpServletRequest req, HttpServletResponse resp);
	abstract public String logout(HttpServletRequest req,HttpServletResponse resp);
	abstract public String product(HttpServletRequest req,HttpServletResponse resp);
	abstract public String checkLogin(HttpServletRequest req,HttpServletResponse resp);

	CategoryDao categoryDao = new CategoryDao();
	OrderDao orderDao = new OrderDao();
	OrderItemDao orderItemDao = new OrderItemDao();
	ProductDao productDao = new ProductDao();
	ProductImageDao productImageDao = new ProductImageDao();
	PropertyDao propertyDao = new PropertyDao();
	PropertyValueDao propertyValueDao = new PropertyValueDao();
	ReviewDao reviewDao = new ReviewDao();
	UserDao userDao = new UserDao();

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response)  {

		String method = (String) request.getAttribute("method");
		try {
			int start = 0;
			int count = 10;

//			start = Integer.parseInt(request.getParameter("page.start"));/*
//			count = Integer.parseInt(request.getParameter("page.count"));*/
			Page page = new Page(start,count);

			Method m = this.getClass().getMethod(method, HttpServletRequest.class, HttpServletResponse.class);
			String redirect = m.invoke(this, request, response).toString();

			if(redirect.startsWith("@")) {
				response.sendRedirect(redirect.substring(1));
			}else if(redirect.startsWith("%")) {

			}else {
				request.getRequestDispatcher(redirect).forward(request, response);
			}
		} catch (Exception e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

	}


}

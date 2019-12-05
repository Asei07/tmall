package tmall.servlet;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.math.RandomUtils;

import tmall.bean.Category;
import tmall.bean.Order;
import tmall.bean.OrderItem;
import tmall.bean.Product;
import tmall.bean.ProductImage;
import tmall.bean.PropertyValue;
import tmall.bean.Review;
import tmall.bean.User;

public class ForeServlet extends BaseForeServlet {

	

	@Override
	public String home(HttpServletRequest req, HttpServletResponse resp) {

		List<Category> cs = categoryDao.list();
		productDao.fill(cs);
		// System.out.println(cs);
		productDao.fillByRow(cs);
		req.setAttribute("cs", cs);

		return "homePage.jsp";
	}

	@Override
	public String register(HttpServletRequest req, HttpServletResponse resp) {

		String name = req.getParameter("name");
		String password = req.getParameter("password");
		boolean isExist = userDao.isExist(name);

		if (isExist) {
			req.setAttribute("errorMessage", "ユーザー名が存在しています");
			return "register.jsp";
		}
		User user = new User();
		user.setName(name);
		user.setPassword(password);
		userDao.add(user);
		return "registerSuccess.jsp";
	}

	@Override
	public String login(HttpServletRequest req, HttpServletResponse resp) {

		String name = req.getParameter("name");
		String password = req.getParameter("password");
		int itemNum = 0;
		User user = userDao.getByName(name);
		if (user == null) {
			req.setAttribute("errorMessage", "ユーザ名が見つかりません");
			return "login.jsp";
		} else if (!user.getPassword().equals(password)) {
			req.setAttribute("errorMessage", "パスワードが一致しません");
			return "login.jsp";
		} else {
			req.getSession().setAttribute("user", user);
		}

		return "@forehome";
	}

	@Override
	public String logout(HttpServletRequest req, HttpServletResponse resp) {

		req.getSession().removeAttribute("user");
		req.getSession().removeAttribute("itemNum");
		return "@forehome";
	}

	@Override
	public String product(HttpServletRequest req, HttpServletResponse resp) {

		int pid = Integer.parseInt(req.getParameter("pid"));
		Product p = productDao.get(pid);
		List<ProductImage> productSingleImages = productImageDao.list(p, productImageDao.type_single);
		List<ProductImage> productDetailImages = productImageDao.list(p, productImageDao.type_ditail);
		p.setProductSingleImages(productSingleImages);
		p.setProductDetailImages(productDetailImages);

		productDao.setSaleAndReviewNumber(p);

		List<PropertyValue> pvs = propertyValueDao.list(pid);
		List<Review> reviews = reviewDao.list(pid);

		req.setAttribute("p", p);
		req.setAttribute("pvs", pvs);
		req.setAttribute("reviews", reviews);
		return "productPage.jsp";
	}

	public String category(HttpServletRequest req, HttpServletResponse resp) {

		int cid = Integer.parseInt(req.getParameter("cid"));
		Category c = categoryDao.get(cid);
		// データを補充する
		productDao.fill(c);
		// 選択による並べ替える
		String sort = req.getParameter("sort");
		if (sort != null) {
			switch (sort) {
			case "all":
				Collections.sort(c.getProducts(), new Comparator<Product>() {
					@Override
					public int compare(Product p1, Product p2) {
						return p2.getReviewCount() * p2.getSaleCount() - p1.getReviewCount() * p1.getSaleCount();
					}
				});
				break;
			case "review":
				Collections.sort(c.getProducts(), new Comparator<Product>() {
					@Override
					public int compare(Product p1, Product p2) {
						return p2.getReviewCount() - p1.getReviewCount();
					}
				});
				break;
			case "date":
				Collections.sort(c.getProducts(), new Comparator<Product>() {
					@Override
					public int compare(Product p1, Product p2) {
						return p2.getCreateDate().compareTo(p1.getCreateDate());
					}
				});
				break;
			case "saleCount":
				Collections.sort(c.getProducts(), new Comparator<Product>() {
					@Override
					public int compare(Product p1, Product p2) {
						return p2.getSaleCount() - p1.getSaleCount();
					}
				});
				break;
			case "price":
				Collections.sort(c.getProducts(), new Comparator<Product>() {
					@Override
					public int compare(Product p1, Product p2) {
						return (int) (p1.getPromotePrice() - p2.getPromotePrice());
					}
				});
				break;
			}
		}
		req.setAttribute("c", c);
		return "categoryPage.jsp";
	}

	public String search(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {

		String keyword = req.getParameter("keyword");

		List<Product> ps = productDao.search(keyword, 0, 20);
		productDao.setSaleAndReviewNumber(ps);

		req.setAttribute("ps", ps);
		return "searchPage.jsp";
	}

	public String checkLogin(HttpServletRequest req, HttpServletResponse resp) {

		User u = (User) req.getSession().getAttribute("user");
		if (u != null) {
			System.out.println("u:" + u);
			return "%success";
		}
		return "%fail";
	}

	public String buyOne(HttpServletRequest req, HttpServletResponse resp) {

		int pid = Integer.parseInt(req.getParameter("pid"));
		int num = Integer.parseInt(req.getParameter("num"));
		int oiid = 0;

		Product p = productDao.get(pid);
		User u = (User) req.getSession().getAttribute("user");
		List<OrderItem> ois = orderItemDao.listByUser(u.getId());
		boolean found = false;
		for (OrderItem oi : ois) {
			if (pid == oi.getProduct().getId() ) {
				oi.setNumber(oi.getNumber() + num);
				oiid = oi.getId();
				orderItemDao.update(oi);
				found = true;
				break;
			}
		}
		if (!found) {
			OrderItem oi = new OrderItem();
			oi.setProduct(p);
			oi.setUser(u);
			oi.setNumber(num);
			orderItemDao.add(oi);
			oiid = oi.getId();
		}
		return "@forebuy?oiid=" + oiid;
	}

	public String buy(HttpServletRequest req, HttpServletResponse resp) {

		String[] oiids = req.getParameterValues("oiid");
		List<OrderItem> ois = new ArrayList();
		float itemTotalPrice = 0;
		for (String strId : oiids) {
			//跟填充里取得总数一样价格一样
			int oiid = Integer.parseInt(strId);
			OrderItem oi = orderItemDao.get(oiid);
			itemTotalPrice += oi.getProduct().getPromotePrice() * oi.getNumber();
			ois.add(oi);
		}
		req.getSession().setAttribute("ois", ois);
		req.getSession().setAttribute("total", itemTotalPrice);

		return "confirmPage.jsp";
	}
	
	public String createOrder(HttpServletRequest req, HttpServletResponse resp) {

		User user = (User) req.getSession().getAttribute("user");
		String address = req.getParameter("address");
		String post = req.getParameter("post");
		String name = req.getParameter("name");
		String mobile = req.getParameter("mobile");
		String message = req.getParameter("message");
		String orderCode = new SimpleDateFormat("yyyyMMddHHmmssSS").format(new Date()) + RandomUtils.nextInt(10000);

		Order order = new Order();
		order.setOrderCode(orderCode);
		order.setAddress(address);
		order.setPost(post);
		order.setReceiver(name);
		order.setMobile(mobile);
		order.setUserMessage(message);
		order.setCreateDate(new Date());
		order.setUser(user);
		order.setStatus(orderDao.waitPay);
		orderDao.add(order);

		List<OrderItem> ois = (List<OrderItem>) req.getSession().getAttribute("ois");
		float total = (float) req.getSession().getAttribute("total");
		for (OrderItem oi : ois) {
			oi.setOrder(order);
			orderItemDao.update(oi);
		}
		//页面通过url取值 因为直接购买的话不付款也会加入购物车，添加订单项时候 设置了session金额
		//不通过页面取值的话之后从我的订单里付款时候会拿到session里的金额
		return "@forepay?oid="+order.getId()+"&total="+total;
	}
	public String pay(HttpServletRequest req,HttpServletResponse resp){
		return "payPage.jsp";
	}
	
	public String payed(HttpServletRequest req,HttpServletResponse resp){

		int oid = Integer.parseInt(req.getParameter("oid"));
		Order order = orderDao.get(oid);
		order.setStatus(orderDao.waitDelivery);
		order.setPayDate(new Date());
		orderDao.update(order);

		req.setAttribute("o",order);
		return "payedPage.jsp";		
	}

	public String addCart(HttpServletRequest req, HttpServletResponse resp) {

		int pid = Integer.parseInt(req.getParameter("pid"));
		int num = Integer.parseInt(req.getParameter("num"));

		Product p = productDao.get(pid);
		User u = (User) req.getSession().getAttribute("user");
		List<OrderItem> ois = orderItemDao.listByUser(u.getId());
		boolean found = false;
		for (OrderItem oi : ois) {
			if (pid == oi.getProduct().getId()  ) {
				oi.setNumber(oi.getNumber() + num);
				orderItemDao.update(oi);
				found = true;
				break;
			}
		}
		if (!found) {
			OrderItem oi = new OrderItem();
			oi.setProduct(p);
			oi.setUser(u);
			oi.setNumber(num);
			orderItemDao.add(oi);
		}
		return "%success";
	}

	public String cart(HttpServletRequest req, HttpServletResponse resp) {

		User u = (User) req.getSession().getAttribute("user");
		List<OrderItem> ois = orderItemDao.listByUser(u.getId());
		req.setAttribute("ois", ois);

		return "shoppingCart.jsp";
	}

	public String changeOrderItem(HttpServletRequest req, HttpServletResponse resp) {

		User user = (User) req.getSession().getAttribute("user");
		if (user == null)
			return "%fail";
		int oiid = Integer.parseInt(req.getParameter("oiid"));
		int num = Integer.parseInt(req.getParameter("num"));

		OrderItem oi = orderItemDao.get(oiid);
		oi.setNumber(num);
		orderItemDao.update(oi);

		return "%seccess";
	}
	
	public String deleteOrderItem(HttpServletRequest req, HttpServletResponse resp) {

		User user = (User) req.getSession().getAttribute("user");
		if (user == null)
			return "%fail";
		int oiid = Integer.parseInt(req.getParameter("oiid"));
		orderItemDao.delete(oiid);
		
		return "%success";
	}
	
	public String deleteOrder(HttpServletRequest req, HttpServletResponse resp) {

		User user = (User) req.getSession().getAttribute("user");
		if (user == null)
			return "%fail";
		int oid = Integer.parseInt(req.getParameter("oid"));
		Order o = orderDao.get(oid);
		o.setStatus(orderDao.delete);
		orderDao.update(o);
		
		return "%success";
	}

	public String bought(HttpServletRequest req,HttpServletResponse resp){

		User u = (User) req.getSession().getAttribute("user");
		List<Order> os = orderDao.list(u.getId(),orderDao.delete);
		orderItemDao.fill(os);

		req.setAttribute("os",os);
		return "orderPage.jsp";
	}
	
	public String confirm(HttpServletRequest req,HttpServletResponse resp){
		
		int oid = Integer.parseInt(req.getParameter("oid"));
		Order o = orderDao.get(oid);
		orderItemDao.fill(o);
		
		req.setAttribute("o", o);
		return "confirmReceive.jsp";
	}
	
	public String orderFinish(HttpServletRequest req,HttpServletResponse resp){
		
		int oid = Integer.parseInt(req.getParameter("oid"));
		Order o = orderDao.get(oid);
		o.setStatus(orderDao.waitReview);
		o.setConfirmDate(new Date());
		orderDao.update(o);
		
		return "orderFinish.jsp";
	}
	
	public String review(HttpServletRequest req,HttpServletResponse resp){
		
		int oid = Integer.parseInt(req.getParameter("oid"));
		Order o = orderDao.get(oid);
		orderItemDao.fill(o);
		Product p = o.getOrderItems().get(0).getProduct();
		List<Review> reviews = reviewDao.list(p.getId());
		productDao.setSaleAndReviewNumber(p);
		
		req.setAttribute("o", o);
		req.setAttribute("p", p);
		req.setAttribute("reviews", reviews);
		return "reviewPage.jsp";
	}
	
	public String doReview(HttpServletRequest req,HttpServletResponse resp){
		
		int oid = Integer.parseInt(req.getParameter("oid"));
		int pid = Integer.parseInt(req.getParameter("pid"));
		String reviewContent = req.getParameter("reviewContent");
		
		Order o = orderDao.get(oid);
		o.setStatus(orderDao.finish);
		orderDao.update(o);
		
		User u = (User) req.getSession().getAttribute("user");
		if(u == null)
			return "login.jsp";
		Product p = productDao.get(pid);
		Review review = new Review();
		review.setContent(reviewContent);
		review.setCreateDate(new Date());
		review.setProduct(p);
		review.setUser(u);
		reviewDao.add(review);
		
		return "@forereview?oid=" + o.getId() + "&showonly=true";
		
	}
	
	public String loginAjax(HttpServletRequest req,HttpServletResponse resp){
		String name = req.getParameter("name");
		String password =req.getParameter("password");
		
		User user = userDao.get(name,password);
		if(user != null){
			req.getSession().setAttribute("user", user);
			return "%success";
		}
		return "%fail";
	}
} 

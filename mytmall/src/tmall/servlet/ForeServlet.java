package tmall.servlet;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tmall.bean.Category;
import tmall.bean.OrderItem;
import tmall.bean.Product;
import tmall.bean.ProductImage;
import tmall.bean.PropertyValue;
import tmall.bean.Review;
import tmall.bean.User;

public class ForeServlet extends BaseForeServlet{

	private Object getNumber;
	@Override
	public String home(HttpServletRequest req, HttpServletResponse resp) {

		List<Category> cs =  categoryDao.list();
		productDao.fill(cs);
//		System.out.println(cs);
		productDao.fillByRow(cs);
		req.setAttribute("cs", cs);

		return "homePage.jsp";
	}

	@Override
	public String register(HttpServletRequest req, HttpServletResponse resp) {

		String name = req.getParameter("name");
		String password = req.getParameter("password");
		boolean isExist = userDao.isExist(name);

		if(isExist) {
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

		User user = userDao.getByName(name);
		if(user == null) {
			req.setAttribute("errorMessage", "ユーザ名が見つかりません");
			return "login.jsp";
		}else if(! user.getPassword().equals(password)) {
			req.setAttribute("errorMessage", "パスワードが一致しません");
			return "login.jsp";
		}else {
			req.getSession().setAttribute("user", user);
		}

		return "@forehome";
	}

	@Override
	public String logout(HttpServletRequest req, HttpServletResponse resp) {

		req.getSession().removeAttribute("user");

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

	public String category(HttpServletRequest req,HttpServletResponse resp){

		int cid = Integer.parseInt(req.getParameter("cid"));
		Category c = categoryDao.get(cid);
		//データを補充する
		productDao.fill(c);
		//選択による並べ替える
		String sort = req.getParameter("sort");
		if(sort != null){
			switch(sort){
				case "all":
					Collections.sort(c.getProducts(),new Comparator<Product>(){
						@Override
						public int compare(Product p1,Product p2){
							return p2.getReviewCount()*p2.getSaleCount() - p1.getReviewCount()*p1.getSaleCount();
						}
					});
					break;
				case "review":
					Collections.sort(c.getProducts(),new Comparator<Product>(){
						@Override
						public int compare(Product p1,Product p2){
							return p2.getReviewCount() - p1.getReviewCount();
						}
					});
					break;
				case "date":
					Collections.sort(c.getProducts(),new Comparator<Product>(){
						@Override
						public int compare(Product p1,Product p2){
							return p2.getCreateDate().compareTo(p1.getCreateDate());
						}
					});
					break;
				case "saleCount":
					Collections.sort(c.getProducts(),new Comparator<Product>(){
						@Override
						public int compare(Product p1,Product p2){
							return p2.getSaleCount() - p1.getSaleCount();
						}
					});
					break;
				case "price":
					Collections.sort(c.getProducts(),new Comparator<Product>(){
						@Override
						public int compare(Product p1,Product p2){
							return (int)(p2.getPromotePrice() - p1.getPromotePrice());
						}
					});
					break;
			}
		}
		req.setAttribute("c",c);
		return "categoryPage.jsp";
	}
	public String search(HttpServletRequest req,HttpServletResponse resp) throws UnsupportedEncodingException{


		String keyword = req.getParameter("keyword");

		List<Product> ps = productDao.search(keyword,0,20);
		productDao.setSaleAndReviewNumber(ps);

		String sort = req.getParameter("sort");
		if(sort != null){
			switch(sort){
				case "all":
					Collections.sort(ps,new Comparator<Product>(){
						@Override
						public int compare(Product p1,Product p2){
							return p2.getReviewCount()*p2.getSaleCount() - p1.getReviewCount()*p1.getSaleCount();
						}
					});
					break;
				case "review":
					Collections.sort(ps,new Comparator<Product>(){
						@Override
						public int compare(Product p1,Product p2){
							return p2.getReviewCount() - p1.getReviewCount();
						}
					});
					break;
				case "date":
					Collections.sort(ps,new Comparator<Product>(){
						@Override
						public int compare(Product p1,Product p2){
							return p2.getCreateDate().compareTo(p1.getCreateDate());
						}
					});
					break;
				case "saleCount":
					Collections.sort(ps,new Comparator<Product>(){
						@Override
						public int compare(Product p1,Product p2){
							return p2.getSaleCount() - p1.getSaleCount();
						}
					});
					break;
				case "price":
					Collections.sort(ps,new Comparator<Product>(){
						@Override
						public int compare(Product p1,Product p2){
							return (int)(p2.getPromotePrice() - p1.getPromotePrice());
						}
					});
					break;
			}
		}
		req.setAttribute("ps", ps);

		return "searchPage.jsp";
	}
	
	public String checkLogin(HttpServletRequest req,HttpServletResponse resp){
		
		User u = (User) req.getSession().getAttribute("user");
		if(u != null){
			System.out.println("u:" + u);
			return "%success";
		}
		return "%fail";
	}
	public String buyOne(HttpServletRequest req,HttpServletResponse resp){

		int pid = Integer.parseInt(req.getParameter("pid"));
		int num = Integer.parseInt(req.getParameter("num"));
		int oiid = 0;
		
		Product p = productDao.get(pid);
		User u = (User) req.getSession().getAttribute("user");
		List<OrderItem> ois = orderItemDao.listByUser(u.getId());
		boolean found = false;
		for(OrderItem oi : ois){
			if(pid == oi.getProduct().getId()){
				oi.setNumber(oi.getNumber() + num);
				oiid = oi.getId();
				orderItemDao.update(oi);
				found = true;
				break;
			}
		}
		if(!found){
			OrderItem oi = new OrderItem();
			oi.setProduct(p);
			oi.setUser(u);
			oi.setNumber(num);
			orderItemDao.add(oi);
			oiid = oi.getId();
		}	
		System.out.println("num:" + num +",oiid:" + oiid);
		return "@forebuy?oiid=" + oiid;
	}
	public String buy(HttpServletRequest req,HttpServletResponse resp){
		
		String[] oiids = req.getParameterValues("oiid");
		List<OrderItem> ois = new ArrayList();
		int total = 0;
		for(String strId : oiids){
			int oiid = Integer.parseInt(strId);
			OrderItem oi = orderItemDao.get(oiid);
			total += oi.getProduct().getPromotePrice() * oi.getNumber();
			ois.add(oi);
		}
		req.setAttribute("ois",ois);
		req.getSession().setAttribute("total",total);

		return "confirmPage.jsp";
	}
	
	public String addCart(HttpServletRequest req,HttpServletResponse resp){

		int pid = Integer.parseInt(req.getParameter("pid"));
		int num = Integer.parseInt(req.getParameter("num"));

		Product p = productDao.get(pid);
		User u = (User) req.getSession().getAttribute("user");
		List<OrderItem> ois = orderItemDao.listByUser(u.getId());
		boolean found = false;
		for(OrderItem oi : ois){
			if(pid == oi.getProduct().getId()){
				oi.setNumber(oi.getNumber() + num);
				orderItemDao.update(oi);
				found = true;
				break;
			}
		}
		if(!found){
			OrderItem oi = new OrderItem();
			oi.setProduct(p);
			oi.setUser(u);
			oi.setNumber(num);
			orderItemDao.add(oi);			
		}	
		return "%success";
	}
	
	public String cart(HttpServletRequest req,HttpServletResponse resp){

		User u = (User)req.getSession().getAttribute("user");
		List<OrderItem> ois = orderItemDao.listByUser(u.getId());
		req.setAttribute("ois",ois);

		return "shoppingCart.jsp";
	}
}

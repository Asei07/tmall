package tmall.servlet;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tmall.bean.Category;
import tmall.bean.Product;
import tmall.bean.ProductImage;
import tmall.bean.PropertyValue;
import tmall.bean.Review;
import tmall.bean.User;

public class ForeServlet extends BaseForeServlet{

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
			req.setAttribute("user", user);
		}

		return "homePage.jsp";
	}

	@Override
	public String logout(HttpServletRequest req, HttpServletResponse resp) {

		req.removeAttribute("user");

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
	@override
	public String checkLogin(HttpServletRequest req,HttpServletResponse resp){
		
		User user = req.getAttrubute("user");
		if(user != null){
			return "%success";
		}
		return "%fail";
	}
	
	@override
	public String loginAjax(HttpServletRequest req,HttpServletResponse resp){
		return null;
	}
	
	@override
	public String category(HttpServletRequest req,HttpServletResponse resp){
		
		int cid = Integer.parseInt(req.getParameter("cid"));
		Category c = categoryDao.get(cid);
		//データを補充する
		productDao.fill(c);
		//選択による並べ替える
		String sort = req.getParameter("sort");
		if(sort != null){
			swich(sort){
				case "all":
					Collections.sort(c.getProducts(),new Comporator<Product>(){
						@override
						public int compare(Product p1,Product p2){
							return p2.getReviewCount()*p2.getSaleCount() - p1.getReviewCount()*p1.getSaleCount()
						}
					});
					break;
				case "review":
					Collections.sort(c.getProducts(),new Comporator<Product>(){
						@override
						public int compare(Product p1,Product p2){
							return p2.getReviewCount() - p1.getReviewCount();
						}
					});
					break;
				case "date":
					Collections.sort(c.getProducts(),new Comporator<Product>(){
						@override
						public int compare(Product p1,Product p2){
							return p2.getCreateDate() - p1.getCreateDate();
						}
					});
					break;
				case "saleCount":
					Collections.sort(c.getProducts(),new Comporator<Product>(){
						@override
						public int compare(Product p1,Product p2){
							return p2.getSaleCount() - p1.getSaleCount();
						}
					});
					break;
				case "price":
					Collections.sort(c.getProducts(),new Comporator<Product>(){
						@override
						public int compare(Product p1,Product p2){
							return p2.getPrice() - p1.getPrice();
						}
					});
					break;
			}
		}
		req.setAttribute("c",c);
		return "category.jsp";
	}
	
	@override
	public String search(HttpServletRequest req,HttpServletResponse resp){
		
		String keyword = req.getParameter("keyword");
		List<Products> products = productDao.search(keyword,0,20);
		productDao.setSaleAndReviewNumber(products);
		req.setAttrubite("ps", ps);
		
		return "searchPage.jsp";
	}
	
	@override
	public String buyOne(HttpServletRequest req,HttpServletResponse resp){
		
		int pid = Integer.parseInt(req.getParameter("pid"));
		int num = Integer.parseInt(req.getParameter("num"));
		int oiid = 0;
		
		Product p = productDao.get(pid);
		User u = req.getAttrubute("user");
		List<OrderItem> ois = orderItemDao.listByUser(u.getId());
		boolean found = false;
		for(OrderItem oi : ois){
			if(pid == oi.getProduct().getId()){
				oi.setNumber(oi.getNumber + num);
				orderItemDao.update(oi);
				found = true;
				break;
			}
		}
		if(!found){
			OrderItem oi = new OrderItem();
			oi.setProduct(p);
			oi.setUser(u);
			oi.setNumber(number);
			orderItemDao.add(oi);
			oiid = oi.getId();
		}	
		return "@forebuy?oiid=" + oiid;
	}
	
	@override
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
	
	@override
	public String addCart(HttpServletRequest req,HttpServletResponse resp){
		
		int pid = Integer.parseInt(req.getParameter("pid"));
		int num = Integer.parseInt(req.getParameter("num"));
		
		Product p = productDao.get(pid);
		User u = req.getAttrubute("user");
		List<OrderItem> ois = orderItemDao.listByUser(u.getId());
		boolean found = false;
		for(OrderItem oi : ois){
			if(pid == oi.getProduct().getId()){
				oi.setNumber(oi.getNumber + num);
				orderItemDao.update(oi);
				found = true;
				break;
			}
		}
		if(!found){
			OrderItem oi = new OrderItem();
			oi.setProduct(p);
			oi.setUser(u);
			oi.setNumber(number);
			orderItemDao.add(oi);			
		}	
		return "%success";
	}	
	@override
	public String cart(HttpServletRequest req,HttpServletResponse resp){
		
		User u = req.getAttribute("user");
		List<OrderItem> ois = orderItemDao.listByUser(u.getId());
		req.setAttribute("ois",ois);
		
		return "shoppingCart.jsp";
	}
	
	@override
	public String changeOrderItem(HttpServletRequest req,HttpServletResponse resp){
		
		User user = req.getAttribute("user");
		if(user == null)
			return "%fail";
		int pid = Integer.parsInt(req.getParameter("pid"));
		int num = Integer.parsint(req.getParameter("num"));
		List<OrderItem> ois = orderItemDao.list(user.getId());
		for(OrderItem oi : ois){
			if(oi.getProduct().getId() == pid){
				oi.setNumber(num);
				orderItemDao.update(oi);
				break;
			}
		}
		return "%success";
	}
	
	@override
	public String deleteOrderItem(HttpServletRequest req,HttpServletResponse resp){
		
		User user = req.getAttribute("user");
		if(user == null)
			return "%fail";
		int oiid = Integer.parsInt(req.getParameter("oiid"));
		orderItemDao.delete(oiid);
		
		return "%success";
	}
	
	@override
	public String createOrder(HttpServletRequest req,HttpServletResponse resp){
		
		User user = req.getSession().getAttribute("user");
		String address = req.getParameter("address");
		String post = req.getParameter("post");
		String name = req.getParameter("name");
		String mobile = req.getParameter("mobile");
		String message = req.getParameter("message");
		String orderCode = new SimpleDateFormat("yyyyMMddHHmmssSS").format(new Date()) + Random.nextInt(10000);
		
		Order order = new Order();
		order.setOrderCode(orderCode);
	    	order.setAddress(address);
	   	order.setPost(post);
	    	order.setReceiver(receiver);
	    	order.setMobile(mobile);
	    	order.setUserMessage(userMessage);
	   	order.setCreateDate(new Date());
	    	order.setUser(user);
	    	order.setStatus(OrderDAO.waitPay);
		orderDao.add(order);
		
		List<orderItem> ois = req.getSession().getAttribute("ois");
		int total = req.getSession().getAttribute("total");
		for(orderItem oi : ois){
			oi.setOrder(order);
			orderItemDao.update(oi);
		}
		req.setAttribute("oid",order.getId());
		return "payPage.jsp";
	}
	
	@override
	public String payed(HttpServletRequest req,HttpServletResponse resp){
		
		int oid = Integer.parseInt(req.getParameter("oid"));
		Order order = orderDao.get(oid);
		order.setStatus(orderDao.waitDelivery);
		order.setPayDate(new Date());
		orderDao.update(order);
		
		req.setAttribute("o",order);
		return "payedPage.jsp";		
	}
	
	@override
	public String bought(HttpServletRequest req,HttpServletResponse resp){
		
		User u = req.getSession().getParameter("user");
		List<Order> os = orderDao.list(u.getId(),orderDao.delete);
		orderItem.fill(os);
		
		req.setAttribute("os",os);
		return "orderPage.jsp";
	}
	
	@override
	public String receive(HttpServletRequest req,HttpServletResponse resp){
		
		int oid = Integer.parsInt(req.getparameter("oid"));
		Order o = orderDao.get(oid);
		orderItemDao.fill(o);
		
		req.setAttribute("o",o);
		return "receivePage.jsp";
	}
	
	@override
	public String orderFinish(HttpServletRequest req,HttpServletResponse resp){
		
		int oid = Integer.parsInt(req.getParameter("oid"));
		Order o = orderDao.get(oid);
		o.setStatus(orderDao.waitReview);
		o.setConfirmDate(new Date());
		orderDao.update(o);
		
		return "orderFinish.jsp";
	}
	
	@override
	public String deleteOrder(HttpServletRequest req,HttpServletResponse resp){
		
		int oid = Integer.parsInt("oid");
		Order o = orderDao.get(oid);
		o.setStatus(orderDao.delete);
		orderDao.update(o);
		
		return "%success";
	}
	
	@override
	public String review(HttpServletRequest req,HttpServletResponse resp){
		
		int oid = Integer.parsInt("oid");
		Order o = orderDao.get(oid);
		//オーダーにアイテムを補充する
		orderitemDao.fill(o);
		List<OrderItem> ois = o.getOrderItems();
		Product p = ois[0].getProduct();
		productDao.setSaleAndReviewNumber(p);
		
		req.setAttribute("p",p);
		return "reviewPage.jsp";
	}
}

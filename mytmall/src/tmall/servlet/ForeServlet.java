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
		productDao.fill(c);
		
		req.setAttribute("c",c);
		return "category.jsp";
	}
}

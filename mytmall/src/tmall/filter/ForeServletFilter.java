package tmall.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import tmall.bean.Category;
import tmall.bean.OrderItem;
import tmall.bean.User;
import tmall.dao.CategoryDao;
import tmall.dao.OrderItemDao;

public class ForeServletFilter implements Filter {

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {

			HttpServletRequest request = (HttpServletRequest)req;
			HttpServletResponse response = (HttpServletResponse)resp;

			String contextPath = request.getServletContext().getContextPath();
			String url = request.getRequestURI();

			url = StringUtils.remove(url, contextPath);
			//页面跳转后数据丢失  给简单搜索栏用
			List<Category> cs = new CategoryDao().list();
			request.setAttribute("cs", cs);
			User u = (User) request.getSession().getAttribute("user");
			if(u != null){
				List<OrderItem> ois = new OrderItemDao().listByUser(u.getId());
				int itemNum = 0;
				for(OrderItem oi : ois){
					if(oi.getOrder().getId() == 0){
					itemNum += oi.getNumber();
					}
				}
				request.setAttribute("itemNum", itemNum);
			}
				

			if(url.startsWith("/fore") && !url.startsWith("/foreServlet")) {
				String method = url.substring(5);
				request.setAttribute("method", method);
				url = url.substring(1, 5) + "Servlet";
				request.getRequestDispatcher("/" + url).forward(request, response);
		
				return;
			}
			chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}


}

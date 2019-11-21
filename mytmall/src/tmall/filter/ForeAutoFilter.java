package tmall.filter;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import tmall.bean.User;



public class ForeAutoFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest req = (HttpServletRequest) arg0;
        HttpServletResponse resp = (HttpServletResponse) arg1;
        
        String[] noNeedAutoPage = new String[]{
        		"home","register","product","category","checkLogin","search","login"
        };
        
        String contextPath = req.getServletContext().getContextPath();
        String url = req.getRequestURI();
        url = StringUtils.remove(url, contextPath);
        
		if(url.startsWith("/fore") && !url.startsWith("/foreServlet")){
			String method = StringUtils.substringAfterLast(url, "/fore");
			if(!Arrays.asList(noNeedAutoPage).contains(method)){
				User user = (User) req.getSession().getAttribute("user");
				if(user == null){
					System.out.println("user is null");
					 resp.sendRedirect("login.jsp");
					 return;
				}
			}
		}
		chain.doFilter(req, resp);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	
	
}

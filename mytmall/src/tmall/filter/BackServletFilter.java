package tmall.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

public class BackServletFilter implements Filter {

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain)
			throws IOException, ServletException {
			HttpServletRequest request = (HttpServletRequest) arg0;
			HttpServletResponse response = (HttpServletResponse) arg1;

			String contextpath = request.getServletContext().getContextPath();
			String url = request.getRequestURI();
			url = StringUtils.remove(url, contextpath);
			if(url.startsWith("/admin")) {
				String servletPath = StringUtils.substringBetween(url,"_","_") + "Servlet";
				String method = StringUtils.substringAfterLast(url, "_");
				request.setAttribute("method", method);
				request.getRequestDispatcher("/" + servletPath).forward(request, response);
				return;
			}

			chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}


}

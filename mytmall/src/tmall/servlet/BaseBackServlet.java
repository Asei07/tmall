package tmall.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import tmall.dao.CategoryDao;
import tmall.dao.OrderDao;
import tmall.dao.OrderItemDao;
import tmall.dao.ProductDao;
import tmall.dao.ProductImageDao;
import tmall.dao.PropertyDao;
import tmall.dao.PropertyValueDao;
import tmall.dao.UserDao;
import tmall.util.Page;

public abstract class BaseBackServlet extends HttpServlet {

	public abstract String list(HttpServletRequest req, HttpServletResponse resp, Page page);
	public abstract String add(HttpServletRequest req, HttpServletResponse resp, Page page);
	public abstract String delete(HttpServletRequest req, HttpServletResponse resp, Page page);
	public abstract String edit(HttpServletRequest req, HttpServletResponse resp, Page page);
	public abstract String update(HttpServletRequest req, HttpServletResponse resp, Page page);

	CategoryDao categoryDao = new CategoryDao();
	PropertyDao propertyDao = new PropertyDao();
	ProductDao productDao = new ProductDao();
	ProductImageDao productImageDao = new ProductImageDao();
	OrderDao orderDao =new OrderDao();
	OrderItemDao orderItemDao = new OrderItemDao();
	UserDao userDao = new UserDao();
	PropertyValueDao propertyValueDao =	 new PropertyValueDao();

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		//  paging condition, default 0,5
		int start = 0;
		int count = 5;

		try {
			start = Integer.parseInt(request.getParameter("page.start"));
		} catch (Exception e) {
		}
		try {
			count = Integer.parseInt(request.getParameter("page.count"));
		} catch (Exception e) {
		}

		Page page = new Page(start, count);
		// invoke method via reflection
		try {
			String method = (String) request.getAttribute("method");
			Method m = this.getClass().getMethod(method, HttpServletRequest.class, HttpServletResponse.class,
					Page.class);
			try {

				String redirect = m.invoke(this, request, response, page).toString();
				//  make page change according the returned string
				if (redirect.startsWith("@")) {
					response.sendRedirect(redirect.substring(1));
				} else if (redirect.startsWith("%")) {
					response.getWriter().print(redirect.substring(1));
				} else {
					request.getRequestDispatcher(redirect).forward(request, response);
				}
			} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
				e.printStackTrace();
			}
		} catch (NoSuchMethodException | SecurityException e) {
			e.printStackTrace();
		}

	}

	public InputStream parseUpload(HttpServletRequest request, Map<String, String> params) {

		InputStream is = null;
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		// sets size threshold beyond which files are written directly to disk
		factory.setSizeThreshold(1024 * 1024);

		try {
			
			List items = upload.parseRequest(request);
			Iterator iterator = items.iterator();
			while (iterator.hasNext()) {
				FileItem item =  (FileItem) iterator.next();
				System.out.println(item);
				if (!item.isFormField()) {
					is = item.getInputStream();
				} else {
					String paramName = item.getFieldName();
					String paramValue = item.getString();
					// both encode ASCll exactly the same way
					paramValue = new String(paramValue.getBytes("ISO-8859-1"),"UTF-8");
					params.put(paramName, paramValue);
				}
			}
		} catch (FileUploadException | IOException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		return is;
	}
}

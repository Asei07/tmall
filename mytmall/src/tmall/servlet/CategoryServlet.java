package tmall.servlet;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tmall.bean.Category;
import tmall.util.ImageUtil;
import tmall.util.Page;

public class CategoryServlet extends BaseBackServlet {

	@Override
	public String list(HttpServletRequest request, HttpServletResponse response, Page page) {
		List<Category> cList = categoryDao.list(page.getStart(), page.getCount());
		int total = categoryDao.getTotal();
		page.setTotal(total);
		request.setAttribute("cList", cList);
		request.setAttribute("page", page);
		return "admin/listCategory.jsp";
	}

	@Override
	public String add(HttpServletRequest request, HttpServletResponse response, Page page) {
		Map<String, String> params = new HashMap();
		InputStream is = super.parseUpload(request, params);
		//分類増加
		Category category = new Category();
		String name = params.get("name");
		category.setName(name);
		categoryDao.add(category);

		//写真保存
		File folderPath = new File(request.getSession().getServletContext().getRealPath("img/category"));
		File file = new File(folderPath, category.getId() + ".jpg");

		if(!folderPath.exists()) {
			folderPath.mkdirs();
		}

		try {
			FileOutputStream fot = new FileOutputStream(file);
			byte[] b = new byte[1024 * 1024];
			int length = 0;
			while ((length = is.read(b)) != -1) {
				fot.write(b, 0, length);
			}

			fot.close();
			BufferedImage img = ImageUtil.change2jpg(file);
			ImageIO.write(img,"jpg",file);

		} catch (Exception e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		return "@admin_category_list";
	}

	@Override
	public String delete(HttpServletRequest request, HttpServletResponse response, Page page) {

		int id = Integer.parseInt(request.getParameter("id"));
		categoryDao.delete(id);

		return "@admin_category_list";
	}

	@Override
	public String edit(HttpServletRequest request, HttpServletResponse response, Page page) {

		int id = Integer.parseInt(request.getParameter("id"));
		Category c = new Category();
		c = categoryDao.get(id);
		request.setAttribute("category",c );

		return "admin/editCategory.jsp";
	}


	@Override
	public String update(HttpServletRequest request, HttpServletResponse response, Page page) {

		Map<String,String> params = new HashMap();
		InputStream is = super.parseUpload(request, params);

		// 取值时候用了getparameter报错
		String name = params.get("name");
		int id = Integer.parseInt(params.get("id"));

		Category c = new Category();
		c.setId(id);
		c.setName(name);
		categoryDao.update(c);

		//写真保存
		File folderPath = new File(request.getSession().getServletContext().getRealPath("img/category"));
		System.out.println("realPath of ServletContext:" + request.getSession().getServletContext());
		System.out.println("realPath of ServletContext:" + request.getSession().getServletContext().getRealPath("img/category"));
		File file = new File(folderPath, c.getId() + ".jpg");

		if(!folderPath.exists()) {
			folderPath.mkdirs();
		}

		try {
			FileOutputStream fot = new FileOutputStream(file);
			byte[] b = new byte[1024 * 1024];
			int length = 0;
			while ((length = is.read(b)) != -1) {
				fot.write(b, 0, length);
			}

			fot.close();
			BufferedImage img = ImageUtil.change2jpg(file);
			ImageIO.write(img,"jpg",file);

		} catch (Exception e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		return "@admin_category_list";
	}
}

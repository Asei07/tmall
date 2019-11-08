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

import tmall.bean.Product;
import tmall.bean.ProductImage;
import tmall.util.ImageUtil;
import tmall.util.Page;

public class ProductImageServlet extends BaseBackServlet {

	@Override
	public String list(HttpServletRequest request, HttpServletResponse response, Page page) {

		int pid = Integer.parseInt(request.getParameter("pid"));
		Product p = productDao.get(pid);
		List<ProductImage> pisSingle = productImageDao.list(p, productImageDao.type_single);
		List<ProductImage> pisDetail = productImageDao.list(p, productImageDao.type_ditail);

		request.setAttribute("p", p);
		request.setAttribute("pisSingle", pisSingle);
		request.setAttribute("pisDetail", pisDetail);

		return "admin/listProductImage.jsp";
	}

	@Override
	public String add(HttpServletRequest request, HttpServletResponse response, Page page) {
		//文件的输入流
		InputStream is = null;
		//form上传时的其他参数
		Map<String, String> params = new HashMap();
		//解析form
		is = parseUpload(request, params);
		System.out.println(is);
		int pid = Integer.parseInt(params.get("pid"));
		String type = params.get("type");
		System.out.println("type:"+type);
		Product p = productDao.get(pid);

		ProductImage pi = new ProductImage();
		pi.setProduct(p);
		pi.setType(type);

		productImageDao.add(pi);

		//生成文件
		String fileName = pi.getId() + ".jpg";
		String imageFolder = null;
		String imageFolder_small = null;
		String imageFolder_middle = null;
		if (pi.getType().equals(productImageDao.type_single)) {

			imageFolder = request.getSession().getServletContext().getRealPath("img/productSingle");
			System.out.println("realPath:" + imageFolder);
			imageFolder_small = request.getSession().getServletContext().getRealPath("img/productSingle_small");
			imageFolder_middle = request.getSession().getServletContext().getRealPath("img/productSingle_middle");
		} else {
			imageFolder = request.getSession().getServletContext().getRealPath("img/productDetail");
		}

		File file = new File(imageFolder, fileName);
		System.out.println("filepath:" + file);
		if (!file.getParentFile().exists()) {
			file.getParentFile().mkdir();
			System.out.println("parentFile :" + file.getParentFile());
		}
		//复制文件

		try (FileOutputStream fos = new FileOutputStream(file)) {

			byte[] b = new byte[1024 * 1024];
			int length = 0;
			while ((length = is.read(b)) != -1) {
				fos.write(b, 0, length);
			}
			fos.flush();

			//把文件转成jpg
			BufferedImage img = ImageUtil.change2jpg(file);
			ImageIO.write(img, "jpg", file);

			if (pi.getType().equals(productImageDao.type_single)) {
				File f_small = new File(imageFolder_small, fileName);
				File f_middle = new File(imageFolder_middle, fileName);

				ImageUtil.resizeImage(file, 56, 56, f_small);
				ImageUtil.resizeImage(file, 217, 190, f_middle);
			}
		} catch (Exception e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		return "@admin_productImage_list?pid=" + pid;
	}

	@Override
	public String delete(HttpServletRequest request, HttpServletResponse response, Page page) {

		int id = Integer.parseInt(request.getParameter("id"));
		ProductImage pi = productImageDao.get(id);
		productImageDao.delete(id);

		String fileName = pi.getId() + ".jpg";
		if (pi.getType().equals(productImageDao.type_single)) {

			String imageSingle = request.getSession().getServletContext().getRealPath("img/productSingle");
			String imageSmall = request.getSession().getServletContext().getRealPath("img/productSingle_small");
			String imageMiddle = request.getSession().getServletContext().getRealPath("img/productSingle_middle");

			File f_single = new File(imageSingle, fileName);
			f_single.delete();
			File f_small = new File(imageSmall, fileName);
			f_small.delete();
			File f_middle = new File(imageMiddle, fileName);
			f_middle.delete();

		} else {

			String imageDetail = request.getSession().getServletContext().getRealPath("img/productDetail");
			File f_detail = new File(imageDetail, fileName);
			f_detail.delete();
		}
		return "@admin_productImage_list?pid=" + pi.getProduct().getId();
	}

	@Override
	public String edit(HttpServletRequest request, HttpServletResponse response, Page page) {

		return null;
	}

	@Override
	public String update(HttpServletRequest request, HttpServletResponse response, Page page) {
		// TODO 自動生成されたメソッド・スタブ
		return null;
	}

}

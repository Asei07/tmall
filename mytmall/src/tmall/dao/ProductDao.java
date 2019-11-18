package tmall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import tmall.bean.Category;
import tmall.bean.Product;
import tmall.bean.ProductImage;
import tmall.util.DBUtil;

public class ProductDao {

	public int getTotal(int cid) {

		int total = 0;
		String sql = "select count(*) from product where cid = " + cid;

		try(Connection conn = DBUtil.getConnection(); Statement s = conn.createStatement()){

			ResultSet rs = s.executeQuery(sql);

			while(rs.next()) {
				total = rs.getInt(1);
			}

		}catch(SQLException e) {
			e.printStackTrace();
		}
		return total;
	}

	public List<Product> list(int cid){
		return list(cid,0,Short.MAX_VALUE);
	}
	public List<Product> list(int cid,int start,int count){

		List<Product> list = new ArrayList();
		String sql = "select * from product where cid = ? order by id desc limit ?,?";

		try(Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)){

			ps.setInt(1, cid);
			ps.setInt(2, start);
			ps.setInt(3, count);

			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Product p = new Product();
				Category c = new CategoryDao().get(cid);
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String subTitle = rs.getString("subTitle");
				float originalPrice = rs.getFloat("orignalPrice");
				float promotePrice = rs.getFloat("promotePrice");
				int stock = rs.getInt("stock");
				Date createDate = rs.getDate("createDate");

				p.setId(id);
				p.setName(name);
				p.setSubTitle(subTitle);
				p.setOrignalPrice(originalPrice);
				p.setPromotePrice(promotePrice);
				p.setCategory(c);
				p.setStock(stock);
				p.setCreateDate(createDate);
				sertFirstProductImage(p);

				list.add(p);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;

	}

	public void add(Product prod) {

		String sql = "insert into product values(null,?,?,?,?,?,?,?)";

		try(Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)){

			ps.setString(1, prod.getName());
			ps.setString(2, prod.getSubTitle());
			ps.setFloat(3, prod.getOrignalPrice());
			ps.setFloat(4, prod.getPromotePrice());
			ps.setInt(5, prod.getStock());
			ps.setInt(6, prod.getCategory().getId());
			ps.setTimestamp(7,new Timestamp(prod.getCreateDate().getTime()));
			ps.execute();

			ResultSet rs = ps.getGeneratedKeys();
			while(rs.next()) {
				int id = rs.getInt(1);
				prod.setId(id);
			}

		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	public void delete(int id) {

		String sql = "delete from product where id = " + id;

		try(Connection conn = DBUtil.getConnection(); Statement s = conn.createStatement()){

			s.execute(sql);

		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	public Product get(int id) {

		Product p = null;
		String sql = "select * from product where id = " + id;

		try(Connection conn = DBUtil.getConnection(); Statement s = conn.createStatement()){

			ResultSet rs = s.executeQuery(sql);
			while(rs.next()) {
				p = new Product();

				String name = rs.getString("name");
				String subTitle = rs.getString("subTitle");
				float originalPrice = rs.getFloat("orignalPrice");
				float promotePrice = rs.getFloat("promotePrice");
				int stock = rs.getInt("stock");
				int cid = rs.getInt("cid");
				Category c = new CategoryDao().get(cid);
				Date createDate = rs.getDate("createDate");

				p.setId(id);
				p.setName(name);
				p.setSubTitle(subTitle);
				p.setOrignalPrice(originalPrice);
				p.setPromotePrice(promotePrice);
				p.setCategory(c);
				p.setStock(stock);
				p.setCreateDate(createDate);
				sertFirstProductImage(p);

			}
		}catch(SQLException e) {
			e.printStackTrace();
		}

		return p;
	}

	public void update(Product p) {
        String sql = "update product set name= ?, subTitle=?, orignalPrice=?,promotePrice=?,stock=?,"
        		+ " cid = ?, createDate=? where id = ?";

        try(Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)){

        	ps.setString(1, p.getName());
        	ps.setString(2, p.getSubTitle());
        	ps.setFloat(3, p.getOrignalPrice());
        	ps.setFloat(4, p.getPromotePrice());
        	ps.setInt(5, p.getStock());
        	ps.setInt(6, p.getCategory().getId());
        	ps.setTimestamp(7, new Timestamp(p.getCreateDate().getTime()));
        	ps.setInt(8, p.getId());

        	ps.execute();

        }catch(SQLException e) {
        	e.printStackTrace();
        }

	}

	public void sertFirstProductImage(Product p) {

		List<ProductImage> pi = new ProductImageDao().list(p, ProductImageDao.type_single);
		if(!pi.isEmpty()) {
			p.setFirstProductImage(pi.get(0));
		}

	}
	public void setSaleAndReviewNumber(Product p) {

		int saleCount = new OrderItemDao().getSaleCount(p.getId());
		int reviewCount = new ReviewDao().getCount(p.getId());

		p.setSaleCount(saleCount);
		p.setReviewCount(reviewCount);
	}

	public void setSaleAndReviewNumber(List<Product> products) {

		for(Product p : products ) {
			setSaleAndReviewNumber(p);
		}
	}
	
	public void fill(List<Category> cs) {

		for(Category c : cs ) {
			c.setProducts(list(c.getId()));
		}
	}
	
	public void fill(Category c){
		c.setProducts(list(c.getid()));
	}
	public void fillByRow(List<Category> cs) {

		int productEachRow = 8;
		for(Category c : cs) {
			List<List<Product>> productsByRow = new ArrayList();
			List<Product> products  = c.getProducts();
			for(int i = 0; i < products.size(); i += productEachRow) {
				int size = i + productEachRow;
				size = size > products.size() ? products.size() : size;
				List<Product> productOfEachRow = products.subList(i, size);
				productsByRow.add(productOfEachRow);
			}
			c.setProductsByRow(productsByRow);
		}
	}
	
	public List<Product> search(String keyword, int start, int end){
		
		List<Product> products = new ArrayList();
		if(keyword == null || keyword.trim().length() == 0)
			return products;
		String sql = "select * from product where name like ? limit ?,?";
		
		try(Connection c = DBUtil.getConnection(); PreparedStatement ps = c.preparedStatement(sql)){
			ps.setString(1, "%"+keyword.trim()+"%");
			ps.setInt(2,start);
			ps.setInt(3.end);
			
			ResulteSet rs = ps.excuteQuery();
			while(rs.next()){
				Product p = new Product();
				int id = rs.getInt("id");
				int cid = rs.getInt("cid");
				String name = rs.getString("name");
				String subTitle = rs.getString("subTitle");
				float originalPrice = rs.getFloat("orignalPrice");
				float promotePrice = rs.getFloat("promotePrice");
				int stock = rs.getInt("stock");
				Date createDate = rs.getDate("createDate");
				Category c = new CategoryDao().get(cid);
				
				p.setId(id);
				p.setName(name);
				p.setSubTitle(subTitle);
				p.setOrignalPrice(originalPrice);
				p.setPromotePrice(promotePrice);
				p.setCategory(c);
				p.setStock(stock);
				p.setCreateDate(createDate);
				sertFirstProductImage(p);
				products.add(p);
			}
		}catch(SQLexception e){
			e.printStackTrace();
		}
		return products;
	}
}

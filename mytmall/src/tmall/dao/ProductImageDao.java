package tmall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import tmall.bean.Product;
import tmall.bean.ProductImage;
import tmall.util.DBUtil;

public class ProductImageDao {

	public static final String type_single = "type_single";
	public static final String type_ditail = "type_detail";


	public List<ProductImage> list(Product p,String type){
		return list(p,type,0,Short.MAX_VALUE);
	}

	public List<ProductImage> list(Product p,String type,int start,int count){

		List<ProductImage> list = new ArrayList();
		String sql = "select * from productImage where pid = ? and type = ? order by id desc limit ?,?";

		try(Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)){

			ps.setInt(1, p.getId());
			ps.setString(2, type);
			ps.setInt(3, start);
			ps.setInt(4, count);

			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ProductImage pi = new ProductImage();

				int id = rs.getInt("id");

				pi.setId(id);
				pi.setType(type);
				pi.setProduct(p);

				list.add(pi);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public void add(ProductImage pi) {

		String sql = "insert into productImage values(null,?,?)";

		try(Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)){

			ps.setInt(1, pi.getProduct().getId());
			ps.setString(2, pi.getType());
			ps.execute();

			ResultSet rs = ps.getGeneratedKeys();
			while(rs.next()) {
				int id = rs.getInt(1);
				pi.setId(id);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	public void delete(int id) {

		String sql = "delete from productImage where id = " + id;

		try(Connection conn = DBUtil.getConnection(); Statement s = conn.createStatement()){

			s.execute(sql);

		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	public ProductImage get(int id) {

		ProductImage pi = null;
		String sql = "select * from productImage where id = " + id;

		try(Connection conn = DBUtil.getConnection(); Statement s = conn.createStatement()){

			ResultSet rs = s.executeQuery(sql);
			while(rs.next()) {
				int pid = rs.getInt("pid");
				String type = rs.getString("type");
				Product p = new ProductDao().get(pid);

				pi = new ProductImage();
				pi.setId(id);
				pi.setProduct(p);
				pi.setType(type);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return pi;
	}
}

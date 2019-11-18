package tmall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import tmall.bean.Category;
import tmall.util.DBUtil;

public class CategoryDao {

	public int getTotal() {
		int total = 0;
		try(Connection c = DBUtil.getConnection();Statement s = c.createStatement();){

			String sql = "select count(*) from Category";

			ResultSet rs = s.executeQuery(sql);
			while(rs.next()) {
				total = rs.getInt(1);
			}
		}catch(SQLException e) {

			e.printStackTrace();
		}
		return total;
	}

	public static void main(String[] args) {
		CategoryDao category = new CategoryDao();
		category.getTotal();
	}

	public void add(Category bean) {

		String sql = "insert into category values(null,?)";

		try(Connection c = DBUtil.getConnection();PreparedStatement ps = c.prepareStatement(sql);){

			ps.setString(1, bean.getName());

			ps.execute();

			ResultSet rs = ps.getGeneratedKeys();
			if(rs.next()) {
				int id = rs.getInt(1);
				bean.setId(id);
			}
		}catch(SQLException e) {

			e.printStackTrace();
		}
	}

	public void update(Category bean) {

		String sql = "update category set name= ? where id = ?";
		try(Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);){

			ps.setString(1, bean.getName());
			ps.setInt(2, bean.getId());

			ps.execute();

		}catch(SQLException e) {

			e.printStackTrace();
		}
	}

	public void delete(int id) {

		String sql = "delete from category where id = " + id;
		try(Connection c = DBUtil.getConnection(); Statement s = c.createStatement()){

			s.execute(sql);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Category get(int id) {

		Category bean = null;
		String sql = "select * from category where id = " + id;

		try(Connection c = DBUtil.getConnection();Statement s = c.createStatement()){

			ResultSet rs = s.executeQuery(sql);
			while(rs.next()) {
				bean = new Category();
				bean.setId(id);
				bean.setName(rs.getString(2));
			}

		}catch(SQLException e) {

			e.printStackTrace();
		}
		return bean;
	}
	public List<Category> list(){
		return list(0,Short.MAX_VALUE);
	}
	public List<Category> list(int start, int count){

		List<Category> cList = new ArrayList();
		String sql = "select * from category order by id desc limit ?,?";

		try(Connection conn = DBUtil.getConnection();PreparedStatement ps = conn.prepareStatement(sql)){
			ps.setInt(1, start);
			ps.setInt(2, count);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Category c  = new Category();
				int id = rs.getInt(1);
				String name = rs.getString(2);
				c.setId(id);
				c.setName(name);
				cList.add(c);
			}

		}catch(SQLException e) {
			e.printStackTrace();
		}

		return cList;
	}
}

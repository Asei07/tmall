package tmall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import tmall.bean.Category;
import tmall.bean.Property;
import tmall.util.DBUtil;

public class PropertyDao {

	public List<Property> list(int cid,int start,int count){
		//创建plist集合
		List<Property> list = new ArrayList();
		//sql语句
		String sql = "select * from property where cid = ? order by id desc limit ?,?";
		//连接数据库执行预编译语句
		try(Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)){
			//参数赋值
			ps.setInt(1, cid);
			ps.setInt(2, start);
			ps.setInt(3, count);
			//执行查询语句获得结果集
			ResultSet rs = ps.executeQuery();
			//判断结果集取值
			while(rs.next()) {
				//创建p对象赋值并添加到plist
				Property p = new Property();
				Category c = new CategoryDao().get(cid);
				int id = rs.getInt("id");
				String name = rs.getString("name");
				p.setId(id);
				p.setName(name);
				p.setCategory(c);

				list.add(p);
			}

		} catch(SQLException e) {
			e.printStackTrace();
		}
		//返回plist
		return list;

	}
	
	public List<Property> list(int cid){
		
		List<Property>  ps = new ArrayList();
		String sql = "select * from property where cid =  " + cid;
		
		try(Connection c = DBUtil.getConnection(); Statement s = c.createStatement()){
			
			ResultSet rs = s.executeQuery(sql);
			while(rs.next()){
				Property property = new Property();
				Category category = new CategoryDao().get(cid);
				int id = rs.getInt("id");
				String name = rs.getString("name");
				
				property.setId(id);
				property.setName(name);
				property.setCategory(category);
				ps.add(property);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return ps;
	}

	public int getTotal(int cid) {
		//创建sql语句
		String sql = "select count(*) from property where cid = " + cid;
		int total = 0;
		//连接数据库
		try(Connection conn = DBUtil.getConnection(); Statement s = conn.createStatement()){

			//获取结果集
			ResultSet rs = s.executeQuery(sql);
			while(rs.next()) {
				 total = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return total;
	}

	public void add(Property prop) {

		String sql = "insert into property values(null,?,?)";

		try(Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)){

			ps.setInt(1, prop.getCategory().getId());
			ps.setString(2, prop.getName());
			ps.execute();

			ResultSet rs = ps.getGeneratedKeys();
			while(rs.next()) {
				int id = rs.getInt(1);
				prop.setId(id);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	public void delete(int id) {

		String sql = "delete from property where id = " + id;

		try(Connection conn = DBUtil.getConnection(); Statement s = conn.createStatement()){

			s.execute(sql);

		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	public Property get(int id) {

		Property prop = null;
		String sql = "select * from property where id = " + id;

		try(Connection conn = DBUtil.getConnection(); Statement s = conn.createStatement()){

			ResultSet rs = s.executeQuery(sql);
			while(rs.next()) {
				prop = new Property();
				int cid = rs.getInt("cid");
				Category c = new CategoryDao().get(cid);
				String name = rs.getString("name");
				prop.setCategory(c);
				prop.setName(name);
				prop.setId(id);

			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return prop;
	}

	public void update(Property prop) {

		String sql = "update property set cid = ?, name = ? where id = ?";

		try(Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)){

			ps.setInt(1, prop.getCategory().getId());
			ps.setString(2, prop.getName());
			ps.setInt(3, prop.getId());

			ps.execute();

		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
}

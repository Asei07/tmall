package tmall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import tmall.bean.User;
import tmall.util.DBUtil;

public class UserDao {

	public int getTotal() {

		int total = 0;

		try (Connection conn = DBUtil.getConnection(); Statement stat = conn.createStatement()) {

			String sql = "select count(*) from user";

			ResultSet rs = stat.executeQuery(sql);
			while (rs.next()) {
				total = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return total;
	}

	public void add(User user) {

		String sql = "insert into user values(null,?,?)";
		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, user.getName());
			ps.setString(2, user.getPassword());

			ps.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void update(User user) {

		String sql = "update user set name = ?, password = ? where id = ?";
		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, user.getName());
			ps.setString(2, user.getPassword());
			ps.setInt(3, user.getId());

			ps.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void delete(int id) {

		String sql = "delete from user where id = " + id;
		try (Connection conn = DBUtil.getConnection(); Statement stat = conn.createStatement()) {

			stat.execute(sql);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public User get(int id) {

		User user = null;
		String sql = "select * from user where id = " + id;

		try (Connection conn = DBUtil.getConnection(); Statement s = conn.createStatement()) {

			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				user = new User();
				user.setId(id);
				user.setName(rs.getString(2));
				user.setPassword(rs.getString(3));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user;
	}

	public List<User> list() {
		return list(0, Short.MAX_VALUE);
	}

	public List<User> list(int start, int count) {

		List<User> uList = new ArrayList();
		String sql = "select * from user order by id desc limit ?,?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, start);
			ps.setInt(2, count);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User u = new User();
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setPassword(rs.getString(3));
				uList.add(u);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return uList;
	}

	public User getByName(String name) {

		User user = null;
		String sql = "select * from user where name = '" +name+"'";

		try (Connection conn = DBUtil.getConnection(); Statement stat = conn.createStatement()) {

			ResultSet rs = stat.executeQuery(sql);
			while (rs.next()) {

				user = new User();
				user.setId(rs.getInt(1));
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
			}
		} catch (SQLException e) {
			e.printStackTrace();

		}
		return user;
	}

	public boolean isExist(String name) {
		User user = getByName(name);
		return user != null;
	}
	//名前とパスワードによってユーザーとる
	public User getByAll(String name, String password) {

		User user = null;
		String sql = "select * from user where name = ? and password = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				user = new User();
				user.setId(rs.getInt(1));
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
}

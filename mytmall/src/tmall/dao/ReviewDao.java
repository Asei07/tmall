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

import tmall.bean.Review;
import tmall.util.DBUtil;
import tmall.util.DateUtil;

public class ReviewDao {

	public int getTotal() {

		int total = 0;
		String sql = "select count(*) from review ";

		try(Connection c = DBUtil.getConnection(); Statement st = c.createStatement()){

			ResultSet rs = st.executeQuery(sql);
			if(rs.next()) {
				total = rs.getInt(1);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return total;
	}
	public void add(Review bean) {

		String sql = "insert into review(null,?,?,?,?)";

		try(Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql)){

			ps.setString(1, bean.getContent());
			ps.setInt(2, bean.getUser().getId());
			ps.setInt(3, bean.getProduct().getId());
			ps.setTimestamp(4, DateUtil.d2t(bean.getCreateDate()));
			ps.execute();

			ResultSet rs = ps.getGeneratedKeys();
			if(rs.next()) {
				bean.setId(rs.getInt(1));
			}

		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public void delete(int id) {

		String sql = "delete from review where id =" + id;

		try(Connection c = DBUtil.getConnection(); Statement st = c.createStatement()){

			st.execute(sql);

		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	public void update(Review bean) {

		String sql = "update review set content=?, uid=?, pid=?, createDate=? where id = ?";

		try(Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql)){

			ps.setString(1,bean.getContent());
			ps.setInt(2, bean.getUser().getId());
			ps.setInt(3, bean.getProduct().getId());
			ps.setTimestamp(4, new Timestamp(bean.getCreateDate().getTime()));
			ps.setInt(5, bean.getId());

			ps.execute();

		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	public Review get(int id) {

		Review review  = new Review();
		String sql = "select * from review where id =" + id;

		try(Connection c = DBUtil.getConnection(); Statement st = c.createStatement()){

			ResultSet rs = st.executeQuery(sql);
			if(rs.next()) {
				String content = rs.getString("content");
				int uid = rs.getInt("uid");
				int pid = rs.getInt("pid");
				Date createDate = new Date(rs.getTimestamp("createDate").getTime());

				review.setId(id);
				review.setContent(content);
				review.setUser(new UserDao().get(uid));
				review.setProduct(new ProductDao().get(pid));
				review.setCreateDate(createDate);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return review;
	}

	public List<Review> list(int pid){

		List<Review> reviewList = new ArrayList();
		String sql = "select * from review where pid =" + pid;

		try(Connection c = DBUtil.getConnection(); Statement st = c.createStatement()){

			ResultSet rs = st.executeQuery(sql);

			while(rs.next()) {
				Review review = new Review();

				int id = rs.getInt("id");
				String content = rs.getString("content");
				int uid = rs.getInt("uid");;
				Date createDate = new Date(rs.getTimestamp("createDate").getTime());

				review.setId(id);
				review.setContent(content);
				review.setUser(new UserDao().get(uid));
				review.setProduct(new ProductDao().get(pid));
				review.setCreateDate(createDate);

				reviewList.add(review);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return reviewList;
	}

	public int getCount(int pid) {

		int count = 0;
		String sql = "select count(*) from review where pid=" + pid;

		try(Connection c = DBUtil.getConnection(); Statement st = c.createStatement()){

			ResultSet rs = st.executeQuery(sql);
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
}

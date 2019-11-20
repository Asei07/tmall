package tmall.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import tmall.bean.Order;
import tmall.bean.OrderItem;
import tmall.bean.Product;
import tmall.bean.User;
import tmall.util.DBUtil;

public class OrderItemDao {

	public int getSaleCount(int pid) {

		int count = 0;
		String sql =  "select count(*) from orderItem where pid=" + pid;

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
	public int getTotal(){

		int total = 0;
		String sql = "select count(*) from orderItem";

		try(Connection c = DBUtil.getConnection(); Statement st = c.createStatement()){


			ResultSet rs = st.executeQuery(sql);
			if(rs.next()) {
				total = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return total;
	}

	public void add(OrderItem bean){

		String sql = "insert into orderItem values(null.?,?,?,?)";

		try(Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql)){

			ps.setInt(1,bean.getProduct().getId());
			if(bean.getOrder() == null){
				ps.setInt(2,-1);
			}else{
				ps.setInt(2,bean.getOrder().getId());
			}
			ps.setInt(3,bean.getUser().getId());
			ps.setInt(4,bean.getNumber());
			ps.execute();

			ResultSet rs = ps.getGeneratedKeys();
			if(rs.next()){
				int id = rs.getInt("id");
				bean.setId(id);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	}

	public void delete(int id){

		String sql = "delete from orderItem where id=" + id;

		try(Connection c = DBUtil.getConnection(); Statement s = c.createStatement()){
			s.execute(sql);
		}catch(SQLException e){
			e.printStackTrace();
		}
	}

	public void update(OrderItem bean){

		String sql = "update orderItem set pid=?, oid=?, uid=?, number=? where id=?";

		try(Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql)){

			ps.setInt(1,bean.getProduct().getId());
			if(bean.getOrder() == null){
				ps.setInt(2,-1);
			}else{
				ps.setInt(2,bean.getOrder().getId());
			}
			ps.setInt(3,bean.getUser().getId());
			ps.setInt(4,bean.getNumber());
			ps.setInt(5,bean.getId());
			ps.execute();

		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	public List<OrderItem> listByUser(int uid){

		List<OrderItem> ois = new ArrayList();
		String sql = "select * from orderItem where uid =" + uid;

		try(Connection c = DBUtil.getConnection(); Statement st = c.createStatement()){

			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				OrderItem oi = new OrderItem();
				int id = rs.getInt("id");
				int pid = rs.getInt("pid");
				int oid = rs.getInt("oid");
				int number = rs.getInt("number");
				Product p = new ProductDao().get(pid);
				User u = new UserDao().get(uid);
				Order o = new OrderDao().get(oid);

				oi.setId(id);
				oi.setProduct(p);
				oi.setUser(u);
				oi.setOrder(o);
				oi.setNumber(number);
				ois.add(oi);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return ois;
	}
}

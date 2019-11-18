package tmall.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import tmall.util.DBUtil;

public class OrderItemDao {
	
	public int getTotal(){
		
		int total = 0;
		String sql = "select count(*) from orderItem";
		
		try(Connection c = DBUtil.getConnection(); Statement st = c.createStatement()){

			ResultSet rs = st.executeQuery(sql);
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return total;
	}
	
	public void add(OrderItem bean){
		
		String sql = "insert into orderItem values(null.?,?,?,?)"
		
		try(Connection c = DBUtil.getConnection(); PreparedStatement ps = c.preparedStatement(sql)){
			
			ps.setInt("pid",bean.getProduct().getId());
			if(bean.getOrder() == null){
				ps.setInt("oid",-1);
			}else{
				ps.setInt("oid",bean.getOrder().getId())
			}
			ps.setInt("uid",bean.getUser().getId());
			ps.setInt("number",bean.getNumber());
			ps.execute();
			
			ResulteSet rs = ps.getGeneratedKeys();
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
			s.execute();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	public void update(OrderItem bean){
		
		String sql = "update orderItem set pid=?, oid=?, uid=?, number=? where id=?";
		
		try(Connection c = DBUtil.getConnection(); PreparedStatement ps = c.preparedStatement()){
			
			ps.setInt("pid",bean.getProduct().getId());
			if(bean.getOrder() == null){
				ps.setInt("oid",-1);
			}else{
				ps.setInt("oid",bean.getOrder().getId());
			}
			ps.setInt("uid",bean.getUser().getId());
			ps.setInt("number",bean.getNumber());
			ps.setInt("id",bean.getId());
			ps.execute();
			
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
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
	public List<OrderItem> listByOrder(int oid){
		
	}
	public List<OrderItem> listByOrder(int oid, int start, int count){
		
		List<OrderItem> beans = new ArrayList();
		String sql = "select * from orderItem where oid = ? "
	}
	public void fill(Order[] orders){
		for(Order o : orders){
			fill(o);
		}
	}
	public void fill(Order o){
		
		List<OrderItem> ois = new ArrayList();
		String sql = "select * from orderItem where oid =" + o.getId():
		
		try(Connection c = DBUtil.getConnection(); Statement s = c.createStatement()){
			
			ResultSet rs = s.execute();
			while(rs.next()){
				OrderItem oi = new OrderItem();
				int id = rs.getInt("id");
				int number = rs.getInt("number");
				int uid = rs.getInt("uid");
				int pid = rs.getInt("pid");
				User u = new UserDao().get(uid);
				Product p = new ProductDao().get(pid);
				
				oi.setId(id);
				oi.setNumber(number);
				oi.setUser(u);
				oi.setProduct(p);
				oi.setOrder(o);
				ois.add(oi);
			}
		}
		o.setOrderItem(ois);
	}
}

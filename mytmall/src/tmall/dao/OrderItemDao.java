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
		String sql =  "select count(*) from orderItem where pid='" + pid +"'";

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
	
	/*public int getTotalByUser(int id){
		
		int total = 0;
		String sql = "select count(*) from orderItem where uid = '" + id +"'";
		
		try(Connection c = DBUtil.getConnection(); Statement s = c.createStatement()){
			
			ResultSet rs = s.executeQuery(sql);
			if(rs.next()){
				total = rs.getInt(1);
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		return total;
	}*/

	public void add(OrderItem bean){

		String sql = "insert into orderItem values(null,?,?,?,?)";

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
				int id = rs.getInt(1);
				bean.setId(id);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	}

	public void delete(int id){

		String sql = "delete from orderItem where id='" + id +"'";

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
		String sql = "select * from orderItem where uid ='" + uid +"'";

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
	public OrderItem get(int id) {
        OrderItem bean = new OrderItem();
  
        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
  
            String sql = "select * from OrderItem where id = '" + id +"'";
  
            ResultSet rs = s.executeQuery(sql);
  
            if (rs.next()) {
                int pid = rs.getInt("pid");
                int oid = rs.getInt("oid");
                int uid = rs.getInt("uid");
                int number = rs.getInt("number");
                Product product = new ProductDao().get(pid);
                User user = new UserDao().get(uid);
                bean.setProduct(product);
                bean.setUser(user);
                bean.setNumber(number);
                 
                if(-1!=oid){
                    Order order= new OrderDao().get(oid);
                    bean.setOrder(order);                  
                }
                 
                bean.setId(id);
            }
  
        } catch (SQLException e) {
  
            e.printStackTrace();
        }
        return bean;
    }
	
//	public List<OrderItem> listByOrder(int oid){
//		listByOrder(oid,0,Short.MAX_VALUE);
//	}
//	public List<OrderItem> listByOrder(int oid, int start, int count){
//
//		List<OrderItem> beans = new ArrayList();
//		String sql = "select * from orderItem where oid = ? ";
//	}
	public void fill(List<Order> orders){
		for(Order o : orders){
			fill(o);
		}
	}
	public void fill(Order o){

		List<OrderItem> ois = listByOrder(o);
		float totalPrice = 0;
		int totalNum = 0;
		for(OrderItem oi : ois){
			totalPrice += oi.getNumber() * oi.getProduct().getPromotePrice();
			totalNum += oi.getNumber();
		}
		o.setTotalNum(totalNum);
		o.setTotalPrice(totalPrice);
		o.setOrderItems(ois);
	}
	
	public List<OrderItem> listByOrder(Order o) {
		List<OrderItem> ois = new ArrayList();
		String sql = "select * from orderItem where oid =" + o.getId();

		try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement()) {

			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
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
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ois;
	}
}

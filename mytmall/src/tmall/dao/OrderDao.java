package tmall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import tmall.bean.Order;
import tmall.bean.User;
import tmall.util.DBUtil;
import tmall.util.DateUtil;

public class OrderDao {
	
	public static final String waitPay = "waitPay";
    public static final String waitDelivery = "waitDelivery";
    public static final String waitConfirm = "waitConfirm";
    public static final String waitReview = "waitReview";
    public static final String finish = "finish";
    public static final String delete = "delete";
    
    public int getTotal(){

        int total = 0;
        String sql = "select count(*) from order_";
        try(Connection c = DBUtil.getConnection(); Statement s = c.createStatement()){

         ResultSet rs = s.executeQuery(sql);
         if(rs.next()){
            total = rs.getInt(1);
         }
        }catch(SQLException e){
          e.printStackTrace();
        }
        return total;
      }

      public void add(Order bean){

        String sql = "insert into order_ values(null,?,?,?,?,?,?,?,?,?,?,?,?)";      
        try(Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql)){

              ps.setString(1, bean.getOrderCode());
              ps.setString(2, bean.getAddress());
              ps.setString(3, bean.getPost());
              ps.setString(4, bean.getReceiver());
              ps.setString(5, bean.getMobile());
              ps.setString(6, bean.getUserMessage()); 
              ps.setTimestamp(7,  DateUtil.d2t(bean.getCreateDate()));
              ps.setTimestamp(8,  DateUtil.d2t(bean.getPayDate()));
              ps.setTimestamp(9,  DateUtil.d2t(bean.getDeliveryDate()));
              ps.setTimestamp(10,  DateUtil.d2t(bean.getConfirmDate()));
              ps.setInt(11, bean.getUser().getId());
              ps.setString(12, bean.getStatus());
              ps.execute();
              ResultSet rs = ps.getGeneratedKeys();
              if(rs.next()){
                int id = rs.getInt(1);
                bean.setId(id);
              }
        } catch(SQLException e){
          e.printStackTrace();
        }
      }

      public void delete(int id){

          String sql = "delete from order_ where id = " + id;
          try(Connection c = DBUtil.getConnection(); Statement s = c.createStatement()){

              s.execute(sql);

          }catch(SQLException e){
              e.printStackTrace();
          }
      }

      public void update(Order bean){

          String sql = "update order_  set address= ?, post=?, receiver=?,mobile=?,userMessage=? ,createDate = ? , "
          		+ "payDate =? , deliveryDate =?, confirmDate = ? , orderCode =?, uid=?, status=? where id = ?"; 
          try(Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql)){

              ps.setString(1,bean.getAddress());
              ps.setString(2,bean.getPost());
              ps.setString(3,bean.getReceiver());
              ps.setString(4,bean.getMobile());
              ps.setString(5,bean.getUserMessage());
              ps.setTimestamp(6,DateUtil.d2t(bean.getCreateDate()));
              ps.setTimestamp(7,DateUtil.d2t(bean.getPayDate()));
              ps.setTimestamp(8,DateUtil.d2t(bean.getDeliveryDate()));
              ps.setTimestamp(9,DateUtil.d2t(bean.getConfirmDate()));
              ps.setString(10,bean.getOrderCode());
              ps.setInt(11,bean.getUser().getId());
              ps.setString(12,bean.getStatus());
              ps.setInt(13,bean.getId());

              ps.execute();

          }catch(SQLException e){
              e.printStackTrace();
          }
      }
	public Order get(int id){

        Order o = new Order();
        String sql = "select * from order_ where id = " + id ;
        try(Connection c = DBUtil.getConnection(); Statement s = c.createStatement()){

            ResultSet rs = s.executeQuery(sql);
            if(rs.next()){
                String orderCode = rs.getString("orderCode");
                String address = rs.getString("address");
                String post = rs.getString("post");
                String receiver = rs.getString("receiver");
                String mobile = rs.getString("mobile");
                String userMessage = rs.getString("userMessage");
                String status = rs.getString("status");
                Date createDate = DateUtil.t2d(rs.getTimestamp("createDate"));
                Date payDate = DateUtil.t2d(rs.getTimestamp("payDate"));
                Date deliveryDate = DateUtil.t2d(rs.getTimestamp("deliveryDate"));
                Date confirmDate = DateUtil.t2d(rs.getTimestamp("confirmDate"));
                int uid = rs.getInt("uid");

                o.setId(id);
                o.setOrderCode(orderCode);
                o.setAddress(address);
                o.setPost(post);
                o.setReceiver(receiver);
                o.setMobile(mobile);
                o.setUserMessage(userMessage);
                o.setStatus(status);
                o.setCreateDate(createDate);
                o.setPayDate(payDate);
                o.setDeliveryDate(deliveryDate);
                o.setConfirmDate(confirmDate);
                User u = new UserDao().get(uid);
                o.setUser(u);
            }

        }catch(SQLException e){
            e.printStackTrace();
        }
        return o;
    }
	
	 public List<Order> list(int uid, String statu){

	        List<Order> os = new ArrayList();
	        String sql = "select * from order_ where uid = ? and status != ?";
	        try(Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql)){

	            ps.setInt(1,uid);
	            ps.setString(2,statu);
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){
	                Order o = new Order();
	                int id = rs.getInt("id");
	                String orderCode = rs.getString("orderCode");
	                String address = rs.getString("address");
	                String post = rs.getString("post");
	                String receiver = rs.getString("receiver");
	                String mobile = rs.getString("mobile");
	                String userMessage = rs.getString("userMessage");
	                String status = rs.getString("status");
	                Date createDate = DateUtil.t2d(rs.getTimestamp("createDate"));
	                Date payDate = DateUtil.t2d(rs.getTimestamp("payDate"));
	                Date deliveryDate = DateUtil.t2d(rs.getTimestamp("deliveryDate"));
	                Date confirmDate = DateUtil.t2d(rs.getTimestamp("confirmDate"));

	                o.setId(id);
	                o.setOrderCode(orderCode);
	                o.setAddress(address);
	                o.setPost(post);
	                o.setReceiver(receiver);
	                o.setMobile(mobile);
	                o.setUserMessage(userMessage);
	                o.setStatus(status);
	                o.setCreateDate(createDate);
	                o.setPayDate(payDate);
	                o.setDeliveryDate(deliveryDate);
	                o.setConfirmDate(confirmDate);
	                User u = new UserDao().get(uid);
	                o.setUser(u);

	                os.add(o);
	            }

	        }catch(SQLException e){
	            e.printStackTrace();
	        }
	        return os;
	    }
}

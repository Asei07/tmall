package tmall.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import tmall.bean.Order;
import tmall.bean.User;
import tmall.util.DBUtil;

public class OrderDao {
	
	public Order get(int id){

        Order o = new Order();
        String sql = "select * from order where id = " + id;
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
                Date createDate = new Date(rs.getDate("createDate").getTime());
                Date payDate = new Date(rs.getDate("payDate").getTime());
                Date deliveryDate = new Date(rs.getDate("deliveryDate").getTime());
                Date confirmDate = new Date(rs.getDate("confirmDate").getTime());
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
}

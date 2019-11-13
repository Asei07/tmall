package tmall.dao;

public class OrderDao {
    
    public static final String waitPay = "waitPay";
    public static final String waitDelivery = "waitDelivery";
    public static final String waitConfirm = "waitConfirm";
    public static final String waitReview = "waitReview";
    public static final String finish = "finish";
    public static final String delete = "delete";
    
    public int getTotal(){
        
      total = 0;
      String sql = "select count(*) from order_";
      try(Connection c = DBUtil.getConnection(); Statement s = c.createStatement()){
        
       ResultSet rs = s.executeQuery();
       if(rs.next()){
          total = rs.getInt(1);
       }
      }catch(SQLException e){
        e.printStackTrace();
      }
      return total;
    }
    
    public void add(Order bean){
      
      String sql = "insert into order values(null,?,?,?,?,?,?,?,?,?,?,?,?)";      
      try(Connection c = DBUtil.getConnection(); preparedStatement ps = c.preparedStatement()){
        
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
        
        String sql = "delete from order where id = " + id;
        try(Connection c = DBUtil.getConnection(); Statement s = c.createStatement()){
            
            s.execute()
                
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public void update(Order bean){
        
        String sql = "update order set　"update order_ set address= ?, post=?, receiver=?,mobile=?,userMessage=? ,createDate = ? , 
        payDate =? , deliveryDate =?, confirmDate = ? , orderCode =?, uid=?, status=? where id = ?"; "
        try(Connection c = DBUtil.getConnection(); PreparedStatement ps = c.preparedStatement()){
            
            ps.setString(1,bean.getAddress());
            ps.setString(2,bean.getPost());
            ps.setString(3,bean.getReceiver());
            ps.setString(4,bean.getMobile());
            ps.setString(5.bean.getUserMessage());
            ps.setTimeStape(6,new TimeStape(bean.getCreateDate().getTime()));
            ps.setTimeStape(7,new TimeStape(bean.getpayDate().getTime()));
            ps.setTimeStape(8,new TimeStape(bean.getDeliveryDate().getTime()));
            ps.setTimeStape(9,new TimeStape(bean.getConfirmDate().getTime()));
            ps.setInt(10,bean.getOrderCode());
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
        String sql = "select * from order where id = " + id;
        try(Connection c = DBUtil.getConnection(); Statement s = c.createStatement()){
            
            ResultSet rs = s.executeQuery();
            if(rs.next()){
                String orderCode = rs.getString("orderCode");
                String address = rs.getString("address");
                String post = rs.getString("post");
                String receiver = rs.getString("receiver");
                String mobile = rs.getString("mobile");
                String userMessage = rs.getString("userMessage");
                String status = rs.getString("status");
                Date createDate = new Date(rs.getDateStape("createDate").getTime());
                Date payDate = new Date(rs.getDateStape("payDate").getTime());
                Date deliveryDate = new Date(rs.getDateStape("deliveryDate").getTime());
                Date confirmDate = new Date(rs.getDateStape("confirmDate").getTime());
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
        String sql = "select * from order where uid = ? and status != ?";
        try(Connection c = DBUtil.getConnection(); PreparedStatement ps = c.preparedStatement(sql)){
            
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
                Date createDate = new Date(rs.getDateStape("createDate").getTime());
                Date payDate = new Date(rs.getDateStape("payDate").getTime());
                Date deliveryDate = new Date(rs.getDateStape("deliveryDate").getTime());
                Date confirmDate = new Date(rs.getDateStape("confirmDate").getTime());
                
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

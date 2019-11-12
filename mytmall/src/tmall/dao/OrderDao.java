package tmall.dao;

public class OrderDao {
    
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
}

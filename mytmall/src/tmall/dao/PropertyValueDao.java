package tmall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import tmall.bean.Product;
import tmall.bean.Property;
import tmall.bean.PropertyValue;
import tmall.util.DBUtil;

public class PropertyValueDao {

	public int getTotal() {
		int total = 0;
		String sql = "select count(*) from propertyValue";

		try (Connection c = DBUtil.getConnection();Statement st = c.createStatement();){

			ResultSet result = st.executeQuery(sql);
			if(result.next()) {
				total = result.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return total;
	}

	public void add(PropertyValue bean) {

		String sql = "insert into propertyValue(null,?,?,?)";

		try(Connection c = DBUtil.getConnection();PreparedStatement ps =  c.prepareStatement(sql);){

			ps.setInt(1, bean.getProduct().getId());
			ps.setInt(2,bean.getProperty().getId());
			ps.setString(3, bean.getValue());
			ps.execute();

			ResultSet rs = ps.getGeneratedKeys();
			if(rs.next()){
				int id = rs.getInt(1);
				bean.setId(id);
			}
		}catch (SQLException e) {
			// TODO: handleexception
			e.printStackTrace();
		}
	}

	public void update(PropertyValue bean) {

		String sql = "update PropertyValue set pid = ?, ptid = ?, value = ? where id = ?";

		try(Connection c = DBUtil.getConnection();PreparedStatement ps = c.prepareStatement(sql);){

			ps.setInt(1, bean.getProduct().getId());
			ps.setInt(2, bean.getProperty().getId());
			ps.setString(3, bean.getValue());
			ps.setInt(4, bean.getId());
			ps.execute();

		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	public void delete(int id) {

		String sql = "delete from propertyValue where id = " + id;

		try(Connection c = DBUtil.getConnection(); Statement st = c.createStatement();){

			st.execute(sql);

		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	public PropertyValue get(int id) {

		PropertyValue pv = new PropertyValue();
		String sql = "select * from propertyValue where id = " + id;

		try(Connection c = DBUtil.getConnection(); Statement st = c.createStatement()) {

			ResultSet rs = st.executeQuery(sql);

			if(rs.next()) {
				int pid = rs.getInt("pid");
				int ptid = rs.getInt("ptid");
				String value = rs.getString("value");

				Product product = new ProductDao().get(pid);
				Property property = new PropertyDao().get(ptid);
				pv.setId(ptid);
				pv.setProduct(product);
				pv.setProperty(property);
				pv.setValue(value);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return pv;
	}

	public List<PropertyValue> list(int pid){

		List<PropertyValue> pvList = new ArrayList();
		String sql = "select * from propertyValue where pid=" + pid;

		try(Connection c = DBUtil.getConnection(); Statement st = c.createStatement()){

			ResultSet rs = st.executeQuery(sql);

			while(rs.next()) {
				PropertyValue bean = new PropertyValue();

				int id = rs.getInt("id");
				int ptid = rs.getInt("ptid");
				String value = rs.getString("value");

				Product product = new ProductDao().get(pid);
				Property property = new PropertyDao().get(ptid);
				bean.setId(id);
				bean.setProduct(product);
				bean.setProperty(property);
				bean.setValue(value);
				pvList.add(bean);
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return pvList;
	}
	
	public PropertyValue get(int ptid, int pid){
		
		PropertyValue ptv = null;
		String sql = "select * from propertyValue where ptid = ? and pid = ?";
		
		try(Connection c = DBUtil.getConnection(); PreparedStatement ps = c.preparedStatement(sql)){
			
			ps.setInt(1,ptid);
			ps.setInt(2,pid);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				ptv = new PropertyValue();
				int id = rs.getInt("id");
				String value = rs.getString("value");
				Property pt = new PropertyDao().get(ptid);
				Product p = new ProductDao().get(pid);
				
				ptv.setId(id);
				ptv.setValue(value);
				ptv.setProperty(pt);
				ptv.setProduct(p);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return ptv;
	}
	
	public void init(Product p){
		//商品を通して属性情報を取得　商品からカテゴリー取れる
		List<Property> pts = new PropertyDao.list(p.getCategory().getId());
		for(Property pt : pts){
			//商品IDと属性IDによって属性値とる
			PropertyValue pv = get(p.getId(),pt.getId());
			if(pv == null){
				pv = new PropertyValue();
				pv.setProduct(p);
				pv.setProperty(pt);
				this.add(pv);
			}
		}
	}
}

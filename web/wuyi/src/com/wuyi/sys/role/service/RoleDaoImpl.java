package com.wuyi.sys.role.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.wuyi.core.jdbc.DBUtil;
import com.wuyi.sys.register.User;
import com.wuyi.sys.role.RoleDao;

public class RoleDaoImpl implements RoleDao{

	private Connection connection ;
	private PreparedStatement ps;
	private ResultSet rs;
	private Role role;
	private int count;
	private List<Role> list=new ArrayList<>();
	private String jsonStr;
	@Override
	public String role_List(String role_name, String role_code) {
		// TODO Auto-generated method stub
		try {
			connection = DBUtil.getSQLConn();
			String sql="SELECT s.role_id,s.role_name,s.role_code,s.role_type,s.role_note FROM sys_p_role s WHERE 1=1";
			String sql_count="SELECT count(*) total FROM sys_p_role s WHERE 1=1";
			if(role_name!=null){
				sql+=" and s.role_name like '%"+role_name+"%'";
				sql_count+=" and s.role_name like '%"+role_name+"%'";
			}		
			if(role_code!=null){
				sql+=" and s.role_code like '%"+role_code+"%'";
				sql_count+=" and s.role_code like '%"+role_code+"%'";
			}
				
			ps= connection.prepareStatement(sql_count);
			rs = ps.executeQuery();
			
			while(rs.next()){
				count = rs.getInt("total");
				
				
			}
			System.out.println("1++"+count);
			ps= connection.prepareStatement(sql);
			rs = ps.executeQuery();
			//System.out.println(count);
			while(rs.next()){
				role=new Role();
				role.setRole_id(Integer.toString(rs.getInt("role_id")));
				role.setRole_name(rs.getString("role_name"));
				role.setRole_code(rs.getString("role_code"));
				role.setRole_type(Integer.toString(rs.getInt("role_type")));
				role.setRole_note(rs.getString("role_note"));
				list.add(role);
			}
			jsonStr="{\"total\":"+count+",\"rows\":"+JSON.toJSONString(list)+"}";
			
			System.out.println(jsonStr);
		//	System.out.println(jsonStr);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonStr;
	}
	@Override
	public boolean edit(String role_name,String role_code, int role_type, String role_note) {
		boolean flag=false;
		try {
			int role_id = 0;
			connection = DBUtil.getSQLConn();
			String sql_id="SELECT s.role_id FROM sys_p_role s WHERE s.role_name=? and s.role_code=?";
			ps = connection.prepareStatement(sql_id);
			ps.setString(1, role_name);
			ps.setString(2, role_code);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
				role_id=rs.getInt("role_id");
			String sql = "UPDATE sys_p_role SET role_name=?,role_type=?,role_note=? WHERE role_id=?";
			ps = connection.prepareStatement(sql);
			ps.setString(1, role_name);
			ps.setInt(2, role_type);
			ps.setString(3, role_note);
			ps.setInt(4, role_id);
			
			
			int result = ps.executeUpdate();
			flag=result==0?false:true;
			

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;

	}
	@Override
	public boolean del(String role_id) {
		boolean flag=false;
		try {
		connection=DBUtil.getSQLConn();
		
		String sql="DELETE FROM sys_p_role WHERE FIND_IN_SET(role_id,?)";
		ps=connection.prepareStatement(sql);
		ps.setString(1, role_id);
		
		int executeUpdate = ps.executeUpdate();
		flag=executeUpdate==0?false:true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	@Override
	public boolean add(String role_name, String role_code, int role_type, String role_note) {
		boolean flag=false;
		try {

			connection = DBUtil.getSQLConn();
			String sql = "INSERT INTO sys_p_role(role_name,role_code,role_type,role_note) VALUE (?,?,?,?)";
			ps = connection.prepareStatement(sql);
			ps.setString(1, role_name);
			ps.setString(2, role_code);
			ps.setInt(3, role_type);
			ps.setString(4, role_note);
			
			int result = ps.executeUpdate();
			flag=result==0?false:true;
			

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
//public static void main(String[] args) {
//	RoleDaoImpl roleDaoImpl=new RoleDaoImpl();
//	roleDaoImpl.role_List(null, null);
//}
}

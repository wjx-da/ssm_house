package com.chengxusheji.mapper;


import com.chengxusheji.po.Admin;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminMapper {
 
	public Admin findAdminByUserName(String username) throws Exception;
	
	public void changePassword(Admin admin) throws Exception;
	
	
	
}

package com.wanjiaxin.mapper;


import com.wanjiaxin.po.Admin;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminMapper {
 
	public Admin findAdminByUserName(String username) throws Exception;
	
	public void changePassword(Admin admin) throws Exception;
	
	
	
}
